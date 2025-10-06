# api/evaluate_model.py
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report, confusion_matrix, accuracy_score
import joblib
from models.ml_model import train_model

# Carregar dataset
DATASET_PATH = "datasets/us_cities.csv"
print("📥 Loading dataset...")
df = pd.read_csv(DATASET_PATH)

# Verificar colunas essenciais
required_cols = ['pm25', 'o3', 'temperature', 'humidity', 'risk']
missing = [col for col in required_cols if col not in df.columns]
if missing:
    raise ValueError(f"Columns missing: {missing}")

# Remover linhas com dados inválidos (opcional, mas recomendado)
df = df.dropna(subset=required_cols)
df = df[(df['pm25'] >= 0) & (df['o3'] >= 0)]  # remover valores negativos (erros de API)

print(f"✅ Dataset loaded with {len(df)} valid records.")

# Separar features e alvo
X = df[['pm25', 'o3', 'temperature', 'humidity']]
y = df['risk']

# Dividir em treino e teste (80/20)
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42, stratify=y
)

print(f"🧠 Training model with {len(X_train)} samples...")
model = train_model(df)  # Usa a função existente que já salva o modelo

# Fazer previsões no conjunto de teste
y_pred = model.predict(X_test)

# Identificar classes reais presentes
unique_labels = sorted(y_test.unique())
target_names_map = {0: "Low risk", 1: "Medium risk", 2: "High risk"}
target_names = [target_names_map[label] for label in unique_labels]

# Métricas
acc = accuracy_score(y_test, y_pred)
cm = confusion_matrix(y_test, y_pred, labels=unique_labels)
report = classification_report(
    y_test, y_pred,
    labels=unique_labels,
    target_names=target_names,
    zero_division=0
)

# Exibir resultados
print("\n" + "="*60)
print("📊 MODEL EVALUATION (BASED ON WHO)")
print("="*60)
print(f"General Accuracy: {acc:.2%}")
print("\nConfusion Matrix:")
print(cm)
print("\nClasssification report:")
print(report)

# Salvar relatório em arquivo (opcional)
with open("models/evaluation_report.txt", "w", encoding="utf-8") as f:
    f.write(f"Accuracy: {acc:.2%}\n\n")
    f.write("Confusion Matrix:\n")
    f.write(str(cm))
    f.write("\n\nClasssification report:\n")
    f.write(report)

print("\n✅ Report saved at: models/evaluation_report.txt")