/*
 1.	Se pide una tabla resumen que muestre el precio medio real* por el que se ha vendido cada producto
 (* el precio medio se tiene que calcular teniendo en cuenta la cantidad de producto vendido)
 */

select productos.id_producto, productos.nombre_producto,
sum(detalles_pedido.subtotal) / sum(detalles_pedido.cantidad) as precioMedio from
productos left join detalles_pedido using (id_producto)
group by productos.id_producto, productos.nombre_producto;


/*
 2.	Se pide una tabla resumen que muestre el número de pedidos en los que aparece cada producto
 */

select productos.id_producto, productos.nombre_producto,
count(detalles_pedido.id_detalle) as totalPedidos from productos
left join detalles_pedido using (id_producto)
group by productos.id_producto, productos.nombre_producto;


/*
 3.	Escribe una función que dado el ID de un pedido devuelva el precio total de ese pedido,
 calculándolo a partir de detalles_pedido
 */


