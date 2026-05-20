CREATE TABLE concesionario (
    id_concesionario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

CREATE TABLE marca (
    id_marca SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE modelo (
    id_modelo SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(12,2) NOT NULL,

    id_marca INT NOT NULL,

    FOREIGN KEY (id_marca)
    REFERENCES marca(id_marca)
);

CREATE TABLE automovil (
    nro_chasis VARCHAR(50) PRIMARY KEY,
    matricula VARCHAR(20) UNIQUE NOT NULL,

    id_modelo INT NOT NULL,
    id_concesionario INT NOT NULL,

    FOREIGN KEY (id_modelo)
    REFERENCES modelo(id_modelo),

    FOREIGN KEY (id_concesionario)
    REFERENCES concesionario(id_concesionario)
);

CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    direccion VARCHAR(255)
);

CREATE TABLE vendedor (
    id_vendedor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20)
);

CREATE TABLE extra (
    id_extra SERIAL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    precio NUMERIC(10,2) NOT NULL
);

CREATE TABLE automovil_extra (
    nro_chasis VARCHAR(50),
    id_extra INT,

    PRIMARY KEY (nro_chasis, id_extra),

    FOREIGN KEY (nro_chasis)
    REFERENCES automovil(nro_chasis),

    FOREIGN KEY (id_extra)
    REFERENCES extra(id_extra)
);

CREATE TABLE servicio_oficial (
    id_servicio SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,

    id_concesionario INT NOT NULL,

    FOREIGN KEY (id_concesionario)
    REFERENCES concesionario(id_concesionario)
);

CREATE TABLE venta (
    id_venta SERIAL PRIMARY KEY,

    metodo_pago VARCHAR(50) NOT NULL,
    precio_final NUMERIC(12,2) NOT NULL,

    nro_chasis VARCHAR(50) NOT NULL,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,

    FOREIGN KEY (nro_chasis)
    REFERENCES automovil(nro_chasis),

    FOREIGN KEY (id_cliente)
    REFERENCES cliente(id_cliente),

    FOREIGN KEY (id_vendedor)
    REFERENCES vendedor(id_vendedor)

	);

INSERT INTO concesionario (nombre, direccion)
VALUES 
('Toyota Center', 'Av Siempre Viva 123'),
('Fiat SA', 'Calle Shipton 123');

INSERT INTO marca (nombre)
VALUES
('Fiat'),
('Ford'),
('Toyota');

SELECT * FROM marca;

SELECT * FROM concesionario;


INSERT INTO modelo (nombre, precio, id_marca)
VALUES
('Chronos',250000,1),
('Fiesta',300000,2),


INSERT INTO automovil ( nro_chasis,
    matricula,
    id_modelo,
    id_concesionario)
VALUES
('CHASIS01','AA01B',1,1),
('CHASIS02','AA02D',2,2);

SELECT * FROM automovil;



