/*
 1.	Se pide una tabla resumen que muestre el precio medio real* por el que se ha vendido cada producto
 (* el precio medio se tiene que calcular teniendo en cuenta la cantidad de producto vendido)
 */

select productos.id_producto, productos.nombre_producto,
sum(detalles_pedido.subtotal) / sum(detalles_pedido.cantidad) as precioMedio from
productos left join detalles_pedido using (id_producto)
group by productos.id_producto, productos.nombre_producto;