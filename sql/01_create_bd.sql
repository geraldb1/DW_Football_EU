-- 01_create_bd.sql
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'football_dwh')
BEGIN
    CREATE DATABASE football_dwh;
END