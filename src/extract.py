from config import URL_BASE,HEADERS,DATA_RAW,LIGAS,TEMP_HIST
from itertools import product
import requests
import json
from time import sleep


def ligas_a_descargar():
    ligas_descargar = []
    for temp, liga in product(TEMP_HIST, LIGAS):
        liga_temp = f"{liga}_{temp}"
        if liga_temp not in [f.stem for f in DATA_RAW.glob("*.json")]:
            ligas_descargar.append((liga, temp))
    return ligas_descargar


def descargar_ligas_temporadas():
    pendientes = ligas_a_descargar()
    if not pendientes:
        print("No hay ligas pendientes de descargar.")
        return
    print(f"Se van a descargar {len(pendientes)} ligas/temporadas.")

    for liga,temp in ligas_a_descargar():
        url_partidos = f"{URL_BASE}/competitions/{liga}/matches"
        response = requests.get(url_partidos,headers = HEADERS, params = {"season": temp})
        disponibles = int(response.headers.get("X-Requests-Available-Minute"))
        reset_seg = int(response.headers.get("X-RequestCounter-Reset"))

        if (response.status_code == 200 ):
            with open(DATA_RAW / f"{liga}_{temp}.json", "w") as f:
                json.dump(response.json(), f,indent = 2)
            print(f"Descargado {liga} temporada {temp} - Solicitudes restantes: {disponibles}")
        else:
            print(f"Error al descargar {liga} temporada {temp}: {response.status_code} - {response.text}")

        if disponibles <2:
            print(f"Se han agotado las solicitudes disponibles. Esperando {reset_seg} segundos...")
            sleep(reset_seg)
    print("Descarga completada")


if __name__ == "__main__":
    print("Ligas a descargar:", ligas_a_descargar())
    descargar_ligas_temporadas()






