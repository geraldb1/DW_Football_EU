from extract import descargar_ligas_temporadas
from load import cargar_json_a_df,cargar_a_sql

print('###'*20)
print('Paso 1: Revisando si se requiere descargar json')

print('-------------------')


descargar_ligas_temporadas()
print('###'*20)
print('Paso 2: Cargando los datos')

df = cargar_json_a_df()

print('Se consolido los archivos de liga_temporada')


print('###'*20)
print('Paso 3: Pasando los datos al SQL SERVER')

cargar_a_sql(df)
print('Se completo la carga de datos a la capa bronce')

