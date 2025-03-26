/*
 1.	Se pide una tabla resumen que muestre el número de pedidos en los que aparece cada línea de producto
 */


select lineas_producto.id_linea_producto, lineas_producto.nombre_linea,
count(detalles_pedido.id_pedido) as numPedidos,
count(distinct detalles_pedido.id_pedido) as NPedidosDistintos
from lineas_producto left join productos
using (id_linea_producto) left join detalles_pedido using (id_producto)
group by lineas_producto.id_linea_producto, lineas_producto.nombre_linea;


/*
 2.	Se pide una tabla resumen que muestre el número total de empleados por oficina
 */

select oficinas.id_oficina, count(empleados.id_empleado) as numEmpleados,
oficinas.nombre_oficina, oficinas.direccion, oficinas.ciudad from empleados
left join oficinas using (id_oficina) group by oficinas.id_oficina, oficinas.nombre_oficina,
oficinas.direccion, oficinas.ciudad;


