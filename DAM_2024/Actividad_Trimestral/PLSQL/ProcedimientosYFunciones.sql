/*
 1.	Crea una función EsPar que reciba un número y devuelva 1 si el número es par o 0 si es impar
 */

delimiter $
create or replace function EsPar(numero int)
    returns int
begin
    if numero % 2 = 0 then
        return 1;
    else
        return 0;
    end if;
end;

delimiter ;

-- Devolvera 1 por que dos es par

select EsPar(2);

-- Devolvera 0 por que 5 es impar

select EsPar(5);


/*
 2.	Crea una función que reciba un número de cliente (customerNumber) y devuelva la suma de todos sus pagos.
 */

delimiter $

create or replace function mostrarPagosCliente(idCliente int)
    returns decimal(10, 2)
begin
    declare sumaPagos decimal(10, 2);
    select sum(amount) into sumaPagos from payments where customerNumber = idCliente;
    return sumaPagos;
end;

delimiter ;

-- El id 103 nos mostrara el total de pagos del ciente 103 --> 22314.36

select mostrarPagosCliente(103);

/*
 3.	Crea una función que reciba un número de cliente (customerNumber) y devuelva la suma de todos sus pagos si el
 customerNumber es par o el número total de pagos si el customerNumber es impar.
 */

delimiter //

create or replace function mostrarPagosClienteParImpar(idCliente int)
    returns decimal(10, 2)
begin
    declare sumaPagos decimal(10, 2);
    select sum(amount) into sumaPagos from payments where customerNumber = idCliente;
    if idCliente % 2 = 0 then
        return sumaPagos;
    else
        select count(*) into sumaPagos from payments where customerNumber = idCliente;
        return sumaPagos;
    end if;

end;

delimiter ;

-- Numero par, muestra la suma de todos sus pagos

select mostrarPagosClienteParImpar(112) as sumaDeTodosLosPagos;


-- Numero impar, muestra el numero total de pagos de el cliente


select mostrarPagosClienteParImpar(103) as totalPagosCliente;


/*
 4.	Crea una función que para un número entero cualquiera N calcule sumatorio de 1 a N, esto es sumar todos los números
 enteros desde 1 hasta N (incluido). Si el número introducido es <= 0 debe devolver 0.
 */

delimiter //
create or replace function sumaHastaN(numeroN int)
    returns int
begin
    declare contador int default 0;
    declare sumatorio int default 0;
    if numeroN <= 0 then
        return 0;
    else
        bucle:
        while contador < numeroN
            do
                set contador = contador + 1;
                set sumatorio = sumatorio + contador;
            end while;
        return sumatorio;
    end if;
end;

delimiter ;

-- La suma de todos los numeros desde el 1 hasta el 5 es: 15

select sumaHastaN(5) as sumaDeTodosLosNumeros;


