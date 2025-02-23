DROP DATABASE IF EXISTS uem;
CREATE DATABASE uem;
USE uem;


CREATE TABLE personas(
    DNI VARCHAR(9) NOT NULL,
    Nombre VARCHAR(50),
    Nacionalidad VARCHAR(3),
    PRIMARY KEY(DNI));


CREATE TABLE fabricas(
    ID_Fabrica VARCHAR(4) NOT NULL,
    Direccion_fabrica VARCHAR(60),
    PRIMARY KEY (ID_Fabrica)
);

CREATE TABLE vehiculos(
    Matricula VARCHAR(7),
    Marca VARCHAR(30),
    Modelo VARCHAR(30),
    Color VARCHAR(20),
    ID_Fabrica VARCHAR(4) NOT NULL,
    PRIMARY KEY (Matricula),
    CONSTRAINT fk_fabrica_matricula
    FOREIGN KEY (ID_Fabrica) REFERENCES
    fabricas (ID_Fabrica)
);

CREATE TABLE alquileres(
    DNI VARCHAR(9) NOT NULL,
    Fecha_inicio_alquiler DATE NOT NULL,
    Fecha_fin_alquiler DATE,
    Kilometraje INT,
    Matricula VARCHAR(7) NOT NULL ,
    PRIMARY KEY (DNI, Fecha_inicio_alquiler, Matricula),
    CONSTRAINT fk_dni_alquileres FOREIGN KEY (DNI) REFERENCES
    personas (DNI),
    CONSTRAINT fk_matricula_alquileres FOREIGN KEY (Matricula) REFERENCES
    vehiculos (Matricula)

);