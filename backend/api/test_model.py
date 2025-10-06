# api/test_model.py
import pandas as pd
from models.ml_model import load_model, predict_risk


def main():
    print("🧪 Testando modelo de risco respiratório\n")

    # Carregar modelo treinado
    try:
        model = load_model()
        print("✅ Modelo carregado com sucesso!\n")
    except Exception as e:
        print(f"❌ Erro ao carregar modelo: {e}")
        return

    # Definir exemplos de teste realistas
    test_cases = [
        {
            "name": "Condições ideais (risco 0)",
            "pm25": 10,  # AQI bom
            "o3": 30,  # AQI bom
            "temperature": 22.0,
            "humidity": 60.0
        },
        {
            "name": "Poluição moderada (risco 1)",
            "pm25": 60,  # AQI insalubre para sensíveis
            "o3": 90,  # AQI insalubre para sensíveis
            "temperature": 28.0,
            "humidity": 70.0
        },
        {
            "name": "Crise respiratória (risco 2)",
            "pm25": 180,  # AQI muito insalubre
            "o3": 160,  # AQI muito insalubre
            "temperature": 35.0,
            "humidity": 25.0  # ar seco agrava asma
        },
        {
            "name": "São Paulo - agosto 2023 (evento real)",
            "pm25": 201,
            "o3": 95,
            "temperature": 24.1,
            "humidity": 45.0
        }
    ]

    # Fazer previsões
    risk_labels = {0: "Baixo", 1: "Médio", 2: "Alto"}
    recommendations = {
        0: "Condições seguras para atividades ao ar livre.",
        1: "Grupos sensíveis devem limitar esforço prolongado ao ar livre.",
        2: "Todos devem evitar atividades externas. Risco elevado de crises respiratórias."
    }

    for case in test_cases:
        features = [case["pm25"], case["o3"], case["temperature"], case["humidity"]]
        risk_level = predict_risk(model, features)
        label = risk_labels.get(risk_level, "Desconhecido")
        rec = recommendations.get(risk_level, "")

        print(f"📌 {case['name']}")
        print(f"   PM2.5 AQI: {case['pm25']}, O3 AQI: {case['o3']}")
        print(f"   Temperatura: {case['temperature']}°C, Umidade: {case['humidity']}%")
        print(f"   ➡️  Risco previsto: {risk_level} ({label})")
        print(f"   💡 {rec}\n")

    # Testar com dados reais do CSV (se disponível)
    try:
        df = pd.read_csv("datasets/sao_paulo_2022_2024.csv")
        if not df.empty:
            sample = df.iloc[0]
            features = [sample["pm25"], sample["o3"], sample["temperature"], sample["humidity"]]
            risk = predict_risk(model, features)
            print("📊 Exemplo real do dataset:")
            print(f"   Data: {sample.get('date', 'N/A')}")
            print(f"   Risco: {risk} ({risk_labels.get(risk, 'Desconhecido')})")
    except Exception as e:
        print(f"⚠️  Não foi possível testar com dados reais: {e}")

    print("\n✅ Teste concluído!")


if __name__ == "__main__":
    main()