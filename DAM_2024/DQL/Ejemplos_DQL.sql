select autores.nombre_autor from autores where autores.id_autor <=5;

select autores.id_autor, autores.nombre_autor from autores where id_autor <= 3 or id_autor >=6;

select * from ventas order by ventas.cantidad_vendida desc limit 100;


select ventas.id_libro,
       ventas.fecha_venta,
       avg(ventas.cantidad_vendida),
       sum(ventas.cantidad_vendida) as cantidad_total,
       count(ventas.id_libro) as nVentas
    from ventas
    group by ventas.id_libro
    having cantidad_total <= 100;