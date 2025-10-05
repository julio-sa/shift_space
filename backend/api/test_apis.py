# api/test_apis.py
import os
from datetime import datetime, timezone
from dotenv import load_dotenv

# Carrega variáveis de ambiente
load_dotenv()

from data.air_quality import get_air_quality
from data.weather import get_weather_data_meteomatics
from data.data_integration import fetch_combined_data, build_dataframe
from models.ml_model import train_model, load_model, predict_risk

# Credenciais
airnow_api_key = os.getenv("AIRNOW_API_KEY")
meteomatics_username = os.getenv("METEOMATICS_USERNAME")
meteomatics_password = os.getenv("METEOMATICS_PASSWORD")

# Validação
assert meteomatics_username, "METEOMATICS_USERNAME não definido"
assert meteomatics_password, "METEOMATICS_PASSWORD não definido"

# Dados de teste
zip_code = "10001"
lat, lon = 40.7128, -74.0060
# Use data de HOJE (não futura!)
current_date = datetime.now(timezone.utc).strftime("%Y-%m-%d")

print("🔍 Testando AirNow API...")
air = get_air_quality(zip_code)
print("AirNow:", air)

print("\n🌤️ Testando Meteomatics API...")
weather = get_weather_data_meteomatics(lat, lon, current_date, meteomatics_username, meteomatics_password)
print("Meteomatics:", "OK" if weather else "Falhou")

print("\n🔗 Testando integração completa...")
combined = fetch_combined_data(
    zip_code, lat, lon, current_date, meteomatics_username, meteomatics_password
)
print("Dados combinados:", combined)

# ============ TREINAMENTO (só para teste) ============
print("\n" + "="*50)
print("🧪 INICIANDO TESTE DE TREINAMENTO")

# Agora 'combined' existe!
data_list = [combined] * 10  # ⚠️ Só para evitar erro de 1 amostra

df = build_dataframe(data_list)
print("\n📊 DataFrame:")
print(df)

print("\n🧠 Treinando modelo...")
model = train_model(df)
print("✅ Modelo salvo!")

print("\n🔮 Testando previsão...")
features = [combined["pm25"], combined["o3"], combined["temperature"], combined["humidity"]]
risk = predict_risk(model, features)
print("Risco previsto:", risk, "(0=Baixo, 1=Médio, 2=Alto)")