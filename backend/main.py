# backend/main.py
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from datetime import datetime
from pydantic import BaseModel
from typing import Optional
from dotenv import load_dotenv
import os

from data.data_integration import fetch_combined_data_single
from data.geocoding import geocode_zip
from models.ml_model import load_model, predict_risk

app = FastAPI()
load_dotenv()

# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

meteomatics_username = os.getenv("METEOMATICS_USERNAME")
meteomatics_password = os.getenv("METEOMATICS_PASSWORD")

# ────────────────────────────────────────────────────────────────────────────────
# Helpers (rótulos e recomendações)
risk_labels = {0: "Baixo", 1: "Médio", 2: "Alto"}

def get_recommendation(risk_level: int) -> str:
    if risk_level == 0:
        return "Condições seguras para atividades ao ar livre."
    elif risk_level == 1:
        return "Grupos sensíveis (crianças, idosos, asmáticos) devem limitar esforço prolongado ao ar livre."
    else:
        return "Todos devem evitar atividades externas. Risco elevado de crises respiratórias."

def compute_simple_risk(pm25_aqi: float, o3_aqi: float) -> int:
    """
    Regras simples quando NÃO queremos carregar modelo:
      - level 0 (Baixo): ambos <= 50
      - level 1 (Médio): max(AQI) entre 51 e 100
      - level 2 (Alto): max(AQI) > 100
    """
    mx = max(pm25_aqi or 0, o3_aqi or 0)
    if mx <= 50:
        return 0
    if mx <= 100:
        return 1
    return 2

def detect_country_by_zip(zip_code: str) -> Optional[str]:
    """
    Dica de país pela forma do CEP/ZIP — simplificado para BR/US,
    evitando colisões com outros países de 5 dígitos.
    """
    clean = zip_code.replace("-", "").replace(" ", "")
    if len(clean) == 8 and clean.isdigit():
        return "BR"  # Brasil
    if (len(clean) == 5 or len(clean) == 9) and clean.isdigit():
        return "US"  # EUA (ZIP ou ZIP+4)
    return None
# ────────────────────────────────────────────────────────────────────────────────

class PredictionRequest(BaseModel):
    zip_code: str
    date: Optional[str] = None  # ISO YYYY-MM-DD

# Cache leve do modelo para não recarregar a cada POST
_model = None
def get_model():
    global _model
    if _model is None:
        _model = load_model()
    return _model

@app.get("/air-quality/{zip_code}")
def read_air_quality(zip_code: str):
    """
    Endpoint com CEP/ZIP no path + geocodificação automática.
    Retorna no formato padronizado + risco simples (sem ML).
    """
    country_hint = detect_country_by_zip(zip_code)
    geo = geocode_zip(zip_code, country_hint)
    if not geo:
        raise HTTPException(status_code=404, detail="Código postal não encontrado")

    date = datetime.utcnow().strftime("%Y-%m-%d")
    data = fetch_combined_data_single(
        zip_code, geo["lat"], geo["lon"], date,
        meteomatics_username, meteomatics_password
    )

    pm25 = data.get("pm25")
    o3 = data.get("o3")
    temp = data.get("temperature")
    hum = data.get("humidity")

    # risco simples (sem modelo) para este GET
    risk = compute_simple_risk(pm25, o3)

    return {
        "location": {"zip_code": zip_code, "lat": geo["lat"], "lon": geo["lon"]},
        "date": date,
        "air_quality": {"pm25_aqi": pm25, "o3_aqi": o3},
        "weather": {"temperature_c": temp, "humidity_percent": hum},
        "health_risk": {
            "level": risk,
            "label": risk_labels.get(risk, "Desconhecido"),
            "recommendation": get_recommendation(risk)
        }
    }

@app.post("/predict-risk")
def predict(request: PredictionRequest):
    """
    Endpoint que usa o modelo de ML para estimar o risco.
    Retorna no formato padronizado.
    """
    zip_code = request.zip_code
    date = request.date or datetime.utcnow().strftime("%Y-%m-%d")

    country_hint = detect_country_by_zip(zip_code)
    geo = geocode_zip(zip_code, country_hint)
    if not geo:
        raise HTTPException(status_code=404, detail="Código postal/CEP não encontrado")

    data = fetch_combined_data_single(
        zip_code, geo["lat"], geo["lon"], date,
        meteomatics_username, meteomatics_password
    )

    features = [
        data.get("pm25"),
        data.get("o3"),
        data.get("temperature"),
        data.get("humidity"),
    ]

    model = get_model()
    risk = predict_risk(model, features)

    return {
        "location": {"zip_code": zip_code, "lat": geo["lat"], "lon": geo["lon"]},
        "date": date,
        "air_quality": {"pm25_aqi": data.get("pm25"), "o3_aqi": data.get("o3")},
        "weather": {"temperature_c": data.get("temperature"), "humidity_percent": data.get("humidity")},
        "health_risk": {
            "level": int(risk) if isinstance(risk, (bool, int)) else risk,
            "label": risk_labels.get(int(risk), "Desconhecido"),
            "recommendation": get_recommendation(int(risk))
        }
    }
