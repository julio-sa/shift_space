import joblib
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split

def train_model(df):
    X = df[['pm25', 'o3', 'temperature', 'humidity']]
    y = df['risk']
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    model = RandomForestClassifier(n_estimators=100)
    model.fit(X_train, y_train)
    accuracy = model.score(X_test, y_test)
    print(f"Acurácia do modelo: {accuracy}")
    joblib.dump(model, "models/model.pkl")  # ou "backend/models/model.pkl" se preferir
    return model

def load_model():
    return joblib.load("models/model.pkl")

def predict_risk(model, features):
    import pandas as pd
    feature_names = ['pm25', 'o3', 'temperature', 'humidity']
    X = pd.DataFrame([features], columns=feature_names)
    return model.predict(X)[0]