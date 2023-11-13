Ejercicio 1


create database compradores;

use compradores;

create table compradores(

cif_comprador varchar(11) primary key,

nombre_social varchar(30),

domicilio_social varchar(30),

localidad varchar(30),

c_postal varchar(5),

telefono varchar(9) not null,

constraint UQ_COMPRADORES_NOMBRE_SOCIAL unique (Nombre_social)

);



create table articulos(

referencia_articulo varchar(12) primary key,

descripcion_articulo varchar(30),

precio_unidad  decimal(6,2),

iva numeric(2) check (iva >=5 and iva <= 25),

exixtencias_actuales numeric(5) default 0


);


create table facturas(

num_factura numeric(6) primary key,

fecha_factura date default "2005-01-01",

cif_cliente varchar(11)


);

create table lineas_factura(

num_factura numeric(6),

referencia_articulo varchar(12),

unidades numeric(3),

primary key (num_factura, referencia_articulo),

constraint FK_LINEAS_FACTURAS foreign key (num_factura) references FACTURAS(num_factura) on delete cascade,

constraint FK_LINEAS_ARTICULOS foreign key (referencia_articulo) references articulos(referencia_articulo)

);

alter table facturas add column cod_oficina numeric(4);


alter table facturas add constraint FK_FACTURA_COMPRADORES foreign key (cif_cliente) references compradores(cif_comprador);

alter table compradores rename column c_postal to codigo_postal;




Ejercicio 2:

create database empresa;

use empresa;

create table empleado (
cod_e varchar(10) primary key,

nombre varchar(30),

cod_d varchar(10),

fecha_incorporacion date

);

create table proyecto(
cod_d varchar(10) primary key);


create table departamento (

cod_d varchar(10) primary key,

nombre varchar(30),

responsable varchar(30),

foreign key (responsable) references empleado(cod_e) on delete set null on update cascade

);

create table es_jefe(
cod_e varchar(10),
cod_jefe varchar(10),
primary key(cod_e, cod_jefe),
foreign key (cod_e) references empleado(cod_e) on delete restrict on update cascade,
foreign key (cod_jefe) references empleado(cod_jefe) on delete restrict on update cascade

);

create table emp_proy(
cod_e varchar(10),
cod_p varchar(10),
primary key(cod_e, cod_p),
foreign key (cod_e) references empleado (cod_e) on delete restrict on update cascade,
foreign key (cod_p) references proyecto (cod_p) on delete restrict on update cascade
);

alter table empleado add foreign key (cod_d) references departamento(cod_d) on delete set null on update cascade;



/*Ejercicio 3:*/

create database Examen18_19;

use Examen18_19;

create table insignia(
id_insignia int auto_increment primary key,

descripcion varchar(50) unique not null

);


create table usuario(
id_usuario int auto_increment primary key,
nombre varchar(30) unique not null,
edad int,
tutor int,
insignia int,
foreign key (tutor) references usuario(id_usuario),
foreign key (insignia) references  insignia (id_insignia)

);


create table tipo_accion(
id_accion int auto_increment primary key,
descripcion varchar(30) not null


);


create table accion(
id_accion int,
dia date,
foreign key (id_accion) references tipo_accion (id_accion),
primary key (id_accion, dia)

);


create table objetivo(nombre varchar(20) primary key);


create table hacer(
usuario int not null,
tipo_a int,
dia_a date,
objetivo varchar(20),
foreign key (usuario) references usuario (id_usuario),
foreign key (tipo_a, dia_a) references accion (id_accion, dia),
primary key(tipo_a, dia_a, objetivo)

);


create table exito(
tipo_a int,
dia_a date,
objetivo varchar(20),
dia_fin date,
foreign key (tipo_a, dia_a, objetivo) references hacer (tipo_a, dia_a, objetivo)


);


create table fracaso(
tipo_a int,
dia_a date,
objetivo varchar(20),
dia_fin date,
foreign key (tipo_a, dia_a, objetivo) references hacer (tipo_a, dia_a, objetivo)

);







