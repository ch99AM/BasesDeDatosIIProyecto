USE master
ALTER DATABASE Bodega_SQL SET ONLINE WITH ROLLBACK IMMEDIATE;


USE Bodega_SQL;
INSERT INTO Pais VALUES ('Panama');
SELECT * FROM Pais;
DELETE FROM Pais WHERE Nombre = 'Panama';