CREATE TABLE cancha (
id_cancha SERIAL,
nombre VARCHAR(50)NOT NULL,
CONSTRAINT PK_cancha PRIMARY KEY (id_cancha)
);

CREATE TABLE entrenador (
id_entrenador SERIAL,
nombre VARCHAR(100) NOT NULL,
id_cancha INT UNIQUE NOT NULL,
CONSTRAINT PK_entrenador PRIMARY KEY(id_entrenador),
CONSTRAINT FK_entrenador_cancha FOREIGN KEY (id_cancha)
REFERENCES cancha (id_cancha) ON DELETE RESTRICT
);

CREATE TABLE clase(
id_clase SERIAL,
horario TIME NOT NULL,
dia_semana VARCHAR(10) NOT NULL,
id_entrenador INT NOT NULL,
CONSTRAINT PK_clase PRIMARY KEY (id_clase),
CONSTRAINT FK_clase_entrenador FOREIGN KEY (id_entrenador)
REFERENCES entrenador(id_entrenador) ON DELETE RESTRICT,
CONSTRAINT clase_horario UNIQUE (dia_semana, horario, id_entrenador)
);

CREATE TABLE alumno(
id_alumno SERIAL,
nombre VARCHAR(20) NOT NULL,
dni VARCHAR(20) NOT NULL UNIQUE,
CONSTRAINT PK_alumno PRIMARY KEY (id_alumno)
);

CREATE TABLE inscripcion_clase(
id_clase INT,
id_alumno INT,
CONSTRAINT PK_inscripcion_clase PRIMARY KEY (id_clase, id_alumno),
    CONSTRAINT FK_inscripcion_clase FOREIGN KEY (id_clase) 
        REFERENCES clase(id_clase) ON DELETE CASCADE,
    CONSTRAINT FK_inscripcion_alumno FOREIGN KEY (id_alumno) 
        REFERENCES alumno(id_alumno) ON DELETE CASCADE
);

INSERT INTO cancha(nombre)
VALUES
('CANCHA1'),
('CANCHA2');

INSERT INTO entrenador(nombre, id_cancha)
VALUES
('Carlos',1),
('Ana',2);

INSERT INTO alumno(nombre,dni)
VALUES
('Camila JUAREZ',1234567890),
('Manuel RODRIGUEZ',123489765);

INSERT INTO clase(
horario, 
dia_semana,
id_entrenador
)
VALUES
('16:00','MARTES',1),
('18:00','MIERCOLES',2);

INSERT INTO inscripcion_clase (
    id_clase,
    id_alumno
)
VALUES
(1, 1),
(1, 2),
(2, 1);

SELECT * FROM alumno;
SELECT * FROM clase;

