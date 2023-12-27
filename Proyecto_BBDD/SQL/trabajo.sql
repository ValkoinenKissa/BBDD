create database tiendaOnline;
use tiendaOnline;

create table categoria(

    id_categoria numeric(4) primary key,

    nombre_categoria varchar(30) unique,

    descripcion varchar(60)

    );

create table producto(

    id_producto numeric(4) primary key,

    nombre_producto varchar(25) unique,

    precio decimal(7,2),

    fabricante varchar(30),

    stock enum( 'S' , 'N' ),

    descripcion varchar(60),

    id_categoria numeric(4),

    foreign key (id_categoria) references categoria(id_categoria) on delete cascade on update cascade

    );

create table agencia_de_paqueteria(

    CIF varchar(9) primary key,

    nombre varchar(40)

    );

create table pedido(

    CIF varchar(9),

    id_pedido numeric(4),

    metodo_pago varchar(30),

    fecha_pedido date,

    estado enum( 'Preparacion' , 'Enviado' , 'Entregado' ),

    foreign key (CIF) references agencia_de_paqueteria(CIF) on delete cascade on update cascade,

    primary key(CIF,id_pedido)

    );

create table cliente(

    id_cliente numeric(4) primary key,

    usuario varchar(20) unique,

    correo varchar(30),

    telefono numeric(9),

    direccion varchar(30)

    );

create table compra(

    id_producto numeric(4),

    id_cliente numeric(4),
    
    CIF varchar(9),

    id_pedido numeric(4),

    foreign key (id_producto) references producto(id_producto) on delete cascade on update cascade,

    foreign key (id_cliente) references cliente(id_cliente) on delete cascade on update cascade,

    foreign key (CIF,id_pedido) references pedido(CIF,id_pedido) on delete cascade on update cascade,

    primary key(id_producto,CIF,id_pedido)

    );

create table empleado(

    id_empleado numeric(4) primary key,

    salario decimal(6,2),

    nombre varchar(15),
    
    fecha_incorporacion date,

    constraint salariominimo check(salario > 1050)

    );

create table supervisa(

    id_empleado_supervisa numeric(4),

    id_empleado_supervisado numeric(4),

    foreign key (id_empleado_supervisa) references empleado(id_empleado) on delete cascade on update cascade,

    foreign key (id_empleado_supervisado) references empleado(id_empleado) on delete cascade on update cascade,

    primary key(id_empleado_supervisa,id_empleado_supervisado)

    );

create table gestion(

    id_empleado numeric(4),

    CIF varchar(9),

    id_pedido numeric(4),

    foreign key (id_empleado) references empleado(id_empleado) on delete cascade on update cascade,

    foreign key (CIF,id_pedido) references pedido(CIF,id_pedido) on delete cascade on update cascade,

    primary key(id_empleado,CIF,id_pedido)

    );
