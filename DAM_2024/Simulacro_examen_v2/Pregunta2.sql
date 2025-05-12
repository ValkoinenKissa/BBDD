/*
 Ejercicio 1
 */

select p.id_producto,
       p.nombre_producto,
       avg(dp.cantidad) * p.coste_unitario
           as precioMedioReal
from productos p
         left join detalles_pedido dp
                   on p.id_producto = dp.id_producto
group by p.id_producto, p.nombre_producto;


/*
 Ejercicio 2
 */

select p.id_producto, p.nombre_producto, count(dp.cantidad) numPedidosProducto
from productos p
         left join detalles_pedido dp on p.id_producto = dp.id_producto
group by p.id_producto, p.nombre_producto;


/*
 Ejercicio 3
 */


drop function if exists funcionPrecioTotal;

delimiter //

create function funcionPrecioTotal(id_pedido int)
    returns decimal(20, 2)
begin
    declare subtotal int;
    select sum(dp.subtotal) into subtotal from detalles_pedido dp where dp.id_pedido = id_pedido;
    return subtotal;

end;

delimiter ;


select dp.id_pedido, funcionPrecioTotal(dp.id_pedido) as subtotal
from detalles_pedido dp
group by dp.id_pedido;



