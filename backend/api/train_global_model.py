# api/train_model.py
import pandas as pd
from models.ml_model import train_model
import os

# Caminhos dos datasets
DATASETS = [
    "datasets/sao_paulo_2022_2024.csv",
    "datasets/us_cities.csv"
]

# Verificar se os arquivos existem
for ds in DATASETS:
    if not os.path.exists(ds):
        raise FileNotFoundError(f"Dataset não encontrado: {ds}")

# Carregar e combinar
print("🌍 Carregando datasets...")
dfs = [pd.read_csv(ds) for ds in DATASETS]
df = pd.concat(dfs, ignore_index=True)

# Garantir colunas necessárias
required_cols = ['pm25', 'o3', 'temperature', 'humidity', 'risk']
missing = [col for col in required_cols if col not in df.columns]
if missing:
    raise ValueError(f"Colunas ausentes no dataset: {missing}")

# Remover linhas inválidas
df = df.dropna(subset=required_cols)
df = df[(df['pm25'] >= 0) & (df['o3'] >= 0)]

print(f"✅ Total de registros válidos: {len(df)}")
print("Distribuição do risco:")
print(df['risk'].value_counts().sort_index())

# Treinar modelo
print("\n🧠 Treinando modelo de risco respiratório...")
model = train_model(df)

print("\n🎉 Modelo treinado e salvo com sucesso!")
print("Local: models/model.pkl")