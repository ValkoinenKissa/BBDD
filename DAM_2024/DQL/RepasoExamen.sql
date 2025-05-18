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
       count(distinct p.id_pedido)      as numPedidos,
       sum(dp.subtotal) as importeTotal
from clientes c left join pedidos p on c.id_cliente = p.id_cliente
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

 select c.nombre, cp.comentario, p.nombre_producto from clientes c
 join comentarios_producto cp on c.id_cliente = cp.id_cliente
 join productos p on cp.id_producto = p.id_producto;


/*
12. Obtener una lista de productos junto con su categoría y el total de ventas, combinando las tablas
productos, categorías y detalles_pedido.
 */

 select lp.nombre_linea, p.nombre_producto, sum(dp.cantidad * dp.precio_unitario) as total_ventas from lineas_producto lp
 left join productos p on lp.id_linea_producto = p.id_linea_producto
 left join detalles_pedido dp on p.id_producto = dp.id_producto
 group by lp.nombre_linea, p.nombre_producto;

/*
13. Listar para cada cliente y cada año el número de pedidos realizados y el monto total gastado,
usando las tablas clientes y pedidos.
 */

 select c.id_cliente, c.nombre, year(p.fecha_pedido) as anio, count(distinct p.id_pedido)
     as num_pedidos, sum(dp.subtotal) as total_gastado
 from clientes c left join pedidos p on c.id_cliente = p.id_cliente
 left join detalles_pedido dp on p.id_pedido = dp.id_pedido
 group by c.id_cliente, c.nombre, year(p.fecha_pedido)
 order by c.nombre, anio;

/*
 14. Determinar para cada categoría de producto la cantidad total en inventario y la cantidad total
 vendida, combinando las tablas productos y detalles_pedido.
 */

 select lp.nombre_linea, sum(distinct p.stock) as cantidad_proc_en_stock, sum(dp.cantidad) as cantidad_proc_vendido
 from lineas_producto lp left join productos p on lp.id_linea_producto = p.id_linea_producto
 left join detalles_pedido dp on p.id_producto = dp.id_producto
 group by lp.nombre_linea;

/*
 15. Listar los clientes con el número de comentarios que han realizado y la calificación promedio que
han dado, uniendo clientes con comentarios_producto.
 */

 select c.nombre, count(cp.id_comentario) as num_comentarios, avg(cp.valoracion) as valoracion_promedio
 from clientes c left join comentarios_producto cp on c.id_cliente = cp.id_cliente
 group by c.nombre;

/*
 16. Mostrar los productos que han vendido más unidades que el promedio de todos los productos (usar
subconsulta para calcular el promedio general de unidades vendidas).
 */

SELECT
  p.id_producto,
  p.nombre_producto,
  SUM(dp.cantidad) AS unidades_vendidas
FROM productos p
JOIN detalles_pedido dp
  ON p.id_producto = dp.id_producto
GROUP BY
  p.id_producto,
  p.nombre_producto
HAVING
  SUM(dp.cantidad) > (
    SELECT AVG(total_unidades)
    FROM (
      SELECT SUM(cantidad) AS total_unidades
      FROM detalles_pedido
      GROUP BY id_producto
    ) AS sub
  )
ORDER BY
  unidades_vendidas DESC;


/*
 17. Encontrar los clientes cuyo gasto total (sumando todas sus compras) supera el gasto promedio de
todos los clientes.
 */

SELECT
  c.id_cliente,
  c.nombre,
  SUM(dp.subtotal) AS gasto_total
FROM clientes c
LEFT JOIN pedidos p
  ON c.id_cliente = p.id_cliente
LEFT JOIN detalles_pedido dp
  ON p.id_pedido = dp.id_pedido
GROUP BY
  c.id_cliente,
  c.nombre
HAVING
  SUM(dp.subtotal) > (
    SELECT AVG(gasto_cliente)
    FROM (
      SELECT SUM(dp2.subtotal) AS gasto_cliente
      FROM pedidos p2
      JOIN detalles_pedido dp2
        ON p2.id_pedido = dp2.id_pedido
      GROUP BY p2.id_cliente
    ) AS sub
  )
ORDER BY
  gasto_total DESC;



/*
 18. Listar los productos cuyo precio unitario es superior al precio promedio de su categoría (utilizando
una subconsulta para el precio promedio por categoría).
 */

SELECT
  p.nombre_producto,
  p.coste_unitario
FROM productos p
WHERE
  p.coste_unitario > (
    -- subconsulta que calcula el promedio solo de la misma categoría del producto exterior
    SELECT AVG(p2.coste_unitario)
    FROM productos p2
    WHERE p2.id_linea_producto = p.id_linea_producto
  );


/*
19. Obtener los pedidos cuyo monto total (suma de cantidad vendida * precio unitario por pedido)
supera el promedio de montos de todos los pedidos.
 */

SELECT
  dp.id_pedido,
  SUM(dp.cantidad * dp.precio_unitario) AS monto_total
FROM detalles_pedido dp
GROUP BY
  dp.id_pedido
HAVING
  SUM(dp.cantidad * dp.precio_unitario) > (
    SELECT AVG(monto)
    FROM (
      SELECT SUM(cantidad * precio_unitario) AS monto
      FROM detalles_pedido
      GROUP BY id_pedido
    ) AS sub
  )
ORDER BY
  monto_total DESC;

/*
 20. Mostrar los clientes que no han realizado pedidos (utilizar subconsulta o LEFT JOIN y filtrar donde no
hay coincidencias).
 */

 select c.nombre from clientes c
 left join pedidos p on c.id_cliente = p.id_cliente
 where p.id_pedido is null;


;