# backend/collect_sao_paulo.py
import os
import pandas as pd
from datetime import datetime, timedelta
from dotenv import load_dotenv

load_dotenv()

from data.data_integration import fetch_combined_data_single

# Configuração
OUTPUT_FILE = "datasets/sao_paulo_2022_2024.csv"
START_DATE = "2022-01-01"
END_DATE = "2025-01-01"

# Credenciais
username = os.getenv("METEOMATICS_USERNAME")
password = os.getenv("METEOMATICS_PASSWORD")
assert username and password, "Credenciais não carregadas!"

# Gerar lista de datas
start = datetime.strptime(START_DATE, "%Y-%m-%d")
end = datetime.strptime(END_DATE, "%Y-%m-%d")
date_list = []
current = start
while current <= end:
    date_list.append(current.strftime("%Y-%m-%d"))
    current += timedelta(days=1)

print(f"📅 Coletando {len(date_list)} dias para São Paulo (2022–2024)...")

# Carregar progresso
existing_dates = set()
all_data = []
if os.path.exists(OUTPUT_FILE):
    try:
        df = pd.read_csv(OUTPUT_FILE)
        all_data = df.to_dict("records")
        existing_dates = {row["date"] for row in all_data}
        print(f"📥 Retomando: {len(all_data)} registros já coletados.")
    except Exception as e:
        print(f"⚠️ Erro ao carregar CSV: {e}")

# Filtrar datas pendentes
pending_dates = [d for d in date_list if d not in existing_dates]
print(f"➡️  Restam {len(pending_dates)} dias para coletar.")

# Coletar
for i, date in enumerate(pending_dates):
    try:
        print(f"[{i+1}/{len(pending_dates)}] Coletando {date}...")
        data = fetch_combined_data_single(
            zip_code="01000",
            lat=-23.5505,
            lon=-46.6333,
            date=date,
            username=username,
            password=password
        )
        data["date"] = date
        data["city"] = "São Paulo"
        data["country"] = "BRA"
        all_data.append(data)

        # Salvar a cada 20 registros
        if len(all_data) % 20 == 0:
            pd.DataFrame(all_data).to_csv(OUTPUT_FILE, index=False)
            print(f"💾 Salvo parcial: {len(all_data)} registros")

        # Respeitar rate limit
        import time
        time.sleep(4)  # 4s → ~15 requisições/minuto

    except Exception as e:
        print(f"❌ Erro em {date}: {e}")
        # Continua mesmo com erro

# Salvar final
pd.DataFrame(all_data).to_csv(OUTPUT_FILE, index=False)
print(f"\n✅ Coleta concluída! Total: {len(all_data)} registros em {OUTPUT_FILE}")