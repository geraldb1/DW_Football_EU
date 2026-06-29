WITH rango AS (
    SELECT 
        MIN(t.inicio_temporada) AS fecha_inicio,
        MAX(t.fin_temporada) AS fecha_fin
    FROM {{ ref('stg_temporada') }} AS t
),
numeros AS (
    SELECT 
        unidad.n + decena.n * 10 + centena.n * 100 + millar.n * 1000 AS numero
    FROM 
        (VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) AS unidad(n)
    CROSS JOIN
        (VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) AS decena(n)
    CROSS JOIN
        (VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) AS centena(n)
    CROSS JOIN
        (VALUES (0),(1)) AS millar(n)
)
SELECT 
    DATEADD(DAY, numeros.numero, rango.fecha_inicio) AS fecha
FROM numeros
CROSS JOIN rango
WHERE DATEADD(DAY, numeros.numero, rango.fecha_inicio) <= rango.fecha_fin