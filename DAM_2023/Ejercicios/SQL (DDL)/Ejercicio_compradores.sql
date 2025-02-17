/* Ejercicio compradores */

create database tienda;

use tienda;

create table compradores(
    cif_comprador varchar(11),
    nombre_social varchar(30),
    domicilio_social varchar(30),
    localidad varchar(30),
    c_postal varchar(5),
    telefono varchar (9) not null,
    primary key(cif_comprador),
    constraint UQ_COMPRADORES_NOMBRE_SOCIAL unique(nombre_social)

);


create table articulos(
    referencia_articulo varchar(12),
    descripcion_articulo varchar(30),
    precio_unidad numeric (6,2),
    iva numeric (2) check (iva > 4 and iva < 26),
    existencias_actuales numeric (5) default 0,
    primary key (referencia_articulo)

);

create table facturas(
    num_factura numeric(6),
    fecha_factura date default '2005-01-01',
    cif_cliente varchar(11),
    primary key(num_factura)

);

create table lineas_factura(
    num_factura numeric(6),
    referencia_articulo varchar(12),
    unidades numeric(3),
    primary key (num_factura, referencia_articulo),
    constraint FK_LINEAS_FACTURAS foreign key (num_factura) references facturas(num_factura) on delete cascade,
    constraint FK_LINEAS_ARTICULOS foreign key (referencia_articulo) references articulos (referencia_articulo)

);

alter table facturas add column cod_oficina numeric(4);

alter table facturas add constraint FK_FACTURA_COMPRADORES foreign key(cif_cliente) references compradores(cif_comprador);

alter table compradores rename column c_postal to codigo_postal;