USE facturaspoderjudicial;

INSERT INTO Personas(cedula, nombre, apellido_uno, apellido_dos, telefono, puesto) VALUES 
("103580137", "CARLOS", "MORALES", "CASTRO", "98743165", "Jefe Superior"),
("206478961", "MARIA", "FERNANDEZ", "GONZALES", "45429313", "Jefe"),
("304577984", "ALBERTO", "GUADAMUZ", "MORA", "80924524", "Tecnico"),
("702660197", "JINDRA", "CASCANTE", "BENAVIDES", "30549786", "Jefe"),
("204631982", "NICOLAS", "CASTRO", "PEREZ", "98743215", "Tecnico");

INSERT INTO registro_bitacora(id_usuario, id_bitacora, fecha_registro, hora_registro) VALUES 
("000001", 1, "2022-10-10", "13:43:22"),
("000002", 2, "2015-01-14", "16:30:12"),
("000001", 3, "2020-04-04", "21:00:08"),
("000003", 4, "2019-12-05", "22:00:54"),
("000002", 5, "2020-12-24", "23:34:04"),
("000003", 6, "2017-08-30", "23:34:04"),
("000004", 7, "2018-09-24", "16:23:03"),
("000005", 8, "2020-04-25", "13:45:22");

INSERT INTO bitacoras(id_boton, id_pantalla) VALUES 
("01", "02"),
("02", "03"),
("02", "02"),
("01", "02"),
("04", "02"),
("02", "03"),
("05", "03"),
("03", "03");

INSERT INTO Usuarios(id_usuario, nombre_usuario, numero_maquina, correo_electronico, contraseña, estado, cedula_persona) VALUES 
("000001", "CarlosMC", "SJO-02-9324", "carlosmc@gmail.com", "$1$rasmusle$AChEFB8ZXJso99G8flbWf0I2Q6L4E0M4K2H8F7R1", 1, "103580137"),
("000002", "MariaFG", "SJO-04-4647", "mariafg34@gmail.com", "$1$rasmusle$2/DR6TEqq/hC2YqAOerOt/X3R5U4V6N2O4R8J4M2", 1, "206478961"),
("000003", "AlbertoGM", "SJO-05-1546","albertogm@gmail.com", "$1$rasmusle$V2xPHycq6JrG3f1sc6lUY1E4H6H0I2T1X7E2A0T3", 1, "304577984"),
("000004", "NicFury", "LI-02-5834", "nicolasB@gmail.com", "$1$rasmusle$V2xPHycq6JrG3f1sc6lUY1E4H6H0I2T1X7E2A0T3", 0, "204631982"),
("000005", "JinSakai", "AL-04-2323", "jindraSak@gmail.com", "$1$rasmusle$AChEFB8ZXJso99G8flbWf0I2Q6L4E0M4K2H8F7R1", 0, "702660197");

INSERT INTO articulo (id_articulo, nombre, descripcion, subpartida, articulo_especifico) VALUES
("00001", "Silla ejecutiva", "Silla ergonómica de oficina", "70269506", 1),
("00002", "Mesa ejecutiva", "Mesa ejecutiva de oficina", "4057506", 1),
("00003", "Mouse","Mouse ergonómico", "9486506", 1),
("00004", "Laptop", "Laptop de oficina", "5647506", 1),
("00005", "Agua", "Servicio de recurso hídrico", "1088506", 0),
("00006", "Electricidad", "Servicio de recurso eléctrico", "9846506", 0),
("00007", "Internet", "Servicio de internet", "3216506", 0),
("00009", "Capacitación", "Capacitación sobre big data", "9887506", 0),
("00010", "Libro", "Clean Code", "20264106", 1),
("00011", "Libro", "SQL For Dummies", "20264106", 1),
("00012", "Libro", "Python for Data Science", "20264106", 1),
("00013", "Libro", "Architectur Patterns with C#", "20264106", 1),
("00014", "Tablet", "Samsung Galaxy Tab 10", "30262108", 1),
("00015", "Tablet", "Lenovo YogaTab 2", "30262108", 1),
("00016", "Capacitación", "Data Science with PowerBI", "30262108", 0),
("00017", "Jabón", "Jabon antibacterial", "40444234", 1),
("00018", "Papel higienico", "Papel higienico Shaggy", "40444234", 1),
("00019", "Desinfectante", "Desinfectante Clorox", "40444234", 1),
("00020", "Trapeador", "Trapeador de lana", "40444234", 1),
("00021", "Escoba", "Escoba de pelos", "40444234", 1),
("00022", "Limpiador de muebles", "Limpiador para muebles de madera", "40444234", 1),
("00023", "Limpiador de muebles", "Limpiador para muebles de metal", "40444234", 1);

INSERT INTO Proveedor(cedula, nombre, apellido_uno, apellido_dos, estado, cuenta_cliente, deduccion, tipo, impuesto_iva) VALUES
("702660191", "Diego", "Duarte", "Fernández", 1, "CR48389293239", 2000, "Proveedor", 13),
("204999781", "Oscar", "Gonzales", "Rivas", 1, "CR12476235994", 0, "Proveedor", 13),
("100454788", "Mariana", "Rivas", "Villatoro", 0, "CR987654354", 3000, "Proveedor", 13),
("405049883", "Carlos", "Beckford", "Martínez", 0, "CR987561155", 0, "Proveedor", 13),
("B42664988", "Melany", "Torres", "Myers", 1, "3447734987784625", 0, "Proveedor", 25),
("300649871", "Instituto Costarricense de Electricidad", NULL, NULL,1, "CR99460013546", 0, "Acreedor", 13),
("321544587", "Acuaductos y Alcantarillados", NULL, NULL, 1, "CR65498151654", 0, "Acreedor", 13),
("984445456", "Kathering Service", NULL, NULL, 1, "CR9494943434", 0, "Acreedor", 13),
("848424342", "Accenture", NULL, NULL, 1, "CR8458349342", 0, "Acreedor", 13),
("B41638958", "Alejandro", "Wilson", "Stewart", 1, "839234476493", 0, "Proveedor", 27);

INSERT INTO correosProveedor(cedula, correo) VALUES 
("100454788", "mariana45@gmail.com"),
("204999781", "oscarGang@hotmail.com"),
("100454788", "mariRV@ucr.ac.cr"),
("702660191", "diegoduarte8345@gmail.com"),
("B42664988", "mmyers74@yahoo.es"),
("405049883", "carlosB@gmail.es"),
("300649871", "ice@hotmail.com"),
("321544587", "aya@hotmail.com"),
("984445456", "KS@hotmail.com"),
("848424342", "accenture@hotmail.com"),
("B41638958", "aleW@gmail.com");

INSERT INTO telefonosProveedor(cedula, telefono) VALUES 
("100454788", "64971593"),
("204999781", "80146695"),
("100454788", "98844932"),
("702660191", "88442322"),
("B42664988", "65498721"),
("405049883", "40558499"),
("300649871", "65498745"),
("300649871", "35468715"),
("321544587", "74185245"),
("984445456", "98765428"),
("848424342", "49944242"),
("848424342", "38484393"),
("B41638958", "88492324");

INSERT INTO proveedorArticulo (id_articulo, cedula) VALUES 
("00001", "100454788"),
("00002", "100454788"),
("00003", "204999781"),
("00004", "405049883"),
("00005", "321544587"),
("00006", "300649871"),
("00007", "300649871"),
("00009", "848424342"),
("00010", "B41638958"),
("00011", "B41638958"),
("00012", "B41638958"),
("00013", "B41638958"),
("00014", "B42664988"),
("00015", "B42664988"),
("00017", "702660191"),
("00018", "702660191"),
("00019", "702660191"),
("00020", "702660191"),
("00021", "702660191"),
("00022", "702660191"),
("00023", "702660191");

INSERT INTO tipoMoneda(nombre_moneda, fecha_cambio, tipo_cambio) VALUES 
("Dolar", "2022-11-08", 620.00),
("Euro", "2022-11-08", 980.00);

INSERT INTO Facturas (id_factura, periodo_presupuestario, tipo_factura, monto_bruto, monto_neto, impuesto_renta, impuesto_iva, estado, observaciones, nombre_moneda) VALUES 
("000001-2022", "2022-10-31", "Al exterior", NULL, NULL, 25, NULL, 0, "Factura pendiente de artículos de linea blanca", "Dolar"),
("000002-2020", "2020-01-14", "Ordinaria", NULL, NULL, 2, NULL, 0, "Factura de servicios", NULL),
("000003-2022", "2022-10-31", "Ordinaria", NULL, NULL, 2, NULL, 0, "Factura de articulos de ofimática", NULL),
("000004-2022", "2022-10-31", "Ordinaria", NULL, NULL, 2, NULL, 0, "Factura de articulos de limpieza", NULL),
("000005-2022", "2022-04-21", "Ordinaria", NULL, NULL, 2, NULL, 0, "Factura por articulos", NULL),
("000006-2019", "2019-10-14", "Al exterior", NULL, NULL, 24, NULL, 0, "Libros de tecnología", NULL),
("000007-2014", "2014-02-13", "Ordinaria", NULL, NULL, 2, NULL, 0, "Articulos de oficina", NULL),
("000008-2018", "2018-12-01", "Ordinaria", NULL, NULL, 2, NULL, 0, "Articulos de limpieza", NULL),
("000009-2012", "2012-02-12", "Al exterior", NULL, NULL, 27, NULL, 0, "Tablets Samsung Tab 10", NULL),
("000010-2021", "2021-10-12", "Al exterior", NULL, NULL, 27, NULL, 0, "Tablets Lenovo YogaTab", NULL),
("000011-2020", "2020-06-23", "Al exterior", NULL, NULL, 28, NULL, 0, "Libros de tecnología", "Dolar"),
("000012-2021", "2021-11-11", "Ordinaria", NULL, NULL, 2, NULL, 0, "Factura por servicio de agua", NULL);

UPDATE facturas SET facturas.nombre_moneda = "Dolar" WHERE facturas.tipo_factura LIKE "%Al exterior%";
UPDATE facturas SET facturas.estado = 1 WHERE facturas.id_factura IN("000001-2022", "000002-2020", "000004-2022");

UPDATE facturas INNER JOIN detallefactura ON facturas.id_factura = detallefactura.id_factura
	INNER JOIN articulo ON detallefactura.id_articulo = articulo.id_articulo 
    INNER JOIN proveedorarticulo ON proveedorarticulo.id_articulo = articulo.id_articulo
    INNER JOIN proveedor ON proveedorarticulo.cedula = proveedor.cedula
    
		SET  facturas.monto_bruto = (SELECT @montoTotal := SUM((detallefactura.costo * detallefactura.cantidad_articulo)) 
		FROM detallefactura WHERE detallefactura.id_factura = facturas.id_factura),
			facturas.impuesto_iva = proveedor.impuesto_iva,
			
			facturas.monto_neto = @montoTotal + 
			((@montoTotal * facturas.impuesto_iva) / 100) -
			((@montoTotal * facturas.impuesto_renta) / 100) - 
			((@montoTotal * detallefactura.descuento) / 100);
         
INSERT INTO confeccionfactura(id_usuario, id_factura, fecha_confeccion, hora_confeccion) VALUES 
("000001", "000001-2022", "2020-11-09", "14:32:25"),
("000001", "000002-2022", "2022-04-14", "18:56:50"),
("000002", "000003-2022", "2021-09-28", "10:00:23"),
("000003", "000004-2022", "2010-05-10", "13:05:21");

INSERT INTO detallefactura (id_articulo, id_factura, descuento, cantidad_articulo, costo, periodicidad) VALUES 
("00001", "000001-2022", 3, 4, 23000, NULL),
("00002", "000001-2022", 1, 5, 42500, NULL),
("00003", "000003-2022", 5, 7, 14000, NULL),
("00006", "000002-2020", 1, 1, 320000, "2020-10-12"),
("00002", "000005-2022", 2, 3, 42500, NULL),
("00003", "000001-2022", 3, 4, 20000, NULL),
("00002", "000003-2022", 2, 4, 78000, NULL),
("00010", "000006-2019", 2, 1, 14500, NULL),
("00011", "000006-2019", 3, 1, 21200, NULL),
("00012", "000006-2019", 4, 2, 28500, NULL),
("00002", "000007-2014", 7, 1, 86000, NULL),
("00001", "000007-2014", 5, 1, 92500, NULL),
("00017", "000008-2018", 10, 1, 3000, NULL),
("00018", "000008-2018", 7, 1, 2500, NULL),
("00019", "000008-2018", 7, 1, 3500, NULL),
("00020", "000008-2018", 4, 1, 5500, NULL),
("00021", "000008-2018", 4, 1, 4200, NULL),
("00022", "000008-2018", 8, 1, 2300, NULL),
("00023", "000008-2018", 6, 1, 2600, NULL),
("00005", "000012-2021", 1, 1, 98000, "2020-10-14"),
("00021", "000004-2022", 4, 1, 4200, NULL),
("00020", "000004-2022", 4, 1, 5500, NULL),
("00014", "000009-2012", 10, 2, 145000, NULL),
("00015", "000010-2021", 10, 2, 167000, NULL),
("00010", "000011-2020", 5, 1, 14500, NULL),
("00013", "000011-2020", 5, 1, 34500, NULL);

DELETE FROM detallefactura;