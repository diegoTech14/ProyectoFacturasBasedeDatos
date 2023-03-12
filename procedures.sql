USE facturaspoderjudicial;

-- Obtener la cantidad de articulos relacionado a cada factura pasandole como parámetro el estado de las facturas
DELIMITER // 
CREATE PROCEDURE reporteFacturas(IN estado BOOLEAN)
	BEGIN
		SELECT facturas.id_factura, facturas.periodo_presupuestario, facturas.monto_bruto, facturas.monto_neto, 
				facturas.impuesto_iva, facturas.impuesto_renta, facturas.estado, SUM(detallefactura.cantidad_articulo) AS "CANTIDAD DE ARTICULOS" FROM facturas
                INNER JOIN detallefactura ON detallefactura.id_factura = facturas.id_factura WHERE facturas.estado = estado
                GROUP BY(detallefactura.id_factura) ORDER BY(detallefactura.cantidad_articulo);
	END
//

UPDATE personas
	SET personas.puesto = "Jefe Superior";
    WHERE personas.cedula = "103580137";
DELIMITER //
CREATE PROCEDURE allBills()
	BEGIN 
		SELECT facturas.id_factura, facturas.periodo_presupuestario, 
				facturas.tipo_factura, facturas.monto_bruto, facturas.monto_neto, facturas.impuesto_renta,
                facturas.impuesto_iva, facturas.estado, facturas.observaciones, facturas.nombre_moneda FROM facturas;
	END
//

DELIMITER //
CREATE PROCEDURE allEarringBills()
	BEGIN 
		SELECT facturas.id_factura, facturas.periodo_presupuestario, 
				facturas.tipo_factura, facturas.monto_bruto, facturas.monto_neto, facturas.impuesto_renta,
                facturas.impuesto_iva, facturas.estado, facturas.observaciones, facturas.nombre_moneda FROM facturas WHERE facturas.estado = 0;
	END
//


DELIMITER // 
CREATE PROCEDURE allUsers()
	BEGIN 	
		SELECT personas.cedula AS "cedula", CONCAT(personas.nombre, " ", personas.apellido_uno, " ", personas.apellido_dos) AS "nombre", 
				usuarios.numero_maquina AS "maquina", IF(usuarios.estado = 1, "Activo", "Inactivo") AS "estado" 
                FROM usuarios INNER JOIN personas ON usuarios.cedula_persona = personas.cedula;
	END
//

DELIMITER // 
CREATE PROCEDURE allUsersByCedulaDESC()
	BEGIN 	
		SELECT personas.cedula, personas.nombre, personas.apellido_uno, personas.apellido_dos, usuarios.id_usuario, usuarios.nombre_usuario, 
				usuarios.numero_maquina, usuarios.estado FROM usuarios INNER JOIN personas ON usuarios.cedula_persona = personas.cedula ORDER BY CEDULA DESC;
	END
//

DELIMITER //
CREATE PROCEDURE userSearchByCedula(IN cedula VARCHAR(12))
	BEGIN
		SELECT personas.cedula, personas.nombre, personas.apellido_uno, personas.apellido_dos, personas.telefono, usuarios.nombre_usuario, 
				usuarios.numero_maquina, usuarios.correo_electronico FROM usuarios 
                INNER JOIN personas ON usuarios.cedula_persona = personas.cedula WHERE personas.cedula = cedula;
		END
//
DROP PROCEDURE userSearchByCedula;
DELIMITER //
CREATE PROCEDURE userSearchByMachineNumber(IN numero_maquina VARCHAR(25))
	BEGIN
		SELECT personas.cedula, personas.nombre, personas.apellido_uno, personas.apellido_dos, usuarios.id_usuario, usuarios.nombre_usuario, 
				usuarios.numero_maquina, usuarios.estado FROM usuarios INNER JOIN personas ON usuarios.cedula_persona = personas.cedula WHERE 
                usuarios.numero_maquina = numero_maquina;
		END
//

-- obtener los articulos que ofrece cada proveedor
SELECT articulo.id_articulo, articulo.nombre, proveedor.cedula, proveedor.nombre FROM articulo
	INNER JOIN proveedorarticulo ON articulo.id_articulo = proveedorarticulo.id_articulo
    INNER JOIN proveedor ON proveedorarticulo.cedula = proveedor.cedula;

DESC facturaspoderjudicial.proveedor;

-- cedula, nombre completo, cuenta_cliente, estado, deduccion.
DELIMITER //
	CREATE PROCEDURE allProviders()
		BEGIN 
			SELECT proveedor.cedula, IF(proveedor.tipo LIKE "%Acreedor%", proveedor.nombre, CONCAT(proveedor.nombre, " ", 
            proveedor.apellido_uno, " ", proveedor.apellido_dos)) AS "nombre", proveedor.cuenta_cliente, 
            IF(proveedor.estado = 1, "Activo", "Inactivo") AS "estado", proveedor.deduccion FROM proveedor;
		END
//

DELIMITER //
CREATE PROCEDURE providerSearchByCedula(IN cedula VARCHAR(12))
	BEGIN
			SELECT proveedor.cedula, IF(proveedor.tipo LIKE "%Acreedor%", proveedor.nombre, CONCAT(proveedor.nombre, " ", 
            proveedor.apellido_uno, " ", proveedor.apellido_dos)) AS "nombre", proveedor.cuenta_cliente, 
            IF(proveedor.estado = 1, "Activo", "Inactivo") AS "estado", 
            proveedor.deduccion FROM proveedor WHERE proveedor.cedula = cedula;
		END
//

DELIMITER //
CREATE PROCEDURE disableUser(IN cedula VARCHAR(12))
		BEGIN
			UPDATE usuarios INNER JOIN personas ON usuarios.cedula_persona = cedula SET usuarios.estado = 0;
		END;
//

DELIMITER //
CREATE PROCEDURE enableUser(IN cedula VARCHAR(12))
		BEGIN
			UPDATE usuarios INNER JOIN personas ON usuarios.cedula_persona = cedula SET usuarios.estado = 1;
		END;
//


DELIMITER //
CREATE PROCEDURE getLastUserId()
	BEGIN
		SELECT id_usuario FROM usuarios ORDER BY id_usuario DESC LIMIT 1;
	END;
//

DELIMITER //
CREATE PROCEDURE newPerson(IN ced VARCHAR(12), IN nom VARCHAR(20), IN ape_uno VARCHAR(20), IN ape_dos VARCHAR(20), 
IN tel VARCHAR(8), IN puest VARCHAR(20))
    
	BEGIN
		INSERT INTO personas(`cedula`, `nombre`, `apellido_uno`, `apellido_dos`, `telefono`, `puesto`) VALUES 
			(ced, nom, ape_uno, ape_dos, tel, puest);
		END;
//

DELIMITER //
CREATE PROCEDURE newUser(IN id_us VARCHAR(6), IN nombre_us VARCHAR(25), IN numero_maq VARCHAR(25), IN correo_elec VARCHAR(100), IN cont VARCHAR(255),
IN est tinyint(1), IN cedula_pe VARCHAR(12))
	BEGIN
		INSERT INTO usuarios(`id_usuario`, `nombre_usuario`, `numero_maquina`, `correo_electronico`, `contraseña`, `estado`, `cedula_persona`) VALUES 
        (id_us, nombre_us, numero_maq, correo_elec, cont, est, cedula_pe);
	
	END;
//

DELIMITER // 
CREATE PROCEDURE getAllPeopleTelephones()
	BEGIN
		SELECT telefono FROM personas;
	END;
//

DELIMITER //
CREATE PROCEDURE updatePerson(IN ced VARCHAR(12), IN nom VARCHAR(20), IN ape_uno VARCHAR(20), IN ape_dos VARCHAR(20), 
IN tel VARCHAR(8), IN puest VARCHAR(20))
	BEGIN
		UPDATE personas
		SET	personas.nombre = nom, personas.apellido_uno = ape_uno, personas.apellido_dos = ape_dos,
        personas.telefono = tel, personas.puesto = puest
        WHERE personas.cedula = ced;
    END;
//

DELIMITER //
CREATE PROCEDURE updateUser(IN ced VARCHAR(12), IN nombre_us VARCHAR(25), IN numero_maq VARCHAR(25), IN correo_elec VARCHAR(100), IN ced_per VARCHAR(12))
	BEGIN
		UPDATE usuarios
        SET usuarios.nombre_usuario = nombre_us, usuarios.numero_maquina = numero_maq, 
        usuarios.correo_electronico = correo_elec, usuarios.cedula_persona = ced_per
		WHERE usuarios.cedula_persona = ced;
    END;
//

DROP PROCEDURE updateUser;