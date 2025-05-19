/*
 1. Se pide una tabla resumen que muestre el precio medio real por el que se ha vendido cada producto
(calculado con la cantidad vendida en cada pedido).
 */

select p.id_producto,
       p.nombre_producto,
       sum(dp.precio_unitario * dp.cantidad) / sum(dp.cantidad) as precioMedioProducto
from productos p
         left join detalles_pedido dp on p.id_producto = dp.id_producto
group by p.id_producto, p.nombre_producto;

/*
2. Obtener el total de ingresos generados por cada producto sumando la cantidad vendida
multiplicada por el precio unitario.
 */

select p.nombre_producto,
       sum(dp.cantidad * dp.precio_unitario) as ingresosGenerados
from productos p
         left join detalles_pedido dp
                   on p.id_producto = dp.id_producto
group by p.nombre_producto;

/*
 3. Listar la cantidad total de unidades vendidas y el ingreso total generado por cada categoría de
producto
 */

select lp.nombre_linea,
       sum(dp.cantidad) as unidadesVnedidas,
       sum(dp.subtotal) as ingresoTotal
from lineas_producto lp
         left join
     productos p
     on lp.id_linea_producto = p.id_linea_producto
         left join detalles_pedido dp on p.id_producto = dp.id_producto
group by lp.nombre_linea
order by ingresoTotal desc;

/*
4. Mostrar la calificación promedio de cada producto basada en las opiniones registradas en
comentarios_producto.
 */

select p.nombre_producto, avg(cp.valoracion) as promedioValoracion
from productos p
         left join comentarios_producto cp on p.id_producto = cp.id_producto
group by p.nombre_producto;


/*
5. Presentar el número de pedidos realizados por cada cliente y el importe total gastado por cada uno.
 */

select c.id_cliente,
       c.nombre,
       count(distinct p.id_pedido) as numPedidos,
       sum(dp.subtotal)            as importeTotal
from clientes c
         left join pedidos p on c.id_cliente = p.id_cliente
         left join detalles_pedido dp on p.id_pedido = dp.id_pedido
group by c.id_cliente, c.nombre;

/*
6. Determinar qué producto ha generado el mayor ingreso total (cantidad vendida * precio unitario).
 */

select p.nombre_producto, sum(dp.cantidad * dp.precio_unitario) as mayorIngreso
from productos p
         left join detalles_pedido dp on p.id_producto = dp.id_producto
group by p.nombre_producto
order by mayorIngreso desc
limit 1;

/*
7. Calcular el promedio de unidades vendidas por pedido para cada producto.
 */

select p.nombre_producto, avg(dp.cantidad) as promedioUnidadesVendidas
from productos p
         left join detalles_pedido dp on p.id_producto = dp.id_producto
group by p.nombre_producto;

/*
 8. Listar el número de clientes únicos que han comprado cada producto.
 */

select p.nombre_producto, count(distinct pe.id_cliente) as numClientesQueHanComprado
from productos p
         left join detalles_pedido dp on p.id_producto = dp.id_producto
         left join pedidos pe on dp.id_pedido = pe.id_pedido
group by p.nombre_producto
order by numClientesQueHanComprado desc;

/*
9. Obtener los productos que no tienen comentarios asociados en la tabla comentarios_producto.
 */

select p.nombre_producto
from productos p
         left join comentarios_producto cp on p.id_producto = cp.id_producto
where cp.comentario is null;


/*
10. Mostrar todos los pedidos con el nombre del cliente, fecha del pedido, nombre del producto y
cantidad vendida, mediante JOIN entre pedidos, clientes, detalles_pedido y productos.
 */

select c.nombre, pe.fecha_pedido, p.nombre_producto, sum(dp.cantidad) as cantidadVendida
from clientes c
         left join pedidos pe on c.id_cliente = pe.id_cliente
         left join detalles_pedido dp on pe.id_pedido = dp.id_pedido
         left join productos p on dp.id_producto = p.id_producto
group by c.nombre, pe.fecha_pedido, p.nombre_producto;


/*
11. Listar los comentarios de producto junto con el nombre del cliente que los realizó y el nombre del
producto, utilizando JOIN entre clientes, comentarios_producto y productos.
 */

select c.nombre, cp.comentario, p.nombre_producto
from clientes c
         join comentarios_producto cp on c.id_cliente = cp.id_cliente
         join productos p on cp.id_producto = p.id_producto;


/*
12. Obtener una lista de productos junto con su categoría y el total de ventas, combinando las tablas
productos, categorías y detalles_pedido.
 */

select lp.nombre_linea, p.nombre_producto, sum(dp.cantidad * dp.precio_unitario) as total_ventas
from lineas_producto lp
         left join productos p on lp.id_linea_producto = p.id_linea_producto
         left join detalles_pedido dp on p.id_producto = dp.id_producto
group by lp.nombre_linea, p.nombre_producto;

/*
13. Listar para cada cliente y cada año el número de pedidos realizados y el monto total gastado,
usando las tablas clientes y pedidos.
 */

select c.id_cliente,
       c.nombre,
       year(p.fecha_pedido) as anio,
       count(distinct p.id_pedido)
                            as num_pedidos,
       sum(dp.subtotal)     as total_gastado
from clientes c
         left join pedidos p on c.id_cliente = p.id_cliente
         left join detalles_pedido dp on p.id_pedido = dp.id_pedido
group by c.id_cliente, c.nombre, year(p.fecha_pedido)
order by c.nombre, anio;

/*
 14. Determinar para cada categoría de producto la cantidad total en inventario y la cantidad total
 vendida, combinando las tablas productos y detalles_pedido.
 */

select lp.nombre_linea, sum(distinct p.stock) as cantidad_proc_en_stock, sum(dp.cantidad) as cantidad_proc_vendido
from lineas_producto lp
         left join productos p on lp.id_linea_producto = p.id_linea_producto
         left join detalles_pedido dp on p.id_producto = dp.id_producto
group by lp.nombre_linea;

/*
 15. Listar los clientes con el número de comentarios que han realizado y la calificación promedio que
han dado, uniendo clientes con comentarios_producto.
 */

select c.nombre, count(cp.id_comentario) as num_comentarios, avg(cp.valoracion) as valoracion_promedio
from clientes c
         left join comentarios_producto cp on c.id_cliente = cp.id_cliente
group by c.nombre;

/*
 16. Mostrar los productos que han vendido más unidades que el promedio de todos los productos (usar
subconsulta para calcular el promedio general de unidades vendidas).
 */

SELECT p.id_producto,
       p.nombre_producto,
       SUM(dp.cantidad) AS unidades_vendidas
FROM productos p
         JOIN detalles_pedido dp
              ON p.id_producto = dp.id_producto
GROUP BY p.id_producto,
         p.nombre_producto
HAVING SUM(dp.cantidad) > (SELECT AVG(total_unidades)
                           FROM (SELECT SUM(cantidad) AS total_unidades
                                 FROM detalles_pedido
                                 GROUP BY id_producto) AS sub)
ORDER BY unidades_vendidas DESC;


/*
 17. Encontrar los clientes cuyo gasto total (sumando todas sus compras) supera el gasto promedio de
todos los clientes.
 */

SELECT c.id_cliente,
       c.nombre,
       SUM(dp.subtotal) AS gasto_total
FROM clientes c
         LEFT JOIN pedidos p
                   ON c.id_cliente = p.id_cliente
         LEFT JOIN detalles_pedido dp
                   ON p.id_pedido = dp.id_pedido
GROUP BY c.id_cliente,
         c.nombre
HAVING SUM(dp.subtotal) > (SELECT AVG(gasto_cliente)
                           FROM (SELECT SUM(dp2.subtotal) AS gasto_cliente
                                 FROM pedidos p2
                                          JOIN detalles_pedido dp2
                                               ON p2.id_pedido = dp2.id_pedido
                                 GROUP BY p2.id_cliente) AS sub)
ORDER BY gasto_total DESC;


/*
 18. Listar los productos cuyo precio unitario es superior al precio promedio de su categoría (utilizando
una subconsulta para el precio promedio por categoría).
 */

SELECT p.nombre_producto,
       p.coste_unitario
FROM productos p
WHERE p.coste_unitario > (
    -- subconsulta que calcula el promedio solo de la misma categoría del producto exterior
    SELECT AVG(p2.coste_unitario)
    FROM productos p2
    WHERE p2.id_linea_producto = p.id_linea_producto);


/*
19. Obtener los pedidos cuyo monto total (suma de cantidad vendida * precio unitario por pedido)
supera el promedio de montos de todos los pedidos.
 */

SELECT dp.id_pedido,
       SUM(dp.cantidad * dp.precio_unitario) AS monto_total
FROM detalles_pedido dp
GROUP BY dp.id_pedido
HAVING SUM(dp.cantidad * dp.precio_unitario) > (SELECT AVG(monto)
                                                FROM (SELECT SUM(cantidad * precio_unitario) AS monto
                                                      FROM detalles_pedido
                                                      GROUP BY id_pedido) AS sub)
ORDER BY monto_total DESC;

/*
 20. Mostrar los clientes que no han realizado pedidos (utilizar subconsulta o LEFT JOIN y filtrar donde no
hay coincidencias).
 */

select c.nombre
from clientes c
         left join pedidos p on c.id_cliente = p.id_cliente
where p.id_pedido is null;


/*
 21. Encontrar los productos que no han sido solicitados en ningún pedido (utilizando subconsulta o LEFT
JOIN sobre detalles_pedido).
 */

select p.id_producto, p.nombre_producto
from productos p
         left join detalles_pedido dp on p.id_producto = dp.id_producto
where dp.id_producto is null;


/*
 22. Crear una función que reciba el ID de un producto y devuelva un resumen con el total vendido y la
calificación promedio de ese producto.
 */


drop function if exists cantidadResumen;

delimiter //

create function cantidadResumen(idProducto int)
    returns varchar(255)
begin
    declare totalVendido int;
    declare promedioValoracion double;
    declare mensaje varchar(255);

    select sum(dp.cantidad)
    into totalVendido
    from detalles_pedido dp
    where idProducto = dp.id_producto;

    select avg(cp.valoracion)
    into promedioValoracion
    from comentarios_producto cp
    where idProducto = cp.id_producto;


    set mensaje = concat('Total vendido: ', totalVendido, ', Valoracion promedio: ', promedioValoracion);

    return mensaje;
end;

delimiter ;

select p.id_producto, cantidadResumen(p.id_producto) as resumen
from productos p;


/*
23. Crear una función que reciba el ID de un cliente y retorne la cantidad de pedidos realizados y el
monto total gastado por ese cliente.
 */


drop function if exists cantidadPedidosTotal;

delimiter //

create function cantidadPedidosTotal(idCliente int)
    returns varchar(255)
begin
    declare pedidosRealizados int;
    declare cantidadGastoCliente decimal(20, 2);
    declare mensaje varchar(255);

    select count(id_pedido)
    into pedidosRealizados
    from pedidos p
    where p.id_cliente = idCliente;

    select sum(p.total_pedido)
    into cantidadGastoCliente
    from pedidos p
    where p.id_cliente = idCliente;


    set mensaje = concat('Cantidad pedidos: ', pedidosRealizados, ', Monto total gastado: ', cantidadGastoCliente);

    return mensaje;
end;

delimiter ;

select p.id_cliente, cantidadPedidosTotal(p.id_cliente) as resumen
from pedidos p;


/*
 24. Crear una función que reciba el ID de un pedido y devuelva el monto total del pedido (calculado
sumando cantidad vendida * precio unitario en detalles_pedido).
 */

drop function if exists cantidadPedido;

delimiter //

create function cantidadPedido(idPedido int)
    returns decimal(20,2)
begin
    declare subtotalPedido decimal(20, 2);

    select sum(dp.precio_unitario * dp.cantidad)
    into subtotalPedido
    from detalles_pedido dp
    where dp.id_pedido = idPedido;

    return subtotalPedido;
end;

delimiter ;

select distinct dp.id_pedido, cantidadPedido(dp.id_pedido) as monto_total_pedido
from detalles_pedido dp;

/*
25. Crear un procedimiento almacenado para registrar un nuevo pedido: recibirá el ID de cliente, la
fecha del pedido y los detalles de los productos (IDs y cantidades). Debe validar que el cliente exista
y que haya suficiente stock de cada producto antes de confirmar el pedido
 */


drop procedure if exists crearNuevoPedido;

delimiter //

create procedure crearNuevoPedido(in idCliente int, in fechaPedido date, in idProducto int, in cantidad int,
                                  in precioUnitario decimal(20, 2))
begin
    declare contadorIdCliente int;
    declare contadorStockProducto int;
    declare subTotalPedido decimal(20, 2);
    declare idPedido int;
    select count(c.id_cliente) into contadorIdCliente from clientes c where c.id_cliente = idCliente;
    select pr.stock into contadorStockProducto from productos pr where pr.id_producto = idProducto;
    if (contadorIdCliente = 0) then
        select 'El idCliente introducido no existe!!';

    elseif (contadorStockProducto < 1) then

        select 'No hay suficiente stock del producto introducido';

    else

        insert into pedidos (id_cliente, fecha_pedido) values (idCliente, fechaPedido);
        set subTotalPedido = precioUnitario * cantidad;
        set idPedido = last_insert_id();
        insert into detalles_pedido (id_pedido, id_producto, cantidad, precio_unitario, subtotal)
        values (idPedido, idProducto, cantidad, precioUnitario, subTotalPedido);

        select 'Inserccion completada con exito';

    end if;


end;


delimiter ;

call crearNuevoPedido(1, curdate(), 40, 2, 39.99);


/*
26. Crear un procedimiento almacenado que permita insertar un nuevo comentario para un producto:
recibirá el ID de cliente, el ID de producto, la calificación y el comentario. Debe verificar que el cliente
y el producto existan, y que el cliente haya comprado previamente ese producto.
 */

drop procedure if exists insertarComentario;

delimiter //

create procedure insertarComentario(in idCliente int, in idProducto int, in valoracionProc int,
                                    in comentarioProc text)
begin
    declare contadorIdCliente int;
    declare contadorIdProducto int;
    declare confirmacionCompra int;
    select count(c.id_cliente) into contadorIdCliente from clientes c where c.id_cliente = idCliente;
    select count(p.id_producto) into contadorIdProducto from productos p where p.id_producto = idProducto;
    select count(*)
    into confirmacionCompra
    from productos p
             left join detalles_pedido dp
                       on p.id_producto = dp.id_producto
             left join pedidos pe on
        dp.id_pedido = pe.id_pedido
    where dp.id_producto = idProducto
      and pe.id_cliente = idCliente;

    if (contadorIdCliente = 0) then
        select 'El idCliente introducido no existe!!';

    elseif (contadorIdProducto = 0) then
        select 'El idProducto introducido no existe!!';

    elseif (confirmacionCompra = 0) then
        select 'No se ha comprado el producto por el cliente que has introducido';

    else

        insert into comentarios_producto (id_cliente, id_producto, valoracion, comentario, fecha_comentario)
        values (idCliente, idProducto, valoracionProc, comentarioProc,
                curdate());
        select 'Comentario insertado con exito!!';
    end if;
end;

delimiter ;

call insertarComentario(1, 40, 4, 'Bailarinas muy comodas');

/*
 27. Crear un procedimiento almacenado para actualizar el stock de un producto: recibirá el ID de
producto y la cantidad a descontar, validando que la cantidad solicitada no supere el stock actual.
 */

drop procedure if exists actualizarStock;

delimiter //

create procedure actualizarStock(in idProducto int, in cantidadADescontar int)
begin
    declare stockActual int;
    declare cantidadDescontada int;
    select p.stock into stockActual from productos p where p.id_producto = idProducto;

    if (cantidadADescontar > stockActual) then
        select 'No se puede decontar la cantidad introducida ya que no se dispone de suficiente stock';

    else
        set cantidadDescontada = stockActual - cantidadADescontar;
        UPDATE productos p
        SET p.stock = cantidadDescontada
        WHERE p.id_producto = idProducto;
        select 'Stock actualizado con exito!!';
    end if;

end;

delimiter ;

call actualizarStock(40, 10);


/*
 29. Crear un procedimiento almacenado que actualice la información de un cliente: recibirá el ID de
cliente y nuevos datos (nombre, correo electrónico, edad, etc.), validando que el correo electrónico
tenga formato correcto y que la edad sea mayor de 18 años.
 */


drop procedure if exists actualizarCliente;

delimiter //

create procedure actualizarCliente(in idCliente int, in nombreCliente varchar(50), in correoCliente varchar(50),
                                   in edadCliente int)
begin
    if (correoCliente not like '_%@_%._%') then
        select 'El correo que has introducido no es valido';

    elseif (edadCliente < 18) then
        select 'El cliente no puede ser menor de edad';

    else
        update clientes c
        set c.nombre             = nombreCliente,
            c.correo_electronico = correoCliente,
            c.edad               = edadCliente
        where c.id_cliente = idCliente;
        select 'Cliente actualizado con exito';
    end if;
end;

delimiter ;

call actualizarCliente(1, 'Juan Rodriguez', 'juan@gmail.com', 31);


/*
 30. Mostrar el total de ventas (cantidad vendida * precio unitario) agrupado por mes para el año en
curso, utilizando las tablas pedidos y detalles_pedido y funciones de fecha.
 */

select monthname(p.fecha_pedido) as mes,
       sum(dp.precio_unitario * dp.cantidad)
                                 as total_ventas
from pedidos p
         left join detalles_pedido dp
                   on p.id_pedido = dp.id_pedido
where year(p.fecha_pedido) = year(curdate())
group by month(p.fecha_pedido);