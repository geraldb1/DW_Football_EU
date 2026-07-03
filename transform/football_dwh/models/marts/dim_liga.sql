SELECT
    s.id_competicion,
    s.codigo_competicion,
    s.nombre_competicion,
    m.nombre_comercial,
    s.pais_competicion
FROM {{ ref('stg_competicion') }} AS s
LEFT JOIN {{ ref('mapeo_nombres_liga') }} AS m
    ON s.codigo_competicion = m.codigo_competicion