create database empresa;

use empresa;

create table empleado(
    cod_e varchar(10) primary key,
    nombre varchar(30),
    cod_d varchar(10),
    fecha_incorporacion date

);


create table es_jefe(
    cod_e varchar(10) primary key,
    cod_jefe varchar(10),
    foreign key(cod_e) references empleado(cod_e) on delete cascade on update cascade,
    foreign key(cod_jefe) references empleado(cod_e) on delete cascade on update cascade


);

create table proyecto(cod_p varchar(10) primary key);


create table emp_proy(
    cod_e varchar(10),
    cod_p varchar(10),
    primary key(cod_e, cod_p),
    foreign key (cod_e) references empleado(cod_e) on delete cascade on update cascade,
    foreign key(cod_p) references proyecto(cod_p) on delete cascade on update cascade

);


create table departamento(
    cod_d varchar(10) primary key,
    nombre varchar(30),
    responsable varchar(30) unique,
    foreign key (responsable) references empleado(cod_e) on delete set null on update cascade

);


alter table empleado add foreign key(cod_d) references departamento(cod_d) on delete set null on update cascade;