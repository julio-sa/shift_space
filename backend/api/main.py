# api/main.py
from __future__ import annotations

import os
from datetime import datetime, timezone
from typing import Optional, Literal

from fastapi import FastAPI, HTTPException, Query
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from dotenv import load_dotenv

# zoneinfo: nativo em Py>=3.9; fallback para Py3.8
try:
    import zoneinfo  # type: ignore[attr-defined]
except Exception:  # pragma: no cover
    from backports import zoneinfo  # pip install backports.zoneinfo

# ── Imports do projeto (tolerantes a execução como pacote ou script) ────────────
try:
    # quando rodando como pacote: uvicorn api.main:app --reload
    from .data.data_integration import fetch_combined_data_single
    from .data.geocoding import geocode_zip
    from .models.ml_model import load_model, predict_risk
except Exception:  # quando rodando como script a partir da raiz
    from data.data_integration import fetch_combined_data_single
    from data.geocoding import geocode_zip
    from models.ml_model import load_model, predict_risk

# ── App & env ───────────────────────────────────────────────────────────────────
app = FastAPI(title="AirAware Events API", version="1.0.0")
load_dotenv()

# CORS amplo para MVP; restrinja em produção
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # defina origens confiáveis em produção
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

METEO_USERNAME = os.getenv("METEOMATICS_USERNAME")
METEO_PASSWORD = os.getenv("METEOMATICS_PASSWORD")

# ── Helpers (rótulos, regras e utilitários) ─────────────────────────────────────
risk_labels = {0: "Baixo", 1: "Médio", 2: "Alto"}

def get_recommendation(risk_level: int) -> str:
    if risk_level == 0:
        return "Condições seguras para atividades ao ar livre."
    if risk_level == 1:
        return "Grupos sensíveis (crianças, idosos, asmáticos) devem limitar esforço prolongado ao ar livre."
    return "Todos devem evitar atividades externas. Risco elevado de crises respiratórias."

def compute_simple_risk(pm25_aqi: float | int | None, o3_aqi: float | int | None) -> int:
    """
    Regras simples quando NÃO queremos carregar modelo:
      - 0 (Baixo): max(AQI) <= 50
      - 1 (Médio): 51 <= max(AQI) <= 100
      - 2 (Alto):  max(AQI) > 100
    """
    pm25 = float(pm25_aqi or 0)
    o3 = float(o3_aqi or 0)
    mx = max(pm25, o3)
    if mx <= 50:
        return 0
    if mx <= 100:
        return 1
    return 2

def detect_country_by_zip(zip_code: str) -> Optional[str]:
    """
    Heurística simples BR/US para CEP/ZIP.
    """
    clean = zip_code.replace("-", "").replace(" ", "")
    if len(clean) == 8 and clean.isdigit():
        return "BR"  # Brasil
    if (len(clean) == 5 or len(clean) == 9) and clean.isdigit():
        return "US"  # EUA (ZIP ou ZIP+4)
    return None

def _parse_ts(ts: str, tzname: Optional[str]) -> datetime:
    """
    Aceita '2025-10-05T13:00:00-03:00' OU '2025-10-05T13:00:00' + tz.
    Normaliza para UTC.
    """
    try:
        dt = datetime.fromisoformat(ts)
    except Exception:
        raise HTTPException(status_code=400, detail=f"Timestamp inválido: {ts}")
    if dt.tzinfo is None:
        if not tzname:
            raise HTTPException(status_code=400, detail="Faltou timezone (tz) ou offset no timestamp.")
        dt = dt.replace(tzinfo=zoneinfo.ZoneInfo(tzname))
    return dt.astimezone(timezone.utc)

def _parse_iso_date(d: str) -> str:
    """Valida e normaliza uma data YYYY-MM-DD; lança 400 se inválida."""
    try:
        dt = datetime.strptime(d, "%Y-%m-%d")
        return dt.strftime("%Y-%m-%d")
    except Exception:
        raise HTTPException(status_code=400, detail=f"Data inválida (use YYYY-MM-DD): {d}")

# ── Modelos Pydantic (requests) ────────────────────────────────────────────────
class PredictionRequest(BaseModel):
    zip_code: str
    date: Optional[str] = None  # ISO YYYY-MM-DD

class EventWindow(BaseModel):
    start: str  # ISO 8601 (ex.: "2025-10-05T13:00:00-03:00")
    end: str    # ISO 8601
    tz: Optional[str] = None    # "America/Sao_Paulo" (se start/end sem offset)

class EventAssessRequest(BaseModel):
    zip_code: str
    window: EventWindow
    audience: Literal["general", "sensitive"] = "general"

# ── Cache leve do modelo ───────────────────────────────────────────────────────
_model = None
def get_model():
    global _model
    if _model is None:
        _model = load_model()
    return _model

# ── Healthcheck simples ────────────────────────────────────────────────────────
# Em main.py, adicione esta função
@app.get("/")
def root():
    return {
        "message": "Shift Space API - Respiratory Risk Prediction",
        "docs": "/docs"
    }

# ── Endpoints ──────────────────────────────────────────────────────────────────
@app.get("/air-quality/{zip_code}")
def read_air_quality(
    zip_code: str,
    date: Optional[str] = Query(None, description="YYYY-MM-DD (default: hoje em UTC)"),
):
    """
    Snapshot simples por CEP/ZIP. Retorna formato padronizado + risco simples (sem ML).
    """
    # Geocodificação
    country_hint = detect_country_by_zip(zip_code)
    geo = geocode_zip(zip_code, country_hint)
    if not geo:
        raise HTTPException(status_code=404, detail="Código postal não encontrado")

    # Data (YYYY-MM-DD)
    if date:
        date = _parse_iso_date(date)
    else:
        date = datetime.utcnow().strftime("%Y-%m-%d")

    # Agregação de dados externos
    data = fetch_combined_data_single(
        zip_code, geo["lat"], geo["lon"], date,
        METEO_USERNAME, METEO_PASSWORD
    )

    pm25 = float(data.get("pm25") or 0)
    o3   = float(data.get("o3") or 0)
    temp = data.get("temperature")
    hum  = data.get("humidity")

    # risco simples (sem ML)
    risk = compute_simple_risk(pm25, o3)

    return {
        "location": {"zip_code": zip_code, "lat": geo["lat"], "lon": geo["lon"]},
        "date": date,
        "air_quality": {"pm25_aqi": pm25, "o3_aqi": o3},
        "weather": {"temperature_c": temp, "humidity_percent": hum},
        "health_risk": {
            "level": risk,
            "label": risk_labels.get(risk, "Desconhecido"),
            "recommendation": get_recommendation(risk),
        },
    }

@app.post("/predict-risk")
def predict(request: PredictionRequest):
    """
    Usa o modelo de ML para estimar risco (sem janela de horário).
    Retorna no formato padronizado.
    """
    zip_code = request.zip_code
    date = request.date or datetime.utcnow().strftime("%Y-%m-%d")
    date = _parse_iso_date(date)

    country_hint = detect_country_by_zip(zip_code)
    geo = geocode_zip(zip_code, country_hint)
    if not geo:
        raise HTTPException(status_code=404, detail="Código postal/CEP não encontrado")

    data = fetch_combined_data_single(
        zip_code, geo["lat"], geo["lon"], date,
        METEO_USERNAME, METEO_PASSWORD
    )

    features = [
        float(data.get("pm25") or 0),
        float(data.get("o3") or 0),
        float(data.get("temperature") or 0),
        float(data.get("humidity") or 0),
    ]

    model = get_model()
    risk_pred = predict_risk(model, features)
    try:
        risk_int = int(risk_pred)
    except Exception:
        raise HTTPException(status_code=500, detail="Modelo retornou formato de risco inválido")

    return {
        "location": {"zip_code": zip_code, "lat": geo["lat"], "lon": geo["lon"]},
        "date": date,
        "air_quality": {"pm25_aqi": float(data.get("pm25") or 0), "o3_aqi": float(data.get("o3") or 0)},
        "weather": {"temperature_c": data.get("temperature"), "humidity_percent": data.get("humidity")},
        "health_risk": {
            "level": risk_int,
            "label": risk_labels.get(risk_int, "Desconhecido"),
            "recommendation": get_recommendation(risk_int),
        },
    }

@app.post("/events/assess")
def assess_event(req: EventAssessRequest):
    """
    Avalia risco considerando a janela do evento (horários no body).
    Normaliza timestamps para UTC e retorna payload padrão + eco da janela.
    """
    # 1) Geocodificação
    country_hint = detect_country_by_zip(req.zip_code)
    geo = geocode_zip(req.zip_code, country_hint)
    if not geo:
        raise HTTPException(status_code=404, detail="CEP/ZIP não encontrado")

    # 2) Normalizar janela para UTC
    dt_start_utc = _parse_ts(req.window.start, req.window.tz)
    dt_end_utc   = _parse_ts(req.window.end, req.window.tz)
    if dt_end_utc <= dt_start_utc:
        raise HTTPException(status_code=400, detail="end deve ser maior que start")

    # 3) Buscar dados (exemplo: dia do início da janela)
    date = dt_start_utc.strftime("%Y-%m-%d")
    data = fetch_combined_data_single(
        req.zip_code, geo["lat"], geo["lon"], date,
        METEO_USERNAME, METEO_PASSWORD
    )

    # 4) Risco via ML (pode customizar por 'audience' se quiser rebaixar)
    features = [
        float(data.get("pm25") or 0),
        float(data.get("o3") or 0),
        float(data.get("temperature") or 0),
        float(data.get("humidity") or 0),
    ]
    model = get_model()
    risk = int(predict_risk(model, features))

    # 5) Montar resposta base
    base_payload = {
        "location": {"zip_code": req.zip_code, "lat": geo["lat"], "lon": geo["lon"]},
        "date": date,
        "air_quality": {"pm25_aqi": float(data.get("pm25") or 0), "o3_aqi": float(data.get("o3") or 0)},
        "weather": {"temperature_c": data.get("temperature"), "humidity_percent": data.get("humidity")},
        "health_risk": {
            "level": risk,
            "label": risk_labels.get(risk, "Desconhecido"),
            "recommendation": get_recommendation(risk),
        },
    }

    return {
        **base_payload,
        "window": {
            "start_utc": dt_start_utc.isoformat(),
            "end_utc": dt_end_utc.isoformat(),
            "tz": req.window.tz,
        },
        "audience": req.audience,
    }
