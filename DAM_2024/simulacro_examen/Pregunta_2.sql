/*
 Se pide una tabla resumen que muestre el precio medio real* por el que
 se ha vendido cada producto (* el precio medio
 se tiene que calcular teniendo en cuenta la cantidad de producto vendido)
 */
select productos.nombre_producto, precio_unitario / detalles_pedido.cantidad as
precioMedio from productos left join detalles_pedido on productos.id_producto = detalles_pedido.id_producto
group by productos.nombre_producto;


/*
 Se pide una tabla resumen que muestre
 el número de pedidos en los que aparece cada producto
 */

select count(pedidos.id_pedido) as numeroPedidos, productos.nombre_producto from pedidos
right join detalles_pedido on pedidos.id_pedido = detalles_pedido.id_pedido
right join productos on detalles_pedido.id_producto = productos.id_producto
group by productos.nombre_producto;


/*
 Escribe una función que dado el ID de un pedido devuelva el precio total de ese pedido,
 calculándolo a partir de detalles_pedido
 */

 select pedidos.id_pedido, detalles_pedido.subtotal from pedidos
 right join detalles_pedido on pedidos.id_pedido = detalles_pedido.id_pedido
 group by pedidos.id_pedido;

