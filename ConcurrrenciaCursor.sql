

DECLARE @Nombre AS nvarchar(50)
DECLARE PaisCursor CURSOR FOR SELECT Nombre FROM Provincia FOR UPDATE
OPEN PaisCursor
FETCH NEXT FROM PaisCursor INTO @Nombre
WHILE @@fetch_status = 0
	BEGIN
		SELECT Nombre FROM Provincia
		UPDATE Pais SET Nombre = @Nombre
		SELECT Nombre FROM Provincia
		FETCH NEXT FROM PaisCursor INTO @Nombre
	END
CLOSE PaisCursor
DEALLOCATE PaisCursor
