

-- Pregunta 2
-- Primera consulta
BEGIN TRAN
UPDATE Ubicacion SET IdDistrito = (SELECT IdDistrito FROM Distrito WHERE Nombre = 'Esparza')
WHERE IdUbicacion = 2

SELECT * FROM producto
UPDATE Articulo SET IdProducto = (SELECT IdMarca FROM Marca WHERE Nombre = 'New Balance')
WHERE IdArticulo = 2

ROLLBACK TRAN

-- READ UNCOMMITED 

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED 
GO
BEGIN TRAN
SELECT * FROM Tipo WHERE IdTipo = 1

ROLLBACK TRAN

-- READ COMMITTED 

SET TRANSACTION ISOLATION LEVEL READ COMMITTED 
GO

BEGIN TRAN 
SELECT * FROM Tipo
WHERE IdTipo = 1

ROLLBACK TRAN

--REPEATABLE READ

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ 
GO

BEGIN TRAN 
SELECT * FROM Marca
WHERE IdMarca = 1

ROLLBACK TRAN

-- SERIALIZABLE 

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

BEGIN TRAN 
SELECT * FROM Pais

ROLLBACK TRAN