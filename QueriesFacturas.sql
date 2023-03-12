USE facturaspoderjudicial;

-- Obtener el id, el nombre, descripción, periodicidad y precio de los articulos de tipo servicio
SELECT articulo.id_articulo, articulo.nombre, articulo.descripcion FROM articulo WHERE articulo.articulo_especifico = 0;

-- Monto total de pagos
SELECT SUM(facturas.monto_neto) AS "Total de facturas pagadas" FROM facturas WHERE facturas.estado = 1;

-- Promedio del monto total de pagos realizados
SELECT AVG(facturas.monto_neto) AS "Total de facturas pagadas" FROM facturas WHERE facturas.estado = 1;

-- Obtener identificador, periodo, tipo factura y monto bruto y neto de las facturas que están pendientes y cuyo monto neto sea mayor a 100000
SELECT facturas.id_factura, facturas.periodo_presupuestario, 
facturas.tipo_factura, facturas.monto_bruto, facturas.monto_neto FROM facturas WHERE facturas.estado = 0 AND facturas.monto_neto > 100000;

-- mostrar el nombre de usuario, la cedula de la persona y el identificador de la factura que han hecho
SELECT personas.cedula, usuarios.nombre_usuario, confeccionfactura.id_factura FROM personas 
	INNER JOIN usuarios ON personas.cedula = usuarios.cedula_persona 
	INNER JOIN confeccionfactura ON usuarios.id_usuario = confeccionfactura.id_usuario;
    
-- 	Mostrar los articulos que ofrece cada proveedor

SELECT articulo.id_articulo, articulo.nombre, proveedor.nombre AS "NOMBRE", CONCAT(proveedor.apellido_uno, " ", proveedor.apellido_dos) AS "APELLIDOS" FROM articulo 
	INNER JOIN proveedorarticulo ON proveedorarticulo.id_articulo = articulo.id_articulo 
    INNER JOIN proveedor ON proveedorarticulo.cedula = proveedor.cedula;

-- Mostrar las facturas cuyo año en el periodo presupuestario sea 2020
SELECT facturas.id_factura, facturas.periodo_presupuestario, facturas.tipo_factura,
	facturas.monto_bruto, facturas.monto_neto, facturas.impuesto_iva, facturas.impuesto_renta, 
	facturas.estado, facturas.observaciones, facturas.nombre_moneda FROM facturas WHERE YEAR(facturas.periodo_presupuestario) = 2020;
    
    
-- Obtener la conversión de las facturas cuya moneda es el dolar
SELECT facturas.id_factura, facturas.monto_bruto AS "MONTO EN DOLAR", 
(facturas.monto_bruto * tipoMoneda.tipo_cambio) AS "MONTO EN COLÓN" FROM facturas
	INNER JOIN tipoMoneda ON facturas.nombre_moneda = tipoMoneda.nombre_moneda WHERE facturas.nombre_moneda = "Dolar";