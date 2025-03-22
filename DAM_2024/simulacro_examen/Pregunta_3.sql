/*
 Se pide una tabla resumen que muestre el número de pedidos
 en los que aparece cada línea de producto
 */

select count(pedidos.id_pedido) as num_pedidos, productos.nombre_producto from pedidos
right join detalles_pedido on pedidos.id_pedido = detalles_pedido.id_pedido
right join productos on detalles_pedido.id_pedido = pedidos.id_pedido group by productos.nombre_producto, pedidos.id_pedido;

 /*
  Se pide una tabla resumen que muestre el número total de empleados por oficina
  */

select count(empleados.nombre) as numeroEmpleados, oficinas.id_oficina from empleados
left join oficinas on empleados.id_oficina = oficinas.id_oficina group by oficinas.id_oficina;

/*
 Escribe un procedimiento para actualizar la tabla de empleados que reciba
 como parámetro id_empleado e id_oficina.
 Tras comprobar si la oficina introducida existe debemos actualizar si existe y no hacer nada si no existe.
 */

DELIMITER $$

CREATE PROCEDURE actualizar_empleado(
    IN p_id_empleado INT,
    IN p_id_oficina INT
)
BEGIN
    DECLARE v_existe_oficina INT;

    -- Verificar si la oficina existe
    SELECT COUNT(*) INTO v_existe_oficina
    FROM oficinas
    WHERE id_oficina = p_id_oficina;

    -- Si la oficina existe, actualizar el empleado
    IF v_existe_oficina > 0 THEN
        UPDATE empleados
        SET id_oficina = p_id_oficina
        WHERE id_empleado = p_id_empleado;
    END IF;
END$$

DELIMITER ;

CALL actualizar_empleado(40, 3);