IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'partidos' AND schema_id = SCHEMA_ID('bronze'))
BEGIN
CREATE TABLE bronze.partidos (
    id INT PRIMARY KEY,
    utcdate NVARCHAR(50),
    matchday INT,
    home_team_id INT,
    away_team_id INT,
    lastupdated NVARCHAR(50),
    [status] NVARCHAR(20),
    liga_archivo NVARCHAR(10),
    temporada_archivo NVARCHAR(10),
    fecha_carga DATETIME,
    payload_json NVARCHAR(MAX)
);
END