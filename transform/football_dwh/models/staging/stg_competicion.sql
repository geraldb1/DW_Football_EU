SELECT 
    DISTINCT 
    JSON_VALUE(p.payload_json,'$.competition.id') AS id_competicion,
    JSON_VALUE(p.payload_json,'$.competition.name') AS nombre_competicion,
    JSON_VALUE(p.payload_json,'$.competition.code') AS codigo_competicion,
    JSON_VALUE(p.payload_json,'$.area.name') AS pais_competicion
FROM {{source('season_football','partidos')}} AS p
