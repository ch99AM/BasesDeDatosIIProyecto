USE Bodega_SQL;

-- Puede ver cualquiera de las siguientes tablas: Articulo, Factura, ArticuloXFactura
SELECT * FROM Articulo;

-- Cualquier otra tabla no es posible verla
SELECT * FROM Cliente;

-- No es posible agregar datos.
INSERT INTO Articulo (Codigo) VALUES ('CODIGO');