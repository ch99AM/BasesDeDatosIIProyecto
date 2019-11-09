use Bodega_SQL;

-- Se puede leer datos.
SELECT * FROM puesto;

-- Se pueden escribir datos.
INSERT INTO Puesto (Puesto, SalarioBase) VALUES ('PuestoNuevo', 120000);

-- Eliminar
DELETE FROM Puesto WHERE Puesto = 'PuestoNuevo'