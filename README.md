# Shift Space – Respiratory Risk Prediction Backend

This backend provides a RESTful API to predict **respiratory risk** based on **air quality** (PM2.5, O₃) and **weather conditions** (temperature, humidity), using real-time data from the **Meteomatics API** and a machine learning model trained according to **WHO and EPA guidelines**.

Developed exclusively with the assistance of the AI **Qwen3-Max**, this system is designed to help public health systems proactively prepare for respiratory disease surges.

---

## ✨ Features

- **Respiratory risk prediction** in 3 levels:
  - **0 = Low**: Safe conditions
  - **1 = Moderate**: Sensitive groups should take precautions
  - **2 = High**: High risk of respiratory crises
- **Global support** for postal codes from:
  - Brazil (CEP: `01000-000`)
  - USA (ZIP: `10001`)
  - Canada, Mexico, Argentina, Chile, Colombia, Peru, Europe, and more
- **Automatic geocoding** via OpenCage Geocoder
- **Structured response** with public health recommendations
- **No database dependency** — all data fetched in real time

---

## 🛠️ Technologies Used

- **FastAPI** – Modern, high-performance web framework
- **Meteomatics API** – Air quality (`pm2p5:ugm3`, `o3:ugm3`) and weather data
- **OpenCage Geocoder** – Postal code → coordinates conversion
- **scikit-learn** – Machine Learning model (Random Forest)
- **Render** – Production deployment platform

---

## 📁 Project Structure
backend/
├── main.py # API endpoints
├── application.py # Render entry point
├── data/
│ ├── geocoding.py # Geocoding with cache
│ ├── weather.py # Meteomatics integration
│ └── data_integration.py # Data fusion + AQI conversion
├── models/
│ └── model.pkl # Trained model (do not commit if large)
├── requirements.txt # Dependencies
└── runtime.txt # Python version

---

## ⚙️ Local Setup

1. **Clone the repository**
2. **Create a virtual environment**:
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # Linux/Mac
   .venv\Scripts\activate     # Windows

Install dependencies:
pip install -r requirements.txt

Create .env in the backend/ folder:
METEOMATICS_USERNAME=your_username
METEOMATICS_PASSWORD=your_password
OPENCAGE_API_KEY=your_key

Start Server:
uvicorn main:app --reload

Access Documentation:
http://localhost:8000/docs

## 🌐Endpoints
GET /air-quality/{zip_code}
Returns current air quality for a postal code.

Examples:
curl http://localhost:8000/air-quality/01000-000

POST /predict-risk
Returns full respiratory risk assessment with health recommendations.

Request Body:
{
  "zip_code": "10001"
}

Response:
{
  "location": { "zip_code": "10001", "lat": 40.7128, "lon": -74.006, "country": "US" },
  "date": "2025-04-05",
  "air_quality": { "pm25_aqi": 56, "o3_aqi": 71 },
  "weather": { "temperature_c": 22.3, "humidity_percent": 65.1 },
  "health_risk": {
    "level": 1,
    "label": "Moderate",
    "recommendation": "Sensitive groups should limit prolonged outdoor exertion."
  }
}

## 🚀 Deployment
Platform: Render
Build Command: pip install -r backend/requirements.txt
Start Command: uvicorn backend.application:app --host 0.0.0.0 --port $PORT
Environment Variables: METEOMATICS_USERNAME, METEOMATICS_PASSWORD, OPENCAGE_API_KEY

## 📜 License
Project developed for public health purposes.
© 2025 Shift Space Team

Developed with exclusive support from AI Qwen3-Max. 