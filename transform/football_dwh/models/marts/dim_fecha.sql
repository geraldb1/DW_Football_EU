SELECT
    f.fecha,
    YEAR(f.fecha) AS anio,
    MONTH(f.fecha) AS mes,
    DAY(f.fecha) AS dia,
    CASE
        WHEN MONTH(f.fecha) BETWEEN 1 AND 3 THEN 'Q1'
        WHEN MONTH(f.fecha) BETWEEN 4 AND 6 THEN 'Q2'
        WHEN MONTH(f.fecha) BETWEEN 7 AND 9 THEN 'Q3'
        ELSE 'Q4'
    END AS trimestre,
    DATEPART(ISO_WEEK, f.fecha) AS semana
FROM {{ ref('stg_fecha') }} AS f