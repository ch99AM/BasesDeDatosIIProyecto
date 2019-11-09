BEGIN TRAN
UPDATE Producto SET IdMarca = (SELECT IdMarca FROM Marca WHERE Nombre = 'Adidas')
WHERE IdProducto = 2

SELECT * FROM ubicacion
UPDATE Ubicacion SET IdDistrito = (SELECT IdDistrito FROM Distrito WHERE Nombre = 'Esparza')
WHERE IdUbicacion = 2

ROLLBACK TRAN

--READ UNCOMMITTED

BEGIN TRAN
UPDATE Tipo SET Tipo = 'Nuevo tipo' 
WHERE idtipo = 1
SELECT * FROM Tipo WHERE IdTipo = 1

ROLLBACK TRAN

-- READ COMMITTED

BEGIN TRAN
UPDATE Tipo SET Tipo = 'Nuevo tipo' 
WHERE IdTipo = 1
SELECT * FROM Tipo WHERE IdTipo = 1

ROLLBACK TRAN

--REPEATABLE READ

BEGIN TRAN
UPDATE Marca SET Nombre = 'Adidas' 
WHERE IdMarca = 1
SELECT * FROM Marca WHERE IdMarca = 1

ROLLBACK TRAN

-- SERIALIZABLE

BEGIN TRAN
INSERT INTO Pais (Nombre) VALUES ('Panama')

ROLLBACK TRAN