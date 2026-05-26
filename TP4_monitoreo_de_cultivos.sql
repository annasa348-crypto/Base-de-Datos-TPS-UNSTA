CREATE TABLE empresa(
id_empresa SERIAL,
nombre VARCHAR(100) NOT NULL,
direccion VARCHAR(255),
dueños VARCHAR(255),
CONSTRAINT PK_empresa PRIMARY KEY (id_empresa)
);

CREATE TABLE clientes_dueño(
id_dueño SERIAL PRIMARY KEY,
dni VARCHAR(20) UNIQUE NOT NULL,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
id_empresa INT,
CONSTRAINT FK_clientes_empresa 
FOREIGN KEY (id_empresa)
REFERENCES empresa(id_empresa)
ON DELETE SET NULL
);

CREATE TABLE parcela(
id_parcela SERIAL PRIMARY KEY,
ubicacion VARCHAR(150) NOT NULL,
tamaño VARCHAR(50),
id_dueño INT NOT NULL,
id_empresa INT,
CONSTRAINT FK_parcela_dueño 
FOREIGN KEY (id_dueño)
REFERENCES clientes_dueño(id_dueño),
CONSTRAINT FK_parcela_empresa 
FOREIGN KEY (id_empresa)
REFERENCES empresa(id_empresa)
ON DELETE SET NULL
);

CREATE TABLE cultivos (
id_cultivo SERIAL,
temporada VARCHAR(50) NOT NULL,
fecha_cultivo DATE NOT NULL,
cantidad INT,
nombre VARCHAR(100) NOT NULL,
id_parcela INT NOT NULL,
CONSTRAINT PK_cultivos 
PRIMARY KEY (id_cultivo),
CONSTRAINT FK_cultivos_parcela 
FOREIGN KEY (id_parcela)
REFERENCES parcela(id_parcela)
ON DELETE CASCADE
);

CREATE TABLE drones(
id_dron SERIAL,
nro_de_serie VARCHAR(50)NOT NULL UNIQUE,
modelo VARCHAR(100),
cantidad INT DEFAULT 1,
tipo_sensor VARCHAR(100),
fecha_escaneo TIMESTAMP,
id_dueño INT,
id_empresa INT,
CONSTRAINT PK_drones PRIMARY KEY (id_dron),
CONSTRAINT FK_drones_empresa FOREIGN KEY (id_empresa)
REFERENCES empresa(id_empresa) ON DELETE SET NULL
);

CREATE TABLE Sistema (
id_registro SERIAL,
historial_vuelo TEXT,
historial_plantacion TEXT,
temporada_cultivo VARCHAR(50) NOT NULL,
fecha_cultivo DATE NOT NULL,
CONSTRAINT PK_Sistema PRIMARY KEY (id_registro),
CONSTRAINT FK_Sistema_Cultivos FOREIGN KEY (cultivos, fecha_cultivo)
REFERENCES cultivos(cultivos, fecha_cultivo) ON DELETE CASCADE
);

INSERT INTO empresa (nombre, direccion, dueños)
VALUES
('AgroTech', 'Ruta 9 Km 120', 'Carlos Perez'),
('SmartField', 'Av. Central 456', 'Ana Loepz');

INSERT INTO clientes_dueño (
    dni,
    nombre,
    apellido,
    id_empresa
)
VALUES
('12345678', 'Rodrigo', 'Gomez', 1),
('87654321', 'Gilda', 'Fernandez', 2);

INSERT INTO parcela (
    ubicacion,
    tamaño,
    id_dueño,
    id_empresa
)
VALUES
('Lote Norte', '50 hectareas', 1, 1),
('Campo Sur', '80 hectareas', 2, 2);

INSERT INTO cultivos (
    temporada,
    fecha_cultivo,
    cantidad,
    nombre,
    id_parcela
)
VALUES
(
    'Verano',
    '2026-01-15',
    500,
    'Soja',
    1
);

INSERT INTO cultivos (
    temporada_cultivo,
    fecha_cultivo,
    cantidad,
    nombre,
    id_parcela
)
VALUES
('Verano', '2026-01-15', 500, 'Soja', 1),
('Invierno', '2026-06-20', 300, 'Trigo', 2);


INSERT INTO sistema (
    historial_vuelo,
    historial_plantacion,
    temporada_cultivo,
    fecha_cultivo
)
VALUES
(
    'Vuelo de monitoreo sobre soja',
    'Plantacion automatizada sector norte',
    'Verano',
    '2026-01-15'
),
(
    'Escaneo termico de trigo',
    'Control de humedad en cultivo',
    'Invierno',
    '2026-06-20'
);

SELECT * FROM empresa;
SELECT * FROM parcela;

SELECT 
clientes_dueño.nombre,
clientes_dueño.apellido,
parcela.ubicacion,
cultivos.nombre AS cultivo,
drones.modelo
FROM clientes_dueño

JOIN parcela
ON clientes_dueño.id_dueño = parcela.id_dueño

JOIN cultivos
ON parcela.id_parcela = cultivos.id_parcela

JOIN empresa
ON clientes_dueño.id_empresa = empresa.id_empresa

JOIN drones
ON empresa.id_empresa = drones.id_empresa;