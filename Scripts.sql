--Punto 1    Vista

CREATE VIEW dbo.TiposDeProductosMasVendidos
AS
SELECT U.IdUbicacion, U.NombrePueblo AS Pueblo, D.Nombre AS Distrito, 
		C.Nombre AS Canton, P.Nombre AS Provincia, PA.Nombre AS Pais
FROM Ubicacion U
INNER JOIN Distrito D ON U.IdDistrito = D.IdDistrito
INNER JOIN Canton C ON D.IdCanton = C.IdCanton
INNER JOIN Provincia P ON C.IdProvincia = P.IdProvincia
INNER JOIN Pais PA ON P.IdPais = PA.IdPais  

-- Punto 2 Strode procedure transactional

CREATE PROCEDURE [dbo].[ActualizarDireccionPersona]
       @Pais VARCHAR(50),
       @Provincia VARCHAR(50),
	   @Canton VARCHAR(50),
	   @Distrito VARCHAR(50),
	   @NombrePueblo VARCHAR(50),
       @DetalleUbicacion VARCHAR(255),
       @IdPersona INT
AS
BEGIN
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre = @Pais) BEGIN
				INSERT INTO Pais (Nombre)
				VALUES (@Pais)
			END
			
			IF NOT EXISTS (SELECT 1 FROM Provincia WHERE Nombre = @Provincia) BEGIN
				INSERT INTO Provincia(Nombre, IdPais)
				VALUES (@Provincia, (SELECT IdPais FROM Pais WHERE Nombre = @Pais)) 
			END
	
			IF NOT EXISTS (SELECT 1 FROM Canton WHERE Nombre = @Canton) BEGIN	
				INSERT INTO Canton(Nombre, IdProvincia)
				VALUES (@Canton, (SELECT IdProvincia FROM Provincia WHERE Nombre = @Provincia)) 
			END
			
			IF NOT EXISTS (SELECT 1 FROM Distrito WHERE Nombre = @Distrito) BEGIN
				INSERT INTO Distrito (Nombre, IdCanton)
				VALUES (@Distrito, (SELECT IdCanton FROM Canton WHERE Nombre = @Canton))
			END

			IF NOT EXISTS (SELECT 1 FROM Ubicacion WHERE NombrePueblo = @NombrePueblo AND 
			DetalleUbicacion = @DetalleUbicacion) BEGIN
				INSERT INTO Ubicacion(NombrePueblo, DetalleUbicacion, IdDistrito)
				VALUES (@NombrePueblo, @DetalleUbicacion, (SELECT IdDistrito FROM Distrito WHERE Nombre = @Distrito))
			END

			UPDATE dbo.Persona
				SET IdUbicacion = (SELECT IdUbicacion FROM Ubicacion WHERE NombrePueblo = @NombrePueblo AND 
					DetalleUbicacion = @DetalleUbicacion)
				WHERE IdPersona = @IdPersona

			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
		END CATCH
END



