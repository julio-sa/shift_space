# api/data/data_integration.py
import pandas as pd
import time
from .weather import get_air_quality_meteomatics, get_weather_data_meteomatics, get_weather_data_meteomatics_interval

# === CONVERSÃO: µg/m³ e ppb → AQI (EPA) ===

def pm25_ugm3_to_aqi(pm25_ugm3):
    """Converte PM2.5 (µg/m³) para AQI (EPA)"""
    if pm25_ugm3 <= 12.0:
        return round((50 / 12.0) * pm25_ugm3)
    elif pm25_ugm3 <= 35.4:
        return round(50 + (50 / 23.4) * (pm25_ugm3 - 12.0))
    elif pm25_ugm3 <= 55.4:
        return round(100 + (50 / 19.9) * (pm25_ugm3 - 35.4))
    elif pm25_ugm3 <= 150.4:
        return round(150 + (50 / 94.9) * (pm25_ugm3 - 55.4))
    elif pm25_ugm3 <= 250.4:
        return round(200 + (100 / 99.9) * (pm25_ugm3 - 150.4))
    elif pm25_ugm3 <= 350.4:
        return round(300 + (100 / 99.9) * (pm25_ugm3 - 250.4))
    else:
        return 500  # AQI máximo

def o3_ugm3_to_ppb(o3_ugm3, temperature_c=25):
    """
    Converte O3 de µg/m³ para ppb (aproximação a 25°C).
    Fórmula: ppb = (µg/m³ * 24.45) / MW, onde MW(O3) = 48
    """
    return (o3_ugm3 * 24.45) / 48.0

def o3_ugm3_to_aqi(o3_ugm3):
    """Converte O3 (µg/m³) para AQI usando aproximação via ppb."""
    o3_ppb = o3_ugm3_to_ppb(o3_ugm3)
    if o3_ppb <= 54:
        return round((50 / 54) * o3_ppb)
    elif o3_ppb <= 70:
        return round(50 + (50 / 16) * (o3_ppb - 54))
    elif o3_ppb <= 85:
        return round(100 + (50 / 15) * (o3_ppb - 70))
    elif o3_ppb <= 105:
        return round(150 + (50 / 19) * (o3_ppb - 85))
    elif o3_ppb <= 200:
        return round(200 + (100 / 94) * (o3_ppb - 105))
    else:
        return 500

# === FUNÇÕES DE COLETA ===

def fetch_combined_data_interval(zip_code, lat, lon, start_date, end_date, username, password):
    """
    Coleta dados de QUALIDADE DO AR + CLIMA diretamente da Meteomatics para um intervalo.
    Funciona globalmente (EUA, Brasil, etc.).
    """
    from datetime import datetime, timedelta

    # Gerar todas as datas no intervalo
    start = datetime.strptime(start_date, "%Y-%m-%d").date()
    end = datetime.strptime(end_date, "%Y-%m-%d").date()
    date_range = []
    current = start
    while current <= end:
        date_range.append(current.strftime("%Y-%m-%d"))
        current += timedelta(days=1)

    # Obter dados climáticos (temperatura, umidade) para todo o intervalo
    weather_response = get_weather_data_meteomatics_interval(lat, lon, start_date, end_date, username, password)
    weather_map = {}
    if weather_response and "data" in weather_response:
        temp_data = weather_response["data"][0]["coordinates"][0]["dates"]
        humidity_data = weather_response["data"][1]["coordinates"][0]["dates"]
        for t, h in zip(temp_data, humidity_data):
            date_key = t["date"].split("T")[0]
            weather_map[date_key] = (t["value"], h["value"])

    # Coletar dados diários (poluentes + clima)
    results = []
    for date in date_range:
        # 1. Qualidade do ar (PM2.5, O3)
        air_data = get_air_quality_meteomatics(lat, lon, date, username, password)
        pm25_aqi = pm25_ugm3_to_aqi(air_data["pm25_ugm3"])
        o3_aqi = o3_ugm3_to_aqi(air_data["o3_ugm3"])

        # 2. Clima (temperatura, umidade)
        temp, humidity = weather_map.get(date, (0, 0))

        # 3. Montar registro
        combined = {
            "zip_code": zip_code,
            "date": date,
            "pm25": pm25_aqi,
            "o3": o3_aqi,
            "temperature": temp,
            "humidity": humidity,
        }
        combined["risk"] = classify_risk(combined)
        results.append(combined)

        time.sleep(1)  # respeitar rate limit

    return results


def fetch_combined_data_single(zip_code: str, lat: float, lon: float, date: str, username: str, password: str):
    """Obtém dados ambientais para UM dia específico."""

    # Qualidade do ar
    air = get_air_quality_meteomatics(lat, lon, date, username, password)
    pm25_aqi = pm25_ugm3_to_aqi(air["pm25_ugm3"])
    o3_aqi = o3_ugm3_to_aqi(air["o3_ugm3"])

    # Clima
    weather = get_weather_data_meteomatics(lat, lon, date, username, password)
    temp = weather["data"][0]["coordinates"][0]["dates"][0]["value"] if weather else 0
    humidity = weather["data"][1]["coordinates"][0]["dates"][0]["value"] if weather else 0

    return {
        "pm25": pm25_aqi,
        "o3": o3_aqi,
        "temperature": temp,
        "humidity": humidity
    }

# === CLASSIFICAÇÃO DE RISCO (OMS/EPA) ===

def classify_risk(row):
    pm25_aqi = row['pm25']
    o3_aqi = row['o3']
    risk_level = 0

    if pm25_aqi > 150:
        risk_level = max(risk_level, 2)
    elif pm25_aqi > 100:
        risk_level = max(risk_level, 1)

    if o3_aqi > 150:
        risk_level = max(risk_level, 2)
    elif o3_aqi > 100:
        risk_level = max(risk_level, 1)

    if pm25_aqi > 100 and o3_aqi > 100:
        risk_level = 2

    temp = row['temperature']
    humidity = row['humidity']

    if (temp > 32 or temp < -5) and (pm25_aqi > 100 or o3_aqi > 100):
        risk_level = max(risk_level, 2)

    if humidity < 30 and (pm25_aqi > 50 or o3_aqi > 50):
        risk_level = max(risk_level, 1)

    return risk_level