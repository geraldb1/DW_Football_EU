WITH JORNADAS AS (SELECT
        id_competicion,
        id_temporada,
        jornada_partido,
        codlocal_partido AS id_equipo,
        goleslocal_partido AS goles_favor,
        golesvisitante_partido AS goles_contra,
        CASE resultado_partido
            WHEN 'HOME_TEAM' THEN 3
            WHEN 'DRAW' THEN 1
            ELSE 0
        END AS puntos

    FROM {{ref('fact_partido')}}
    WHERE estado_partido = 'FINISHED' OR estado_partido = 'AWARDED'

    UNION ALL

    -- Perspectiva del equipo VISITANTE
    SELECT
        id_competicion,
        id_temporada,
        jornada_partido,
        codvisitante_partido AS id_equipo,
        golesvisitante_partido AS goles_favor,
        goleslocal_partido AS goles_contra,
        CASE resultado_partido
            WHEN 'AWAY_TEAM' THEN 3
            WHEN 'DRAW' THEN 1
            ELSE 0
        END AS puntos

    FROM {{ref('fact_partido')}}
    WHERE estado_partido = 'FINISHED' OR estado_partido = 'AWARDED'
    )
SELECT 
    j.* ,
    SUM(j.puntos) OVER (
    PARTITION BY j.id_equipo,j.id_temporada,j.id_competicion 
    ORDER BY j.jornada_partido 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) 
    AS total_puntos,
        SUM(j.goles_favor) OVER (
    PARTITION BY j.id_equipo,j.id_temporada,j.id_competicion 
    ORDER BY j.jornada_partido 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) 
    AS total_goles_favor,
    SUM(j.goles_contra) OVER (
    PARTITION BY j.id_equipo,j.id_temporada,j.id_competicion 
    ORDER BY j.jornada_partido 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) 
    AS total_goles_contra
FROM JORNADAS j
