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