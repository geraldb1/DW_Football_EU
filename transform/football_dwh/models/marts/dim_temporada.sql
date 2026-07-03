SELECT
    s.id_temporada AS id,
    s.temporada_temporada AS temporada,
    s.liga_temporada AS liga,
    s.inicio_temporada AS fecha_inicio,
    s.fin_temporada AS fecha_fin
FROM {{ ref('stg_temporada') }} AS s