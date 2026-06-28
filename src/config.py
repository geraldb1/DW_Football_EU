from pathlib import Path
import os
from dotenv import load_dotenv
from sqlalchemy import create_engine

load_dotenv()

# Variables de entorno .env
API_TOKEN = os.getenv('API_TOKEN')
DB_SERVER = os.getenv('DB_SERVER')
DB_NAME = os.getenv('DB_NAME')

# Configuración de la conexión al API
URL_BASE = 'https://api.football-data.org/v4'
HEADERS = {'X-Auth-Token': API_TOKEN}

#Conexion a la base de datos
CONNECTION_STRING = (
    f"mssql+pyodbc://@{DB_SERVER}/{DB_NAME}"
    "?driver=ODBC+Driver+17+for+SQL+Server"
    "&trusted_connection=yes"
)
ENGINE = create_engine(CONNECTION_STRING)

BASE_DIR = Path(__file__).parent.parent
#crear carpeta data/raw si no existe
os.makedirs(BASE_DIR / "data" / "raw", exist_ok=True)
DATA_RAW = BASE_DIR / "data" / "raw"

# Configuración de las temporadas y ligas a consultar
LIGAS = ["PL", "PD", "BL1", "SA", "FL1"]
TEMP_HIST = [2023, 2024, 2025]

