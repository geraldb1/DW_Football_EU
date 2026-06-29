SELECT 
    p.id AS id_partido,
    CAST(p.utcdate AS datetime) as fechapartido_partido,
    TRY_CAST(p.matchday AS INT)as jornada_partido,
    TRY_CAST(p.home_team_id AS INT ) as codlocal_partido,
    TRY_CAST(p.away_team_id AS INT ) as codvisitante_partido,
    p.[status] as estado_partido,
    TRY_CAST(JSON_VALUE(p.payload_json,'$.competition.id')AS INT) AS id_competicion,
    TRY_CAST(JSON_VALUE(p.payload_json,'$.season.id')AS INT) AS id_temporada,
    JSON_VALUE(p.payload_json,'$.score.winner') AS resultado_partido,
    JSON_VALUE(p.payload_json,'$.score.duration') AS duracion_partido,
    TRY_CAST(JSON_VALUE(p.payload_json,'$.score.fullTime.home')AS INT) AS goleslocal_partido,
    TRY_CAST(JSON_VALUE(p.payload_json,'$.score.fullTime.away')AS INT) AS golesvisitante_partido,
    TRY_CAST(JSON_VALUE(p.payload_json,'$.score.halfTime.home')AS INT) AS golesparcialeslocal_partido,
    TRY_CAST(JSON_VALUE(p.payload_json,'$.score.halfTime.away')AS INT) AS golesparcialesvisitante_partido
FROM 
    {{ source('season_football', 'partidos') }} AS p