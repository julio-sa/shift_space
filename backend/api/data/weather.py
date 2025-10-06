# api/data/weather.py
import requests
from requests.auth import HTTPBasicAuth
import time
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry


def get_weather_data_meteomatics(lat, lon, date, username, password):
    """
    Busca dados climáticos para uma única data.
    """
    # 🔥 REMOVA OS ESPAÇOS NA URL!
    url = f"https://api.meteomatics.com/{date}T00:00:00Z/t_2m:C,relative_humidity_2m:p/{lat},{lon}/json"
    try:
        response = requests.get(url, auth=HTTPBasicAuth(username, password), timeout=10)
        if response.status_code == 200:
            return response.json()
        else:
            print(f"Erro Meteomatics ({response.status_code}) em {date}: {response.text[:200]}")
            return None
    except Exception as e:
        print(f"Exceção na Meteomatics (data única): {e}")
        return None


def get_weather_data_meteomatics_interval(lat, lon, start_date, end_date, username, password):
    """
    Busca dados climáticos em um intervalo de datas (diário).
    """
    interval = f"{start_date}T00:00:00Z--{end_date}T00:00:00Z:PT24H"
    # 🔥 REMOVA OS ESPAÇOS NA URL!
    url = f"https://api.meteomatics.com/{interval}/t_2m:C,relative_humidity_2m:p/{lat},{lon}/json"

    try:
        response = requests.get(url, auth=HTTPBasicAuth(username, password), timeout=30)
        if response.status_code == 200:
            return response.json()
        else:
            print(f"Erro Meteomatics intervalo ({response.status_code}): {response.text[:200]}")
            return None
    except Exception as e:
        print(f"Exceção na Meteomatics (intervalo): {e}")
        return None

def get_air_quality_meteomatics(lat, lon, date, username, password, max_retries=3):
    url = f"https://api.meteomatics.com/{date}T00:00:00Z/pm2p5:ugm3,o3:ugm3/{lat},{lon}/json"

    # Configurar sessão com retries
    session = requests.Session()
    retry_strategy = Retry(
        total=max_retries,
        backoff_factor=2,  # 2s, 4s, 8s...
        status_forcelist=[429, 500, 502, 503, 504],
    )
    adapter = HTTPAdapter(max_retries=retry_strategy)
    session.mount("https://", adapter)

    try:
        response = session.get(
            url,
            auth=HTTPBasicAuth(username, password),
            timeout=15
        )
        if response.status_code == 200:
            data = response.json()
            pm25_ugm3 = data["data"][0]["coordinates"][0]["dates"][0]["value"]
            o3_ugm3 = data["data"][1]["coordinates"][0]["dates"][0]["value"]
            return {"pm25_ugm3": pm25_ugm3, "o3_ugm3": o3_ugm3}
        else:
            print(f"Erro qualidade do ar ({response.status_code}) em {date}")
            return {"pm25_ugm3": 0, "o3_ugm3": 0}
    except Exception as e:
        print(f"Exceção na qualidade do ar Meteomatics ({date}): {e}")
        return {"pm25_ugm3": 0, "o3_ugm3": 0}
    finally:
        session.close()