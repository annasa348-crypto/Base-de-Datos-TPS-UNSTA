CREATE TABLE departamento(
id_departamento SERIAL,
nombre_departamento VARCHAR(100)NOT NULL,
ubicacion VARCHAR(150),
CONSTRAINT PK_departamento PRIMARY KEY(id_departamento)
);

CREATE TABLE empleado(
id_empleado SERIAL,
nombre VARCHAR(100)NOT NULL,
apellido VARCHAR(100)NOT NULL,
correo_electronico VARCHAR(150)NOT NULL UNIQUE,
salario NUMERIC (12,2)NOT NULL,
usuario VARCHAR(50) NOT NULL UNIQUE,
id_departamento INT NOT NULL,
CONSTRAINT PK_empleado PRIMARY KEY(id_empleado),
CONSTRAINT FK_empleado_departamento FOREIGN KEY (id_departamento)
REFERENCES departamento(id_departamento)ON DELETE RESTRICT
);

CREATE TABLE cuentas_de_acceso(
contraseña VARCHAR(255)NOT NULL,
usuario VARCHAR(50),
CONSTRAINT PK_cuentas_de_acceso PRIMARY KEY (contraseña),
CONSTRAINT FK_cuentas_empleados FOREIGN KEY(usuario)
REFERENCES empleado(usuario)ON DELETE CASCADE
);

CREATE TABLE tareas(
id_tarea SERIAL,
nombre_tarea VARCHAR(150)NOT NULL,
fecha_tarea DATE NOT NULL,
estado_tarea VARCHAR(50)DEFAULT 'Pendiente',
id_empleado INT NOT NULL,
CONSTRAINT PK_tareas PRIMARY KEY (id_tarea),
CONSTRAINT FK_tareas_empleado FOREIGN KEY(id_empleado)
REFERENCES empleado(id_empleado)ON DELETE CASCADE
);

CREATE TABLE proyectos(
id_proyecto SERIAL,
nombre_proyecto VARCHAR(150)NOT NULL,
presupuesto_proyecto NUMERIC (15,2),
id_empleado INT,
CONSTRAINT PK_proyectos PRIMARY KEY (id_proyecto),
CONSTRAINT FK_proyectos_empleado FOREIGN KEY (id_empleado)
REFERENCES empleado(id_empleado)ON DELETE SET NULL
);

INSERT INTO Departamento (nombre_departamento, ubicacion) VALUES
('Tecnología de la Información', 'Piso 3 - Oficina A'),
('Recursos Humanos', 'Piso 1 - Oficina B'),
('Finanzas y Contabilidad', 'Piso 2 - Oficina C');

INSERT INTO Empleado (nombre, apellido, correo_electronico, salario, usuario, id_departamento) VALUES
('Carlos', 'Gómez', 'carlos.gomez@empresa.com', 450000.00, 'cgomez99', 1),
('Ana', 'Martínez', 'ana.martinez@empresa.com', 380000.00, 'anamartinez', 2),
('Juan', 'Rodríguez', 'juan.rod@empresa.com', 520000.00, 'jrodriguez_fin', 3);

INSERT INTO Cuentas_de_acceso (contraseña, usuario) VALUES
('scrypt_hash_4589x', 'cgomez99'),
('argon2_secure_pass1', 'anamartinez'),
('sha256_admin_pass7', 'jrodriguez_fin');

INSERT INTO Tareas (nombre_tarea, fecha_tarea, estado_tarea, id_empleado) VALUES
('Migración de Base de Datos a pgAdmin', '2026-05-28', 'En Progreso', 1),
('Revisión de contratos de nuevos pasantes', '2026-06-01', 'Pendiente', 2),
('Auditoría del balance trimestral', '2026-05-25', 'Completada', 3);

INSERT INTO Proyectos (nombre_proyecto, presupuesto_proyecto, id_empleado) VALUES
('Implementación Sistema ERP', 2500000.00, 1),
('Plan de Capacitación Anual 2026', 450000.00, 2);

SELECT * FROM Empleado;