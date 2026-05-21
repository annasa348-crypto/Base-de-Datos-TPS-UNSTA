CREATE TABLE entrenador(
id_entrenador SERIAL,
nombre VARCHAR(50) NOT NULL,
CONSTRAINT PK_entrenador PRIMARY KEY(id_entrenador)
);

CREATE TABLE catalogo(
id_catalogo SERIAL,
rutinas VARCHAR(100),
nombre_rutinas VARCHAR(100) NOT NULL,
CONSTRAINT PK_catalogo PRIMARY KEY (id_catalogo)

);

CREATE TABLE maraton(
id_maraton SERIAL,
fecha DATE NOT NULL,
ubicacion VARCHAR(100) NOT NULL,
hora TIME NOT NULL,
CONSTRAINT PK_maraton PRIMARY KEY (id_maraton)
);


CREATE TABLE atletas(
id_atleta SERIAL,
dni VARCHAR(100) NOT NULL UNIQUE,
nombre VARCHAR(50)NOT NULL,
peso NUMERIC(5,2),
altura NUMERIC(3,2),
categoria_rendimiento VARCHAR(50),
fehca_nac DATE,
id_entrenador INT NOT NULL,
id_maraton INT,
CONSTRAINT PK_atletas PRIMARY KEY(id_atleta),
CONSTRAINT FK_atletas_entrenador FOREIGN KEY(id_entrenador)
REFERENCES entrenador(id_entrenador)ON DELETE RESTRICT,
CONSTRAINT FK_atletas_maraton FOREIGN KEY (id_maraton)
REFERENCES maraton(id_maraton)ON DELETE RESTRICT
);

CREATE TABLE sesiones (
    id_sesion SERIAL,
    id_atleta INT NOT NULL,
    rutinas VARCHAR(100),
    fecha_rutina DATE NOT NULL,
    duracion_rutina INTERVAL,  
    id_catalogo INT NOT NULL,
    CONSTRAINT PK_sesiones PRIMARY KEY (id_sesion),
    CONSTRAINT FK_sesiones_atletas FOREIGN KEY (id_atleta)
        REFERENCES atletas(id_atleta) ON DELETE CASCADE,
    CONSTRAINT FK_sesiones_catalogo FOREIGN KEY (id_catalogo)
        REFERENCES catalogo(id_catalogo) ON DELETE RESTRICT

);

INSERT INTO entrenador (nombre)
VALUES
('JUAN Manuel'),
('Sofia Noemi');

INSERT INTO catalogo (rutinas,nombre_rutinas)
VALUES
('cardio intenso 15 min','cardio 10 min'),
('ejercicio de abdomen y cintura','rutina rapida de 10 min');

INSERT INTO maraton (fehca, ubicacion,hora)
VALUES
('2026-06-15', 'CALLE SHIPTON', '09:00'),
('2026-07-10', 'AVENIDA ALVEAR', '08:30');

INSERT INTO atletas (dni,nombre,peso,altura,categoria_rendimiento,fecha_nac,id_entrenador,id_maraton)
VALUES
('12345678','rodrigo paez',72.5,1.75,'Avanzado','2000-05-10',1,1),

('87654321','Maria Lopez',60.0,1.68,'Intermedio','1998-08-20',2,2);
   


INSERT INTO sesiones (id_atleta, fecha_rutina, duracion_rutina,id_catalogo)
 VALUES 

(1,'2026-05-20','1 hour',1),
(2,'2026-05-21','45 minutes',2);

SELECT * FROM atletas;
SELECT * FROM sesiones;