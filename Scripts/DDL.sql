DROP TABLE Paciente_Relacionado;
DROP TABLE Paciente_Cita;
DROP TABLE Personal_Cita;
DROP TABLE Personal_Disputa;
DROP TABLE Disputa;
DROP TABLE Alergias;
DROP TABLE Motivos;
DROP TABLE Titulos_Calificaciones;
DROP TABLE Personal;
DROP TABLE Relacionado;
DROP TABLE Reclamacion;
DROP TABLE Cita;
DROP TABLE Poliza;
DROP TABLE Compania_Seguros;
DROP TABLE Paciente;



-- Creación de la tabla Paciente
CREATE TABLE Paciente (
    Cedula_Paciente VARCHAR(255) PRIMARY KEY,
    Nombre VARCHAR(255),
    Sexo VARCHAR(255),
    Direccion VARCHAR(255),
    Fecha_Nacimiento DATE,
    Cedula VARCHAR(255)
);

-- Creación de la tabla Personal
CREATE TABLE Personal (
    Cedula_Personal VARCHAR(255) PRIMARY KEY,
    Nombre VARCHAR(255),
    Sexo VARCHAR(255),
    Direccion VARCHAR(255),
    Cargo VARCHAR(255)
);

-- Creación de la tabla Cita
CREATE TABLE Cita (
    ID_Cita VARCHAR(255) PRIMARY KEY,
    Fecha_Hora_Programada VARCHAR(255),
    Fecha_Hora_Realizada VARCHAR(255)
);

-- Creación de la tabla Relacionado
CREATE TABLE Relacionado (
    Cedula_Relacionado VARCHAR(255) PRIMARY KEY,
    Puede_Tomar_Decisiones VARCHAR(255),
    Nombre VARCHAR(255),
    Tipo_Relacion VARCHAR(255)
);

-- Creación de la tabla Poliza
CREATE TABLE Poliza (
    Numero_Poliza VARCHAR(255) PRIMARY KEY,
    Valor_Maximo VARCHAR(255),
    Tipo_Cobertura VARCHAR(255),
    Cedula_Paciente VARCHAR(255),
    FOREIGN KEY (Cedula_Paciente) REFERENCES Paciente(Cedula_Paciente)
);

-- Creación de la tabla Compañia_Seguros
CREATE TABLE Compania_Seguros (
    NIT VARCHAR(255) PRIMARY KEY,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    IP VARCHAR(255),
    Contacto VARCHAR(255)
);

CREATE TABLE Reclamacion (
    Codigo_Reclamo VARCHAR(255) PRIMARY KEY,
    Fecha_Accion DATE,
    Fecha_Presentacion DATE,
    Fecha_Pago DATE,
    Monto_Pagado INT,
    Monto_Reclamado INT,
    Codigo_Razon VARCHAR(255),
    Cedula_Paciente VARCHAR(255),
    ID_Cita VARCHAR(255),
    Numero_Poliza VARCHAR(255),
    NIT VARCHAR(255),
    FOREIGN KEY (Cedula_Paciente) REFERENCES Paciente(Cedula_Paciente),
    FOREIGN KEY (ID_Cita) REFERENCES Cita(ID_Cita),
    FOREIGN KEY (Numero_Poliza) REFERENCES Poliza(Numero_Poliza),
    FOREIGN KEY (NIT) REFERENCES Compania_Seguros(NIT)
);

-- Creación de la tabla Disputa
CREATE TABLE Disputa (
    ID_Disputa VARCHAR(255) PRIMARY KEY,
    Estado_Disputa VARCHAR(255),
    Motivo_Disputa VARCHAR(255),
    Fecha_Procesamiento DATE,
    Codigo_Reclamo VARCHAR(255),
    FOREIGN KEY (Codigo_Reclamo) REFERENCES Reclamacion(Codigo_Reclamo)
);

-- Creación de la tabla Alergias
CREATE TABLE Alergias (
    Cedula_Paciente VARCHAR(255),
    Tipo_Alergia VARCHAR(255),
    PRIMARY KEY (Cedula_Paciente, Tipo_Alergia),
    FOREIGN KEY (Cedula_Paciente) REFERENCES Paciente(Cedula_Paciente)
);

-- Creación de la tabla Motivos
CREATE TABLE Motivos (
    ID_Cita_Motivo VARCHAR(255) PRIMARY KEY,
    ID_Cita VARCHAR(255),
    Motivo VARCHAR(255),
    FOREIGN KEY (ID_Cita) REFERENCES Cita(ID_Cita)
);

-- Creación de la tabla Titulos_Calificaciones
CREATE TABLE Titulos_Calificaciones (
    Cedula_Personal VARCHAR(255),
    Titulo VARCHAR(255),
    PRIMARY KEY (Cedula_Personal, Titulo),
    FOREIGN KEY (Cedula_Personal) REFERENCES Personal(Cedula_Personal)
);

-- Creación de la tabla Paciente_Relacionado
CREATE TABLE Paciente_Relacionado (
    Cedula_Paciente VARCHAR(255),
    Cedula_Relacionado VARCHAR(255),
    PRIMARY KEY (Cedula_Paciente, Cedula_Relacionado),
    FOREIGN KEY (Cedula_Paciente) REFERENCES Paciente(Cedula_Paciente),
    FOREIGN KEY (Cedula_Relacionado) REFERENCES Relacionado(Cedula_Relacionado)
);

-- Creación de la tabla Paciente-Cita
CREATE TABLE Paciente_Cita (
    Cedula_Paciente VARCHAR(255),
    ID_Cita VARCHAR(255),
    PRIMARY KEY (Cedula_Paciente, ID_Cita),
    FOREIGN KEY (Cedula_Paciente) REFERENCES Paciente(Cedula_Paciente),
    FOREIGN KEY (ID_Cita) REFERENCES Cita(ID_Cita)
);

-- Creación de la tabla Personal-Cita
CREATE TABLE Personal_Cita (
    ID_Cita VARCHAR(255),
    Cedula_Personal VARCHAR(255),
    PRIMARY KEY (ID_Cita, Cedula_Personal),
    FOREIGN KEY (ID_Cita) REFERENCES Cita(ID_Cita),
    FOREIGN KEY (Cedula_Personal) REFERENCES Personal(Cedula_Personal)
);

-- Creación de la tabla Personal-Disputa
CREATE TABLE Personal_Disputa (
    Cedula_Personal VARCHAR(255),
    ID_Disputa VARCHAR(255),
    PRIMARY KEY (Cedula_Personal, ID_Disputa),
    FOREIGN KEY (Cedula_Personal) REFERENCES Personal(Cedula_Personal),
    FOREIGN KEY (ID_Disputa) REFERENCES Disputa(ID_Disputa)
);

-- Para la tabla Paciente
INSERT INTO Paciente (Cedula_Paciente, Nombre, Sexo, Direccion, Fecha_Nacimiento, Cedula)
VALUES ('1234567890', 'Ana García', 'Femenino', 'Calle 123', TO_DATE('1990-03-15', 'YYYY-MM-DD'), '0987654321');
INSERT INTO Paciente (Cedula_Paciente, Nombre, Sexo, Direccion, Fecha_Nacimiento, Cedula)
VALUES ('2345678901', 'Juan Lopez', 'Masculino', 'Avenida Central', TO_DATE('1985-07-20', 'YYYY-MM-DD'), '1234567890');
INSERT INTO Paciente (Cedula_Paciente, Nombre, Sexo, Direccion, Fecha_Nacimiento, Cedula)
VALUES('3456789012', 'María Martínez', 'Femenino', 'Avenida Principal', TO_DATE('1978-11-10', 'YYYY-MM-DD'), '2345678901');
INSERT INTO Paciente (Cedula_Paciente, Nombre, Sexo, Direccion, Fecha_Nacimiento, Cedula)
VALUES('4567890123', 'Pedro Hernandez', 'Masculino', 'Calle Sur', TO_DATE('1995-05-03', 'YYYY-MM-DD'), '3456789012');
INSERT INTO Paciente (Cedula_Paciente, Nombre, Sexo, Direccion, Fecha_Nacimiento, Cedula)
VALUES('5678901234', 'Laura Ramirez', 'Femenino', 'Calle Norte', TO_DATE('1980-09-25', 'YYYY-MM-DD'), '4567890123');
INSERT INTO Paciente (Cedula_Paciente, Nombre, Sexo, Direccion, Fecha_Nacimiento, Cedula)
VALUES('6789012345', 'Daniel Perez', 'Masculino', 'Calle Este', TO_DATE('1992-12-18', 'YYYY-MM-DD'), '5678901234');
INSERT INTO Paciente (Cedula_Paciente, Nombre, Sexo, Direccion, Fecha_Nacimiento, Cedula)
VALUES('7890123456', 'Sofia Diaz', 'Femenino', 'Avenida Oeste', TO_DATE('1987-04-30', 'YYYY-MM-DD'), '6789012345');
INSERT INTO Paciente (Cedula_Paciente, Nombre, Sexo, Direccion, Fecha_Nacimiento, Cedula)
VALUES('8901234567', 'Carlos Castro', 'Masculino', 'Calle 5', TO_DATE('1983-08-12', 'YYYY-MM-DD'), '7890123456');
INSERT INTO Paciente (Cedula_Paciente, Nombre, Sexo, Direccion, Fecha_Nacimiento, Cedula)
VALUES('9012345678', 'Julia Gonzalez', 'Femenino', 'Avenida 6', TO_DATE('1975-02-05', 'YYYY-MM-DD'), '8901234567');
INSERT INTO Paciente (Cedula_Paciente, Nombre, Sexo, Direccion, Fecha_Nacimiento, Cedula)
VALUES('0123456789', 'Luisa Torres', 'Femenino', 'Carrera 7', TO_DATE('1998-06-28', 'YYYY-MM-DD'), '9012345678');

-- Para la tabla Personal
INSERT INTO Personal (Cedula_Personal, Nombre, Sexo, Direccion, Cargo)
VALUES ('0987654321', 'Carlos Sánchez', 'Masculino', 'Calle 10', 'Médico');
INSERT INTO Personal (Cedula_Personal, Nombre, Sexo, Direccion, Cargo)
VALUES ('1098765432', 'Ana Rodríguez', 'Femenino', 'Avenida 11', 'Enfermera');
INSERT INTO Personal (Cedula_Personal, Nombre, Sexo, Direccion, Cargo)
VALUES ('2109876543', 'José González', 'Masculino', 'Carrera 12', 'Administrativo');
INSERT INTO Personal (Cedula_Personal, Nombre, Sexo, Direccion, Cargo)
VALUES ('3210987654', 'María Pérez', 'Femenino', 'Calle 13', 'Médico');
INSERT INTO Personal (Cedula_Personal, Nombre, Sexo, Direccion, Cargo)
VALUES ('4321098765', 'Juan Díaz', 'Masculino', 'Avenida 14', 'Enfermera');
INSERT INTO Personal (Cedula_Personal, Nombre, Sexo, Direccion, Cargo)
VALUES ('5432109876', 'Laura Martínez', 'Femenino', 'Carrera 15', 'Administrativo');
INSERT INTO Personal (Cedula_Personal, Nombre, Sexo, Direccion, Cargo)
VALUES ('6543210987', 'Pedro Gómez', 'Masculino', 'Calle 16', 'Médico');
INSERT INTO Personal (Cedula_Personal, Nombre, Sexo, Direccion, Cargo)
VALUES ('7654321098', 'Sofía Hernández', 'Femenino', 'Avenida 17', 'Enfermera');
INSERT INTO Personal (Cedula_Personal, Nombre, Sexo, Direccion, Cargo)
VALUES ('8765432109', 'Daniel Ramírez', 'Masculino', 'Carrera 18', 'Administrativo');
INSERT INTO Personal (Cedula_Personal, Nombre, Sexo, Direccion, Cargo)
VALUES ('9876543210', 'Luisa Soto', 'Femenino', 'Calle 19', 'Médico');

-- Para la tabla Cita
INSERT INTO Cita (ID_Cita, Fecha_Hora_Programada, Fecha_Hora_Realizada)
VALUES ('001', '2024-04-30 10:00:00', '2024-04-30 10:15:00');
INSERT INTO Cita (ID_Cita, Fecha_Hora_Programada, Fecha_Hora_Realizada)
VALUES ('002', '2024-04-30 11:00:00', '2024-04-30 11:15:00');
INSERT INTO Cita (ID_Cita, Fecha_Hora_Programada, Fecha_Hora_Realizada)
VALUES ('003', '2024-05-01 09:30:00', '2024-05-01 09:45:00');
INSERT INTO Cita (ID_Cita, Fecha_Hora_Programada, Fecha_Hora_Realizada)
VALUES ('004', '2024-05-01 13:00:00', '2024-05-01 13:15:00');
INSERT INTO Cita (ID_Cita, Fecha_Hora_Programada, Fecha_Hora_Realizada)
VALUES ('005', '2024-05-02 14:30:00', '2024-05-02 14:45:00');
INSERT INTO Cita (ID_Cita, Fecha_Hora_Programada, Fecha_Hora_Realizada)
VALUES ('006', '2024-05-02 15:45:00', '2024-05-02 16:00:00');
INSERT INTO Cita (ID_Cita, Fecha_Hora_Programada, Fecha_Hora_Realizada)
VALUES ('007', '2024-05-03 11:30:00', '2024-05-03 11:45:00');
INSERT INTO Cita (ID_Cita, Fecha_Hora_Programada, Fecha_Hora_Realizada)
VALUES ('008', '2024-05-03 12:45:00', '2024-05-03 13:00:00');
INSERT INTO Cita (ID_Cita, Fecha_Hora_Programada, Fecha_Hora_Realizada)
VALUES ('009', '2024-05-04 08:00:00', '2024-05-04 08:15:00');
INSERT INTO Cita (ID_Cita, Fecha_Hora_Programada, Fecha_Hora_Realizada)
VALUES ('010', '2024-05-04 09:15:00', '2024-05-04 09:30:00');

-- Para la tabla relacionado
INSERT INTO Relacionado (Cedula_Relacionado, Puede_Tomar_Decisiones, Nombre, Tipo_Relacion)
VALUES ('9876543210', 'Sí', 'Martín Soto', 'Padre');
INSERT INTO Relacionado (Cedula_Relacionado, Puede_Tomar_Decisiones, Nombre, Tipo_Relacion)
VALUES ('8765432109', 'No', 'Laura Ramírez', 'Hermana');
INSERT INTO Relacionado (Cedula_Relacionado, Puede_Tomar_Decisiones, Nombre, Tipo_Relacion)
VALUES ('7654321098', 'Sí', 'Ana Pérez', 'Madre');
INSERT INTO Relacionado (Cedula_Relacionado, Puede_Tomar_Decisiones, Nombre, Tipo_Relacion)
VALUES ('6543210987', 'Sí', 'Pedro Gómez', 'Padre');
INSERT INTO Relacionado (Cedula_Relacionado, Puede_Tomar_Decisiones, Nombre, Tipo_Relacion)
VALUES ('5432109876', 'No', 'Luis Martínez', 'Hermano');
INSERT INTO Relacionado (Cedula_Relacionado, Puede_Tomar_Decisiones, Nombre, Tipo_Relacion)
VALUES ('4321098765', 'Sí', 'Sofía Díaz', 'Madre');
INSERT INTO Relacionado (Cedula_Relacionado, Puede_Tomar_Decisiones, Nombre, Tipo_Relacion)
VALUES ('3210987654', 'No', 'Juan González', 'Padre');
INSERT INTO Relacionado (Cedula_Relacionado, Puede_Tomar_Decisiones, Nombre, Tipo_Relacion)
VALUES ('2109876543', 'Sí', 'María Rodríguez', 'Madre');
INSERT INTO Relacionado (Cedula_Relacionado, Puede_Tomar_Decisiones, Nombre, Tipo_Relacion)
VALUES ('1098765432', 'Sí', 'Carlos Sánchez', 'Padre');
INSERT INTO Relacionado (Cedula_Relacionado, Puede_Tomar_Decisiones, Nombre, Tipo_Relacion)
VALUES ('0987654321', 'No', 'Ana García', 'Hermana');

-- Para la tabla Poliza
INSERT INTO Poliza (Numero_Poliza, Valor_Maximo, Tipo_Cobertura, Cedula_Paciente)
VALUES ('P001', '1000', 'Cobertura Básica', '1234567890');
INSERT INTO Poliza (Numero_Poliza, Valor_Maximo, Tipo_Cobertura, Cedula_Paciente)
VALUES ('P002', '2000', 'Cobertura Extendida', '2345678901');
INSERT INTO Poliza (Numero_Poliza, Valor_Maximo, Tipo_Cobertura, Cedula_Paciente)
VALUES ('P003', '1500', 'Cobertura Completa', '3456789012');
INSERT INTO Poliza (Numero_Poliza, Valor_Maximo, Tipo_Cobertura, Cedula_Paciente)
VALUES ('P004', '1800', 'Cobertura Básica', '4567890123');
INSERT INTO Poliza (Numero_Poliza, Valor_Maximo, Tipo_Cobertura, Cedula_Paciente)
VALUES ('P005', '2200', 'Cobertura Extendida', '5678901234');
INSERT INTO Poliza (Numero_Poliza, Valor_Maximo, Tipo_Cobertura, Cedula_Paciente)
VALUES ('P006', '1300', 'Cobertura Básica', '6789012345');
INSERT INTO Poliza (Numero_Poliza, Valor_Maximo, Tipo_Cobertura, Cedula_Paciente)
VALUES ('P007', '2400', 'Cobertura Extendida', '7890123456');
INSERT INTO Poliza (Numero_Poliza, Valor_Maximo, Tipo_Cobertura, Cedula_Paciente)
VALUES ('P008', '1700', 'Cobertura Completa', '8901234567');
INSERT INTO Poliza (Numero_Poliza, Valor_Maximo, Tipo_Cobertura, Cedula_Paciente)
VALUES ('P009', '1900', 'Cobertura Básica', '9012345678');
INSERT INTO Poliza (Numero_Poliza, Valor_Maximo, Tipo_Cobertura, Cedula_Paciente)
VALUES ('P010', '2100', 'Cobertura Extendida', '0123456789');

-- Para la tabla Compania_Seguros
INSERT INTO Compania_Seguros (NIT, Nombre, Direccion, IP, Contacto)
VALUES ('C001', 'SegurosABC', 'Calle Principal', '192.168.1.1', 'contacto@segurosabc.com');
INSERT INTO Compania_Seguros (NIT, Nombre, Direccion, IP, Contacto)
VALUES ('C002', 'SegurosXYZ', 'Avenida Central', '192.168.1.2', 'contacto@segurosxyz.com');
INSERT INTO Compania_Seguros (NIT, Nombre, Direccion, IP, Contacto)
VALUES ('C003', 'Seguros123', 'Carrera 1', '192.168.1.3', 'contacto@seguros123.com');
INSERT INTO Compania_Seguros (NIT, Nombre, Direccion, IP, Contacto)
VALUES ('C004', 'Seguros456', 'Calle Sur', '192.168.1.4', 'contacto@seguros456.com');
INSERT INTO Compania_Seguros (NIT, Nombre, Direccion, IP, Contacto)
VALUES ('C005', 'Seguros789', 'Avenida Norte', '192.168.1.5', 'contacto@seguros789.com');
INSERT INTO Compania_Seguros (NIT, Nombre, Direccion, IP, Contacto)
VALUES ('C006', 'SegurosABC', 'Calle Principal', '192.168.1.1', 'contacto@segurosabc.com');
INSERT INTO Compania_Seguros (NIT, Nombre, Direccion, IP, Contacto)
VALUES ('C007', 'SegurosXYZ', 'Avenida Central', '192.168.1.2', 'contacto@segurosxyz.com');
INSERT INTO Compania_Seguros (NIT, Nombre, Direccion, IP, Contacto)
VALUES ('C008', 'Seguros123', 'Carrera 1', '192.168.1.3', 'contacto@seguros123.com');
INSERT INTO Compania_Seguros (NIT, Nombre, Direccion, IP, Contacto)
VALUES ('C009', 'Seguros456', 'Calle Sur', '192.168.1.4', 'contacto@seguros456.com');
INSERT INTO Compania_Seguros (NIT, Nombre, Direccion, IP, Contacto)
VALUES ('C010', 'Seguros789', 'Avenida Norte', '192.168.1.5', 'contacto@seguros789.com');

-- Para la tabla Reclamacion
INSERT INTO Reclamacion (Codigo_Reclamo, Fecha_Accion, Fecha_Presentacion, Fecha_Pago, Monto_Pagado, Monto_Reclamado, Codigo_Razon, Cedula_Paciente, ID_Cita, Numero_Poliza, NIT)
VALUES ('R001', TO_DATE('2024-04-30', 'YYYY-MM-DD'), TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-10', 'YYYY-MM-DD'), 500, 500,'CR001', '1234567890', '001', 'P001', 'C001');
INSERT INTO Reclamacion (Codigo_Reclamo, Fecha_Accion, Fecha_Presentacion, Fecha_Pago, Monto_Pagado, Monto_Reclamado, Codigo_Razon, Cedula_Paciente, ID_Cita, Numero_Poliza, NIT)
VALUES ('R002', TO_DATE('2024-05-02', 'YYYY-MM-DD'), TO_DATE('2024-05-03', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'), 700, 1200, 'CR002', '2345678901', '002', 'P002', 'C002');
INSERT INTO Reclamacion (Codigo_Reclamo, Fecha_Accion, Fecha_Presentacion, Fecha_Pago, Monto_Pagado, Monto_Reclamado, Codigo_Razon, Cedula_Paciente, ID_Cita, Numero_Poliza, NIT)
VALUES ('R003', TO_DATE('2024-05-04', 'YYYY-MM-DD'), TO_DATE('2024-05-05', 'YYYY-MM-DD'), TO_DATE('2024-05-20', 'YYYY-MM-DD'), 600, 1500, 'CR003', '3456789012', '003', 'P003', 'C003');
INSERT INTO Reclamacion (Codigo_Reclamo, Fecha_Accion, Fecha_Presentacion, Fecha_Pago, Monto_Pagado, Monto_Reclamado, Codigo_Razon, Cedula_Paciente, ID_Cita, Numero_Poliza, NIT)
VALUES ('R004', TO_DATE('2024-05-06', 'YYYY-MM-DD'), TO_DATE('2024-05-07', 'YYYY-MM-DD'), TO_DATE('2024-05-25', 'YYYY-MM-DD'), 800, 500, 'CR004', '4567890123', '004', 'P004', 'C004');
INSERT INTO Reclamacion (Codigo_Reclamo, Fecha_Accion, Fecha_Presentacion, Fecha_Pago, Monto_Pagado, Monto_Reclamado, Codigo_Razon, Cedula_Paciente, ID_Cita, Numero_Poliza, NIT)
VALUES ('R005', TO_DATE('2024-05-08', 'YYYY-MM-DD'), TO_DATE('2024-05-09', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), 900, 900, 'CR005', '5678901234', '005', 'P005', 'C005');
INSERT INTO Reclamacion (Codigo_Reclamo, Fecha_Accion, Fecha_Presentacion, Fecha_Pago, Monto_Pagado, Monto_Reclamado, Codigo_Razon, Cedula_Paciente, ID_Cita, Numero_Poliza, NIT)
VALUES ('R006', TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2024-05-11', 'YYYY-MM-DD'), TO_DATE('2024-06-05', 'YYYY-MM-DD'), 1000, 1000, 'CR006', '6789012345', '006', 'P006', 'C006');
INSERT INTO Reclamacion (Codigo_Reclamo, Fecha_Accion, Fecha_Presentacion, Fecha_Pago, Monto_Pagado, Monto_Reclamado, Codigo_Razon, Cedula_Paciente, ID_Cita, Numero_Poliza, NIT)
VALUES ('R007', TO_DATE('2024-05-12', 'YYYY-MM-DD'), TO_DATE('2024-05-13', 'YYYY-MM-DD'), TO_DATE('2024-06-10', 'YYYY-MM-DD'), 1100, 500, 'CR007', '7890123456', '007', 'P007', 'C007');
INSERT INTO Reclamacion (Codigo_Reclamo, Fecha_Accion, Fecha_Presentacion, Fecha_Pago, Monto_Pagado, Monto_Reclamado, Codigo_Razon, Cedula_Paciente, ID_Cita, Numero_Poliza, NIT)
VALUES ('R008', TO_DATE('2024-05-14', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'), TO_DATE('2024-06-15', 'YYYY-MM-DD'), 1200, 230, 'CR008', '8901234567', '008', 'P008', 'C008');
INSERT INTO Reclamacion (Codigo_Reclamo, Fecha_Accion, Fecha_Presentacion, Fecha_Pago, Monto_Pagado, Monto_Reclamado, Codigo_Razon, Cedula_Paciente, ID_Cita, Numero_Poliza, NIT)
VALUES ('R009', TO_DATE('2024-05-16', 'YYYY-MM-DD'), TO_DATE('2024-05-17', 'YYYY-MM-DD'), TO_DATE('2024-06-20', 'YYYY-MM-DD'), 1300, 1500, 'CR009', '9012345678', '009', 'P009', 'C009');
INSERT INTO Reclamacion (Codigo_Reclamo, Fecha_Accion, Fecha_Presentacion, Fecha_Pago, Monto_Pagado, Monto_Reclamado, Codigo_Razon, Cedula_Paciente, ID_Cita, Numero_Poliza, NIT)
VALUES ('R010', TO_DATE('2024-05-18', 'YYYY-MM-DD'), TO_DATE('2024-05-19', 'YYYY-MM-DD'), TO_DATE('2024-06-25', 'YYYY-MM-DD'), 1400, 1400, 'CR010', '0123456789', '010', 'P010', 'C010');


-- Para la tabla Disputa
INSERT INTO Disputa (ID_Disputa, Estado_Disputa, Motivo_Disputa, Fecha_Procesamiento, Codigo_Reclamo)
VALUES ('D001', 'En Proceso', 'Negación de Pago', TO_DATE('2024-05-11', 'YYYY-MM-DD'), 'R001');
INSERT INTO Disputa (ID_Disputa, Estado_Disputa, Motivo_Disputa, Fecha_Procesamiento, Codigo_Reclamo)
VALUES ('D002', 'En Proceso', 'Negación de Cobertura', TO_DATE('2024-05-13', 'YYYY-MM-DD'), 'R002');
INSERT INTO Disputa (ID_Disputa, Estado_Disputa, Motivo_Disputa, Fecha_Procesamiento, Codigo_Reclamo)
VALUES ('D003', 'Resuelta', 'Error en Facturación', TO_DATE('2024-05-15', 'YYYY-MM-DD'), 'R003');
INSERT INTO Disputa (ID_Disputa, Estado_Disputa, Motivo_Disputa, Fecha_Procesamiento, Codigo_Reclamo)
VALUES ('D004', 'En Proceso', 'Demora en el Pago', TO_DATE('2024-05-17', 'YYYY-MM-DD'), 'R004');
INSERT INTO Disputa (ID_Disputa, Estado_Disputa, Motivo_Disputa, Fecha_Procesamiento, Codigo_Reclamo)
VALUES ('D005', 'En Proceso', 'Monto Incorrecto', TO_DATE('2024-05-19', 'YYYY-MM-DD'), 'R005');
INSERT INTO Disputa (ID_Disputa, Estado_Disputa, Motivo_Disputa, Fecha_Procesamiento, Codigo_Reclamo)
VALUES ('D006', 'En Proceso', 'Negación de Pago', TO_DATE('2024-05-21', 'YYYY-MM-DD'), 'R006');
INSERT INTO Disputa (ID_Disputa, Estado_Disputa, Motivo_Disputa, Fecha_Procesamiento, Codigo_Reclamo)
VALUES ('D007', 'Resuelta', 'Cobertura No Autorizada', TO_DATE('2024-05-23', 'YYYY-MM-DD'), 'R007');
INSERT INTO Disputa (ID_Disputa, Estado_Disputa, Motivo_Disputa, Fecha_Procesamiento, Codigo_Reclamo)
VALUES ('D008', 'En Proceso', 'Error en Facturación', TO_DATE('2024-05-25', 'YYYY-MM-DD'), 'R008');
INSERT INTO Disputa (ID_Disputa, Estado_Disputa, Motivo_Disputa, Fecha_Procesamiento, Codigo_Reclamo)
VALUES ('D009', 'En Proceso', 'Negación de Cobertura', TO_DATE('2024-05-27', 'YYYY-MM-DD'), 'R009');
INSERT INTO Disputa (ID_Disputa, Estado_Disputa, Motivo_Disputa, Fecha_Procesamiento, Codigo_Reclamo)
VALUES ('D010', 'En Proceso', 'Error en la Facturación', TO_DATE('2024-05-29', 'YYYY-MM-DD'), 'R010');

-- Para la tabla Alergias
INSERT INTO Alergias (Cedula_Paciente, Tipo_Alergia)
VALUES ('1234567890', 'Polen');
INSERT INTO Alergias (Cedula_Paciente, Tipo_Alergia)
VALUES ('1234567890', 'Maní');
INSERT INTO Alergias (Cedula_Paciente, Tipo_Alergia)
VALUES ('2345678901', 'Lácteos');
INSERT INTO Alergias (Cedula_Paciente, Tipo_Alergia)
VALUES ('2345678901', 'Mariscos');
INSERT INTO Alergias (Cedula_Paciente, Tipo_Alergia)
VALUES ('3456789012', 'Penicilina');
INSERT INTO Alergias (Cedula_Paciente, Tipo_Alergia)
VALUES ('3456789012', 'Cacahuetes');
INSERT INTO Alergias (Cedula_Paciente, Tipo_Alergia)
VALUES ('4567890123', 'Ácaros');
INSERT INTO Alergias (Cedula_Paciente, Tipo_Alergia)
VALUES ('4567890123', 'Gluten');
INSERT INTO Alergias (Cedula_Paciente, Tipo_Alergia)
VALUES ('5678901234', 'Polen');
INSERT INTO Alergias (Cedula_Paciente, Tipo_Alergia)
VALUES ('5678901234', 'Leche');

-- Para la tabla Motivos
INSERT INTO Motivos (ID_Cita_Motivo, ID_Cita, Motivo)
VALUES ('M001', '001', 'Consulta de rutina');
INSERT INTO Motivos (ID_Cita_Motivo, ID_Cita, Motivo)
VALUES ('M002', '002', 'Examen de sangre');
INSERT INTO Motivos (ID_Cita_Motivo, ID_Cita, Motivo)
VALUES ('M003', '003', 'Vacunación');
INSERT INTO Motivos (ID_Cita_Motivo, ID_Cita, Motivo)
VALUES ('M004', '004', 'Consulta de rutina');
INSERT INTO Motivos (ID_Cita_Motivo, ID_Cita, Motivo)
VALUES ('M005', '005', 'Examen físico');
INSERT INTO Motivos (ID_Cita_Motivo, ID_Cita, Motivo)
VALUES ('M006', '006', 'Consulta de rutina');
INSERT INTO Motivos (ID_Cita_Motivo, ID_Cita, Motivo)
VALUES ('M007', '007', 'Examen de vista');
INSERT INTO Motivos (ID_Cita_Motivo, ID_Cita, Motivo)
VALUES ('M008', '008', 'Consulta de rutina');
INSERT INTO Motivos (ID_Cita_Motivo, ID_Cita, Motivo)
VALUES ('M009', '009', 'Examen dental');
INSERT INTO Motivos (ID_Cita_Motivo, ID_Cita, Motivo)
VALUES ('M010', '010', 'Consulta de rutina');

-- Para la tabla Titulos_Calificaciones
INSERT INTO Titulos_Calificaciones (Cedula_Personal, Titulo)
VALUES ('0987654321', 'Doctor en Medicina');
INSERT INTO Titulos_Calificaciones (Cedula_Personal, Titulo)
VALUES ('0987654321', 'Especialista en Cardiología');
INSERT INTO Titulos_Calificaciones (Cedula_Personal, Titulo)
VALUES ('1098765432', 'Enfermera Certificada');
INSERT INTO Titulos_Calificaciones (Cedula_Personal, Titulo)
VALUES ('1098765432', 'Licenciada en Enfermería');
INSERT INTO Titulos_Calificaciones (Cedula_Personal, Titulo)
VALUES ('2109876543', 'Administrador de Empresas');
INSERT INTO Titulos_Calificaciones (Cedula_Personal, Titulo)
VALUES ('3210987654', 'Doctor en Pediatría');
INSERT INTO Titulos_Calificaciones (Cedula_Personal, Titulo)
VALUES ('3210987654', 'Especialista en Neonatología');
INSERT INTO Titulos_Calificaciones (Cedula_Personal, Titulo)
VALUES ('4321098765', 'Enfermero Licenciado');
INSERT INTO Titulos_Calificaciones (Cedula_Personal, Titulo)
VALUES ('4321098765', 'Especialista en Cuidados Intensivos');
INSERT INTO Titulos_Calificaciones (Cedula_Personal, Titulo)
VALUES ('5432109876', 'Técnico Administrativo en Salud');

--Para la tabla paciente-relacionado
INSERT INTO Paciente_Relacionado (Cedula_Paciente, Cedula_Relacionado)
VALUES ('1234567890', '9876543210');
INSERT INTO Paciente_Relacionado (Cedula_Paciente, Cedula_Relacionado)
VALUES ('2345678901', '8765432109');
INSERT INTO Paciente_Relacionado (Cedula_Paciente, Cedula_Relacionado)
VALUES ('3456789012', '7654321098');
INSERT INTO Paciente_Relacionado (Cedula_Paciente, Cedula_Relacionado)
VALUES ('4567890123', '6543210987');
INSERT INTO Paciente_Relacionado (Cedula_Paciente, Cedula_Relacionado)
VALUES ('5678901234', '5432109876');
INSERT INTO Paciente_Relacionado (Cedula_Paciente, Cedula_Relacionado)
VALUES ('6789012345', '4321098765');
INSERT INTO Paciente_Relacionado (Cedula_Paciente, Cedula_Relacionado)
VALUES ('7890123456', '3210987654');
INSERT INTO Paciente_Relacionado (Cedula_Paciente, Cedula_Relacionado)
VALUES ('8901234567', '2109876543');
INSERT INTO Paciente_Relacionado (Cedula_Paciente, Cedula_Relacionado)
VALUES ('9012345678', '1098765432');
INSERT INTO Paciente_Relacionado (Cedula_Paciente, Cedula_Relacionado)
VALUES ('0123456789', '0987654321');

-- Para la tabla Paciente_Cita
INSERT INTO Paciente_Cita (Cedula_Paciente, ID_Cita)
VALUES ('1234567890', '001');
INSERT INTO Paciente_Cita (Cedula_Paciente, ID_Cita)
VALUES ('2345678901', '002');
INSERT INTO Paciente_Cita (Cedula_Paciente, ID_Cita)
VALUES ('3456789012', '003');
INSERT INTO Paciente_Cita (Cedula_Paciente, ID_Cita)
VALUES ('4567890123', '004');
INSERT INTO Paciente_Cita (Cedula_Paciente, ID_Cita)
VALUES ('5678901234', '005');
INSERT INTO Paciente_Cita (Cedula_Paciente, ID_Cita)
VALUES ('6789012345', '006');
INSERT INTO Paciente_Cita (Cedula_Paciente, ID_Cita)
VALUES ('7890123456', '007');
INSERT INTO Paciente_Cita (Cedula_Paciente, ID_Cita)
VALUES ('8901234567', '008');
INSERT INTO Paciente_Cita (Cedula_Paciente, ID_Cita)
VALUES ('9012345678', '009');
INSERT INTO Paciente_Cita (Cedula_Paciente, ID_Cita)
VALUES ('0123456789', '010');

-- Para la tabla Personal_Cita
INSERT INTO Personal_Cita (ID_Cita, Cedula_Personal)
VALUES ('001', '0987654321');
INSERT INTO Personal_Cita (ID_Cita, Cedula_Personal)
VALUES ('002', '1098765432');
INSERT INTO Personal_Cita (ID_Cita, Cedula_Personal)
VALUES ('003', '2109876543');
INSERT INTO Personal_Cita (ID_Cita, Cedula_Personal)
VALUES ('004', '3210987654');
INSERT INTO Personal_Cita (ID_Cita, Cedula_Personal)
VALUES ('005', '4321098765');
INSERT INTO Personal_Cita (ID_Cita, Cedula_Personal)
VALUES ('006', '5432109876');
INSERT INTO Personal_Cita (ID_Cita, Cedula_Personal)
VALUES ('007', '6543210987');
INSERT INTO Personal_Cita (ID_Cita, Cedula_Personal)
VALUES ('008', '7654321098');
INSERT INTO Personal_Cita (ID_Cita, Cedula_Personal)
VALUES ('009', '8765432109');
INSERT INTO Personal_Cita (ID_Cita, Cedula_Personal)
VALUES ('010', '9876543210');

-- Para la tabla Personal_Disputa
INSERT INTO Personal_Disputa (Cedula_Personal, ID_Disputa)
VALUES ('0987654321', 'D001');
INSERT INTO Personal_Disputa (Cedula_Personal, ID_Disputa)
VALUES ('1098765432', 'D002');
INSERT INTO Personal_Disputa (Cedula_Personal, ID_Disputa)
VALUES ('2109876543', 'D003');
INSERT INTO Personal_Disputa (Cedula_Personal, ID_Disputa)
VALUES ('3210987654', 'D004');
INSERT INTO Personal_Disputa (Cedula_Personal, ID_Disputa)
VALUES ('4321098765', 'D005');
INSERT INTO Personal_Disputa (Cedula_Personal, ID_Disputa)
VALUES ('5432109876', 'D006');
INSERT INTO Personal_Disputa (Cedula_Personal, ID_Disputa)
VALUES ('6543210987', 'D007');
INSERT INTO Personal_Disputa (Cedula_Personal, ID_Disputa)
VALUES ('7654321098', 'D008');
INSERT INTO Personal_Disputa (Cedula_Personal, ID_Disputa)
VALUES ('8765432109', 'D009');
INSERT INTO Personal_Disputa (Cedula_Personal, ID_Disputa)
VALUES ('9876543210', 'D010');

GRANT SELECT ON Paciente TO JPALACIO;
GRANT SELECT ON Personal TO JPALACIO;
GRANT SELECT ON Cita TO JPALACIO;
GRANT SELECT ON Relacionado TO JPALACIO;
GRANT SELECT ON Poliza TO JPALACIO;
GRANT SELECT ON Compania_Seguros TO JPALACIO;
GRANT SELECT ON Reclamacion TO JPALACIO;
GRANT SELECT ON Disputa TO JPALACIO;
GRANT SELECT ON Alergias TO JPALACIO;
GRANT SELECT ON Motivos TO JPALACIO;
GRANT SELECT ON Titulos_Calificaciones TO JPALACIO;
GRANT SELECT ON Paciente_Relacionado TO JPALACIO;
GRANT SELECT ON Paciente_Cita TO JPALACIO;
GRANT SELECT ON Personal_Cita TO JPALACIO;
GRANT SELECT ON Personal_Disputa TO JPALACIO;