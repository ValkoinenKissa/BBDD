create database Examen18_19;

use Examen18_19;


create table insignia(
    id int auto_increment primary key,
    descripcion varchar(50) unique not null

);

create table usuario(
    id int auto_increment primary key,
    nombre varchar(30) unique not null,
    edad int,
    tutor int,
    insignia int,
    constraint FK_USUARIO foreign key(tutor) references usuario(id),
    constraint FK_insignia foreign key(insignia) references insignia(id)

);


create table tipo_accion(
    id int auto_increment primary key,
    descripcion varchar(30) not null
);


create table accion(
    id int auto_increment,
    dia date,
    constraint FK_ACCION foreign key(id) references tipo_accion(id),
    primary key(id, dia)


);

create table objetivo(

    nombre varchar(20) primary key

);

create table hacer(

    usuario int not null,
    tipo_a int,
    dia_a date,
    objetivo varchar(20),
    dia_fin date,
    primary key(tipo_a, dia_a, objetivo),
    constraint FK_ACCION_TIPO foreign key(tipo_a, dia_a) references accion(id, dia),
    constraint FK_OBJETIVO foreign key(objetivo) references objetivo(nombre)

);


create table exito(
    tipo_a int,
    dia_a date,
    objetivo varchar(20),
    dia_fin date,
    constraint FK_HACER foreign key(tipo_a, dia_a, objetivo) references hacer(tipo_a, dia_a, objetivo)
);


create table fracaso(
    tipo_a int,
    dia_a date,
    objetivo varchar(20),
    dia_fin date,
    constraint FK_FRACASO foreign key(tipo_a, dia_a, objetivo) references hacer(tipo_a, dia_a, objetivo)
);