SELECT
    id_partido,
    fechapartido_partido,
    jornada_partido,
    id_competicion,
    id_temporada,
    codlocal_partido,
    codvisitante_partido,
    estado_partido,
    resultado_partido,
    duracion_partido,
    goleslocal_partido,
    golesvisitante_partido,
    golesparcialeslocal_partido,
    golesparcialesvisitante_partido
FROM {{ ref('stg_partido') }}