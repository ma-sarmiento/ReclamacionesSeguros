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

