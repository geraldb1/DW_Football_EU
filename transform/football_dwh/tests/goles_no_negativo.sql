-- tests/assert_goles_no_negativos.sql
SELECT id_partido
FROM {{ ref('fact_partido') }}
WHERE goleslocal_partido < 0
   OR golesvisitante_partido < 0
   OR golesparcialeslocal_partido < 0
   OR golesparcialesvisitante_partido < 0