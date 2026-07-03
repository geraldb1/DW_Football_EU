SELECT
    e.id_equipo AS id,
    e.nombre_equipo AS nombre,
    e.nombrecorto_equipo AS nombre_corto,
    e.tla_equipo AS tla
FROM {{ref('stg_equipo') }} AS e