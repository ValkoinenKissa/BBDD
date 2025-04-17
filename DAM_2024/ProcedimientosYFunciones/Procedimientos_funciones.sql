DELIMITER $
create or replace function miFuncion(miparam INTEGER)
    returns integer
begin
    return miparam + 1;
end $

DELIMITER ;

select mifuncion(4);


-- Ejemplo funcion que recibe parametro

DELIMITER $
create or replace function miFuncion(miparam INTEGER)
    returns integer
begin
    declare mivariable INTEGER;
    set mivariable = miparam * 2;
    return mivariable;
end $

DELIMITER ;

select mifuncion(4);

-- Funcion con select

DELIMITER $
create or replace function ventasDeLibro(miIdLibro integer)
    returns integer
begin
    declare resultado integer;

    SELECT sum(cantidad_vendida) as cantidadtotal
    into resultado
    from ventas
    WHERE id_libro = miIdLibro
    GROUP BY id_libro;

    return resultado;
end $
DELIMITER ;
-- Uso de funcion en select
select l.id_libro,
       l.titulo,
       ventasDeLibro(l.id_libro) as totalLibrosVendidos
from libros l;


-- Uso procedimiento
DELIMITER $$
create procedure descuentaPrecioLibros(in miIdLibro INTEGER, in tipoDescuento CHAR(1))
begin
    declare descuento integer;
    if (tipoDescuento = 'A') then
        set descuento = 30;
    elseif (tipoDescuento = 'B') then
        set descuento = 40;
    elseif (tipoDescuento = 'C') then
        set descuento = 50;
    else
        set descuento = 0;
    end if;
    UPDATE ventas SET precio_unitario = precio_unitario * (100 - descuento) / 100 WHERE id_libro = miIdLibro;
end$$

call descuentaPrecioLibros(1, 'A');


/*
 Crea una función que devuelva como resultado la cantidad de números pares que hay entre dos números que
 le pasaremos como parámetros. Comprueba que el primer parámetro es menor o igual que el segundo.
 En caso contrario, devuelve –1. Comprueba que funciona tanto si le pasas dos valores válidos como si no lo son
 (el primero mayor que el segundo). Hazlo con un bucle LOOP.
 */

delimiter $$
create or replace function numerosPares(num1 int, num2 int) returns int
begin
    declare contadorIteraciones int default 0;
    declare contadorNumPares int default 0;

    if num1 <= num2 then
        set contadorIteraciones = num1;
        label1 :
        loop
            if contadorIteraciones % 2 = 0 then
                set contadorNumPares = contadorNumPares + 1;
            end if;
            set contadorIteraciones = contadorIteraciones + 1;

            if contadorIteraciones >= num2 then
                leave label1;
            end if;
        end loop;
        return contadorNumPares;
    else
        return -1;
    end if;
end$$

delimiter ;

select concat('Los numeros pares son: ' + numerosPares(15, 10)) as numPares;

/*
 Realiza de nuevo el ejercicio del Caso práctico anterior. pero esta vez en forma de procedimiento.
 El funcionamiento debe ser el mismo: devolverá la cantidad de números pares que hay entre los dos
 parámetros que le pasemos, y –1 en caso de que el primero sea mayor que el segundo. También debes comprobar el
 funcionamiento del procedimiento, tal como has hecho con la función.
 */
delimiter $$
create procedure procedimientoNumerosPares(in num1 int, in num2 int, out resultado int)
begin
declare contadorIteraciones int default 0;
set resultado = 0;

    if num1 <= num2 then
        set contadorIteraciones = num1;
        label1 :
        loop
            if contadorIteraciones % 2 = 0 then
                set resultado = resultado + 1;
            end if;
            set contadorIteraciones = contadorIteraciones + 1;

            if contadorIteraciones >= num2 then
                leave label1;
            end if;
        end loop;
    else
        set resultado = -1;
    end if;
end $$

delimiter ;
set @num1 = 10;
set @num2 = 15;

call procedimientoNumerosPares(@num1, @num2, @num3);

select concat('Los numeros pares son: ' + @num3) as numPares;

-- ejemplo bucle loop

DELIMITER $$

CREATE PROCEDURE ejemplo_bucle_loop()
BEGIN
    DECLARE contador INT DEFAULT 1;
    DECLARE max_contador INT DEFAULT 10;

    -- Bucle LOOP para iterar del 1 al 10
    loop_inicio:
    LOOP
        -- Mostrar el número actual del contador
        SELECT CONCAT('El contador es: ', contador);

        -- Incrementar el contador
        SET contador = contador + 1;

        -- Salir del bucle si el contador excede el máximo
        IF contador > max_contador THEN
            LEAVE loop_inicio;
        END IF;
    END LOOP;
END $$

DELIMITER ;
