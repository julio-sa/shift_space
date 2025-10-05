# backend/collect_historical_data.py
import os
import pandas as pd
from datetime import datetime, timedelta
from dotenv import load_dotenv

load_dotenv()

from data.data_integration import fetch_combined_data_interval

# Credenciais
meteomatics_username = os.getenv("METEOMATICS_USERNAME")
meteomatics_password = os.getenv("METEOMATICS_PASSWORD")
assert meteomatics_username and meteomatics_password, "Credenciais não carregadas!"

# Configuração
DAYS_BACK = 133
OUTPUT_FILE = "datasets/us_cities.csv"

# Intervalo de datas
end_date = datetime.now().date()
start_date = end_date - timedelta(days=DAYS_BACK)
start_str = start_date.strftime("%Y-%m-%d")
end_str = end_date.strftime("%Y-%m-%d")

print(f"📅 Coletando dados de {start_str} a {end_str} ({DAYS_BACK} dias)")

# Carregar progresso existente
existing_keys = set()
all_data = []

if os.path.exists(OUTPUT_FILE) and os.path.getsize(OUTPUT_FILE) > 0:
    try:
        existing_df = pd.read_csv(OUTPUT_FILE)
        all_data = existing_df.to_dict("records")
        existing_keys = {(r["zip_code"], r["date"]) for r in all_data}
        print(f"📥 Retomando coleta: {len(all_data)} registros já coletados.")
    except Exception as e:
        print(f"⚠️ Erro ao carregar CSV existente: {e}. Iniciando do zero.")
        all_data = []
        existing_keys = set()

# Coletar por cidade
for idx, city in cities_df.iterrows():
    zip_code = str(city["zip_code"])
    lat, lon = city["lat"], city["lon"]

    fully_collected = True
    for i in range((end_date - start_date).days + 1):
        date = (start_date + timedelta(days=i)).strftime("%Y-%m-%d")
        if (zip_code, date) not in existing_keys:
            fully_collected = False
            break

    if fully_collected:
        print(f"⏭️  Cidade {zip_code} já coletada. Pulando...")
        continue

    print(f"🌆 Coletando cidade {idx+1}/{len(cities_df)}: {zip_code} ({lat}, {lon})")

    try:
        city_data = fetch_combined_data_interval(
            zip_code, lat, lon, start_str, end_str,
            meteomatics_username, meteomatics_password
        )

        new_records = [
            r for r in city_data
            if (r["zip_code"], r["date"]) not in existing_keys
        ]

        if new_records:
            all_data.extend(new_records)
            existing_keys.update((r["zip_code"], r["date"]) for r in new_records)
            pd.DataFrame(all_data).to_csv(OUTPUT_FILE, index=False)
            print(f"✅ Adicionados {len(new_records)} novos registros para {zip_code}")

    except Exception as e:
        print(f"❌ Erro na cidade {zip_code}: {e}")

print(f"\n✅ Coleta concluída! Total de registros: {len(all_data)}")