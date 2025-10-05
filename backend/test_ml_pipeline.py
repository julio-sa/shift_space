# backend/test_ml_pipeline.py
import pandas as pd
from models.ml_model import train_model, load_model, predict_risk

# Simular um dataset mínimo com dados da Meteomatics (AQI convertido)
test_data = [
    {"zip_code": "10001", "date": "2025-10-04", "pm25": 56, "o3": 71, "temperature": 22.3, "humidity": 65.1},
    {"zip_code": "01000", "date": "2025-10-04", "pm25": 30, "o3": 45, "temperature": 28.1, "humidity": 70.2},
]

df = pd.DataFrame(test_data)
df['risk'] = df.apply(lambda row: 1 if row['pm25'] > 50 or row['o3'] > 70 else 0, axis=1)

# Treinar
model = train_model(df)
print("✅ Modelo treinado com dados simulados (AQI).")

# Testar previsão
features = [56, 71, 22.3, 65.1]
risk = predict_risk(model, features)
print(f"🔮 Previsão de risco: {risk} (0=Baixo, 1=Médio, 2=Alto)")