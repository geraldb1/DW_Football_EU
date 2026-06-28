IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'partidos' AND schema_id = SCHEMA_ID('bronze'))
BEGIN
CREATE TABLE bronze.partidos (
    id INT PRIMARY KEY,
    utcDate NVARCHAR(50),
    lastUpdated NVARCHAR(50),
    [status] NVARCHAR(20),
    liga_archivo NVARCHAR(10),
    temporada_archivo NVARCHAR(10),
    fecha_carga DATETIME,
    payload_json NVARCHAR(MAX)
);
END