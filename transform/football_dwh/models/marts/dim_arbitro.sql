SELECT
    DISTINCT
    a.id_arbitro AS id,
    a.nombre_arbitro AS nombre_completo,
    a.nacionalidad_arbitro AS nacionalidad
FROM {{ ref('stg_partidos_arbitros') }} AS a
WHERE a.id_arbitro IS NOT NULL