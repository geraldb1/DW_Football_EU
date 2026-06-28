SELECT
    DISTINCT
    JSON_VALUE(p.payload_json,'$.season.id') AS id_temporada,
    p.temporada_archivo AS temporada_temporada,
    JSON_VALUE(p.payload_json,'$.competition.code') AS liga_temporada,
    CAST(JSON_VALUE(p.payload_json,'$.season.startDate')AS DATE) AS inicio_temporada,
    CAST(JSON_VALUE(p.payload_json,'$.season.endDate')AS DATE) AS fin_temporada
FROM 
    {{source('season_football','partidos')}} AS p
