SELECT 
    JSON_VALUE(p1.payload_json,'$.homeTeam.id') AS id_equipo,
    JSON_VALUE(p1.payload_json,'$.homeTeam.name') AS nombre_equipo,
    JSON_VALUE(p1.payload_json,'$.homeTeam.shortName') AS nombrecorto_equipo,
    JSON_VALUE(p1.payload_json,'$.homeTeam.tla') AS tla_equipo
FROM {{source('season_football', 'partidos') }} AS p1
UNION 
SELECT 
    JSON_VALUE(p2.payload_json,'$.awayTeam.id') AS id_equipo,
    JSON_VALUE(p2.payload_json,'$.awayTeam.name') AS nombre_equipo,
    JSON_VALUE(p2.payload_json,'$.awayTeam.shortName') AS nombrecorto_equipo,
    JSON_VALUE(p2.payload_json,'$.awayTeam.tla') AS tla_equipo
FROM {{ source('season_football', 'partidos') }} AS p2