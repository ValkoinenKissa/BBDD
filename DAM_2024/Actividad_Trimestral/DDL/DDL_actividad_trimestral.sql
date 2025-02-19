CREATE TABLE personas(
    DNI VARCHAR(9) NOT NULL,
    Nombre VARCHAR(50),
    Nacionalidad VARCHAR(3),
    PRIMARY KEY(DNI));

CREATE TABLE direccion_fabrica(
    Id_Fabrica VARCHAR(4) NOT NULL,
    Direccion VARCHAR(50),
    Numero INT,
    PRIMARY KEY(Id_Fabrica));

CREATE TABLE matricula_fabrica(
    Matricula VARCHAR(7) NOT NULL,
    ID_Fabrica VARCHAR(4),
    CONSTRAINT fk_id_fabrica_matricula
    FOREIGN KEY (ID_Fabrica) REFERENCES direccion_fabrica(ID_Fabrica),
    PRIMARY KEY (Matricula));

CREATE TABLE vehiculos(
    Marca VARCHAR(40) NOT NULL,
    Modelo VARCHAR(40) NOT NULL,
    Color VARCHAR(30),
    PRIMARY KEY(Marca, Modelo));

CREATE TABLE fabrica_marca(
    ID_Fabrica VARCHAR(4) NOT NULL,
    Marca VARCHAR(40) NOT NULL,
    Modelo VARCHAR(40) NOT NULL,
    CONSTRAINT fk_id_fabrica_fabrica
    FOREIGN KEY (ID_Fabrica) REFERENCES direccion_fabrica(ID_Fabrica),
    CONSTRAINT fk_vehiculos
    FOREIGN KEY (Marca, Modelo) REFERENCES vehiculos(Marca, Modelo),
    PRIMARY KEY(ID_Fabrica, Marca, Modelo));

CREATE TABLE fechas_alquiler(
    Fecha_inicio_alquiler DATE NOT NULL,
    Fecha_fin_alquiler DATE,
    PRIMARY KEY (Fecha_inicio_alquiler));

CREATE TABLE alquileres(
    DNI VARCHAR(9) NOT NULL,
    Fecha_inicio_alquiler DATE NOT NULL,
    Matricula VARCHAR(7) NOT NULL,
    CONSTRAINT fk_dni
    FOREIGN KEY (DNI) REFERENCES personas(DNI),
    CONSTRAINT fk_alquiler
    FOREIGN KEY (Fecha_inicio_alquiler) REFERENCES fechas_alquiler(Fecha_inicio_alquiler),
    CONSTRAINT fk_matricula
    FOREIGN KEY(Matricula) REFERENCES matricula_fabrica(Matricula),
    PRIMARY KEY(DNI, Fecha_inicio_alquiler, Matricula));