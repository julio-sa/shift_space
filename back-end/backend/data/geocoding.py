# backend/data/geocoding.py
import os
import json
import threading
from opencage.geocoder import OpenCageGeocode
from dotenv import load_dotenv

load_dotenv()
OPENCAGE_KEY = os.getenv("OPENCAGE_API_KEY")
CACHE_FILE = "data/geocode_cache.json"

# Cache em memória (thread-safe)
_cache = {}
_cache_lock = threading.Lock()


# Carregar cache persistente ao iniciar
def _load_cache():
    global _cache
    if os.path.exists(CACHE_FILE):
        try:
            with open(CACHE_FILE, "r", encoding="utf-8") as f:
                _cache.update(json.load(f))
        except Exception as e:
            print(f"⚠️  Erro ao carregar cache: {e}")


# Salvar cache persistente
def _save_cache():
    try:
        with open(CACHE_FILE, "w", encoding="utf-8") as f:
            json.dump(_cache, f, ensure_ascii=False, indent=2)
    except Exception as e:
        print(f"⚠️  Erro ao salvar cache: {e}")


# Carregar cache na importação
_load_cache()


def geocode_zip(zip_code: str, country_hint: str = None):
    """
    Converte CEP/código postal em coordenadas com cache.
    Suporta múltiplos países via OpenCage.
    """
    if not OPENCAGE_KEY:
        raise ValueError("OPENCAGE_API_KEY não configurada")

    # Normalizar chave de cache
    cache_key = f"{zip_code}_{country_hint or 'auto'}".lower()

    # Verificar cache em memória
    with _cache_lock:
        if cache_key in _cache:
            return _cache[cache_key]

    # Geocodificar
    geocoder = OpenCageGeocode(OPENCAGE_KEY)
    query = zip_code

    # Adicionar país se especificado
    if country_hint:
        country_names = {
            "BR": "Brazil",
            "US": "United States",
            "CA": "Canada",
            "MX": "Mexico",
            "AR": "Argentina",
            "CL": "Chile",
            "CO": "Colombia",
            "PE": "Peru",
            "UY": "Uruguay",
            "PY": "Paraguay",
            "BO": "Bolivia",
            "EC": "Ecuador",
            "VE": "Venezuela",
            "DE": "Germany",
            "FR": "France",
            "IT": "Italy",
            "ES": "Spain",
            "PT": "Portugal",
            "GB": "United Kingdom"
        }
        country_name = country_names.get(country_hint.upper(), country_hint)
        query = f"{zip_code}, {country_name}"

    try:
        results = geocoder.geocode(query)
        if results and len(results) > 0:
            result = {
                "lat": results[0]["geometry"]["lat"],
                "lon": results[0]["geometry"]["lng"],
                "country_code": results[0]["components"].get("country_code", "").upper(),
                "formatted": results[0]["formatted"]
            }

            # Salvar no cache
            with _cache_lock:
                _cache[cache_key] = result
                _save_cache()

            return result
    except Exception as e:
        print(f"Erro na geocodificação ({zip_code}): {e}")

    return None