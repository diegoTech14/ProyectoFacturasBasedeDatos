CREATE DATABASE facturaspoderjudicial;
USE facturaspoderjudicial;

CREATE TABLE Personas(
	cedula VARCHAR(12) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido_uno VARCHAR(20) NOT NULL,
    apellido_dos VARCHAR(20) NOT NULL,
	telefono VARCHAR(8) NOT NULL,
    puesto VARCHAR(20) NOT NULL
);

CREATE TABLE Usuarios (
	id_usuario VARCHAR(6) PRIMARY KEY,
    nombre_usuario VARCHAR(25) UNIQUE NOT NULL,
    numero_maquina VARCHAR(25) UNIQUE NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    estado BOOLEAN NOT NULL,
    cedula_persona VARCHAR(12),
    FOREIGN KEY (cedula_persona) REFERENCES personas(cedula)
);

CREATE TABLE Bitacoras (
    id_bitacora INT AUTO_INCREMENT PRIMARY KEY,
    id_boton VARCHAR(2) NOT NULL,
    id_pantalla VARCHAR(2) NOT NULL
);

CREATE TABLE registro_bitacora (
    id_usuario VARCHAR(6), 
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    id_bitacora INT,
    FOREIGN KEY (id_bitacora) REFERENCES Bitacoras(id_bitacora),
    fecha_registro DATE NOT NULL,
    hora_registro TIME NOT NULL
);

CREATE TABLE ConfeccionFactura(
    id_usuario VARCHAR(6),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    id_factura VARCHAR(12),
    FOREIGN KEY (id_factura) REFERENCES Facturas(id_factura),
    fecha_confeccion DATE NOT NULL,
    hora_confeccion TIME NOT NULL
);

CREATE TABLE tipoMoneda(
	nombre_moneda VARCHAR(10) PRIMARY KEY,
    fecha_cambio DATE,
    tipo_cambio DOUBLE
);

CREATE TABLE Facturas(
    id_factura VARCHAR(12) PRIMARY KEY,
    periodo_presupuestario DATE NOT NULL,
    tipo_factura VARCHAR(20) NOT NULL,
    monto_bruto DOUBLE,
    monto_neto DOUBLE,
    impuesto_renta INT NOT NULL,
    impuesto_iva INT,
    estado BOOLEAN NOT NULL,
    observaciones VARCHAR(255) NOT NULL,
	nombre_moneda VARCHAR(10),
    FOREIGN KEY (nombre_moneda) REFERENCES tipoMoneda(nombre_moneda)
);

CREATE TABLE Proveedor(
	cedula VARCHAR(12) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    apellido_uno VARCHAR(20),
    apellido_dos VARCHAR(20), 
    estado BOOLEAN NOT NULL,
    cuenta_cliente VARCHAR(50) NOT NULL,
    deduccion DOUBLE,
    tipo VARCHAR(12) NOT NULL,
    impuesto_iva INT 
);

CREATE TABLE telefonosProveedor(
	cedula VARCHAR(12),
    FOREIGN KEY (cedula) REFERENCES Proveedor(cedula),
    telefono VARCHAR(8) NOT NULL
);

CREATE TABLE correosProveedor(
	cedula VARCHAR(12),
    FOREIGN KEY (cedula) REFERENCES Proveedor(cedula),
    correo VARCHAR(100) NOT NULL
);

CREATE TABLE Articulo(
	id_articulo VARCHAR(5) NOT NULL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
	subpartida VARCHAR(20) NOT NULL,
    articulo_especifico BOOLEAN
);

CREATE TABLE proveedorArticulo(
	id_articulo VARCHAR(5),
    FOREIGN KEY (id_articulo) REFERENCES Articulo(id_articulo),
	cedula VARCHAR(12),
    FOREIGN KEY (cedula) REFERENCES Proveedor(cedula)
);

CREATE TABLE detalleFactura(
	id_articulo VARCHAR(5),
    FOREIGN KEY (id_articulo) REFERENCES Articulo(id_articulo),
    id_factura VARCHAR(12),
    FOREIGN KEY (id_factura) REFERENCES Facturas(id_factura),
    descuento INT,
    cantidad_articulo INT NOT NULL,
    costo DOUBLE NOT NULL,
    periodicidad DATE 
);
