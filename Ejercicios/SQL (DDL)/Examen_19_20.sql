create database Examen19_20;

use Examen19_20;

create table estudio(
    id int auto_increment primary key,
    nombre varchar(30) not null

);


create table curso(
    curso varchar(5) primary key

);


create table modulo(
    id int auto_increment,
    nombre varchar(30) not null,
    horas_sem int not null default 6,
    primary key(id)

);

create table asignatura(
    id int,
    est int,
    curso varchar(5),
    primary key(id, est, curso),
    constraint FK_ID foreign key(id) references modulo(id) on delete restrict on update cascade,
    constraint FK_EST foreign key(est) references estudio(id) on update cascade,
    constraint FK_CURSO foreign key(curso) references curso(curso) on delete cascade

);

create table alumno(
    id decimal(5) primary key,
    nombre varchar(30) not null,
    dni varchar(9) unique not null,
    fechanac date default '1970-01-01'

);


create table asiste(
    alumno decimal(5),
    asignatura int,
    estudio int,
    curso varchar(5),
    primary key(alumno, asignatura, estudio, curso),
    constraint FK_ALUMNO foreign key(alumno) references alumno(id) on delete cascade on update cascade,
    constraint FK_ASIGNATURA_ESTUDIO_CURSO foreign key(asignatura, estudio, curso) references asignatura(id, est, curso) on delete restrict
);
