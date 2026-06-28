from config import ENGINE,DATA_RAW
import json
import pandas as pd
from datetime import datetime


def cargar_json_a_df():
    archivos = DATA_RAW.glob('*json')
    lista_datos = []

    for a in archivos:
        nombre_archivo = a.stem
        if nombre_archivo != 'temporadas_disponibles':
            liga,temp = a.stem.split("_")
            with open(a,encoding='utf-8') as f:
                data = json.load(f)
            for partido in data['matches']:
                fila = {
                    'id':partido['id'],
                    'utcdate': partido['utcDate'],
                    'status': partido['status'],
                    'matchday':partido['matchday'],
                    'home_team_id':partido['homeTeam']['id'],
                    'away_team_id':partido['awayTeam']['id'],
                    'lastupdated': partido['lastUpdated'],
                    'liga_archivo': liga,
                    'temporada_archivo':temp,
                    'fecha_carga':datetime.now(),
                    'payload_json':json.dumps(partido)
                }
                lista_datos.append(fila)
    return pd.DataFrame(lista_datos)

def filtrar_nuevos(df):
    id_existen = pd.read_sql("SELECT id FROM bronze.partidos", ENGINE)['id'].to_list()
    df_nuevos = df[~df['id'].isin(id_existen)]
    return df_nuevos

def cargar_a_sql(df):
    df_faltante = filtrar_nuevos(df)
    if df_faltante.empty:
        print("datos ya cargados con anterioridad")
    else:
        df_faltante.to_sql('partidos', con=ENGINE, schema='bronze', if_exists='append', index=False)
        print(f'carga completadas: {len(df_faltante)} filas procesadas')

if __name__ == '__main__':
    df = cargar_json_a_df()
    cargar_a_sql(df)
    
