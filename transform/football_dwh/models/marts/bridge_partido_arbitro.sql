SELECT
    id_partido,
    id_arbitro,
    nombre_arbitro,
    nacionalidad_arbitro
FROM {{ ref('stg_partidos_arbitros') }}