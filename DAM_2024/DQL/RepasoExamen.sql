/*
 1. Se pide una tabla resumen que muestre el precio medio real por el que se ha vendido cada producto
(calculado con la cantidad vendida en cada pedido).
 */

select p.id_producto, p.nombre_producto, (avg(p.coste_unitario) * dp.cantidad) as precioMedio
from productos p
         left join detalles_pedido dp on p.id_producto = dp.id_producto
group by p.id_producto, p.nombre_producto;


/*
2. Obtener el total de ingresos generados por cada producto sumando la cantidad vendida
multiplicada por el precio unitario.
 */

select p.nombre_producto,
       (sum(dp.cantidad) * dp.precio_unitario) as ingresosGenerados
from productos p
         left join detalles_pedido dp
                   on p.id_producto = dp.id_producto
group by p.nombre_producto;

/*
 3. Listar la cantidad total de unidades vendidas y el ingreso total generado por cada categoría de
producto
 */

select lp.nombre_linea, count(dp.cantidad) as unidadesVnedidas, sum(dp.subtotal) as ingresoTotal
from lineas_producto lp
         left join productos p
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
       count(p.id_pedido)      as numPedidos,
       sum(pa.cantidad_pagada) as importeTotal
from clientes c
         left join pedidos p on c.id_cliente = p.id_cliente
         left join pagos pa on c.id_cliente = pa.id_cliente
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

select p.nombre_producto, (count(dp.id_pedido) / dp.cantidad) as promedioUnidadesVendidas
from productos p
         left join detalles_pedido dp on p.id_producto = dp.id_producto
group by p.nombre_producto
order by promedioUnidadesVendidas desc;

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

select distinct p.nombre_producto
from productos p
         left join comentarios_producto cp on p.id_producto = cp.id_producto
where cp.comentario is not null;


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

