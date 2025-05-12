/*
 Ejercicio 1
 */


select lp.nombre_linea, count(dp.id_pedido) as numPedidos
from lineas_producto lp
         left join
     productos p on lp.id_linea_producto = p.id_linea_producto
         left join detalles_pedido dp
                   on p.id_producto = dp.id_producto
group by lp.id_linea_producto, lp.nombre_linea;


/*
 Ejercicio 2
 */

select o.id_oficina, o.nombre_oficina, count(e.id_empleado) as numEmpleados
from oficinas o
         left join empleados e on o.id_oficina = e.id_oficina
group by o.id_oficina, o.nombre_oficina;

/*
 Ejercicio 3
 */


drop procedure if exists actualizarEmpleados;
delimiter //
create procedure actualizarEmpleados(in num_empleado int(11), in id_oficina int(11))
begin
    declare contadorFilas int;

    select count(o.id_oficina) into contadorFilas from oficinas o where o.id_oficina = id_oficina;

    if contadorFilas > 0 then
        update empleados set puesto = 'El empleado se ha actualizado' where empleados.id_empleado = num_empleado;

    else
        select 'La oficina introducida no existe';
    end if;
end;

delimiter ;

call actualizarEmpleados(1, 900);