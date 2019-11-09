USE Bodega_SQL;

-- Se pueden leer datos.
SELECT Nombre FROM Producto;

-- No se pueden escribir datos.
INSERT INTO Puesto (Puesto, SalarioBase)
VALUES ('PuestoNuevo', 150000);