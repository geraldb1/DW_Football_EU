SELECT 
    CAST(p.id AS INT) AS id_partido,
    arbitro.id_arbitro,
    arbitro.nombre_arbitro,
    arbitro.nacionalidad_arbitro
FROM {{ source('season_football', 'partidos') }} AS p
OUTER APPLY OPENJSON(p.payload_json, '$.referees')
    WITH (
        id_arbitro INT '$.id',
        nombre_arbitro VARCHAR(100) '$.name',
        nacionalidad_arbitro VARCHAR(100) '$.nationality'
    ) AS arbitro