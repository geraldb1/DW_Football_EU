from config import API_TOKEN,URL_BASE,HEADERS,DATA_RAW,LIGAS,TEMP_HIST
from itertools import product

ligas_descargar = {}
def obtener_ligas_a_descargar():
    ligas_descargar.clear()  # Limpiar la lista antes de comenzar
    for temp, liga in product(TEMP_HIST, LIGAS):
        liga_temp = f"{temp}_{liga}"
        if liga_temp not in [f.stem for f in DATA_RAW.glob("*.json")]:
            ligas_descargar[liga] = (temp)
    return ligas_descargar

print("Ligas a descargar:", obtener_ligas_a_descargar())











