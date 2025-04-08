DELIMITER $
create or replace function miFuncion (miparam INTEGER)
returns integer
begin
	return miparam + 1;
end $

DELIMITER ;

select mifuncion(4);


-- Ejemplo funcion que recibe parametro

DELIMITER $
create or replace function miFuncion (miparam INTEGER)
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
create or replace function ventasDeLibro (miIdLibro integer)
returns integer
begin
	declare resultado integer;

	SELECT
		sum(cantidad_vendida) as cantidadtotal into resultado
	from ventas
	WHERE id_libro = miIdLibro
	GROUP BY id_libro;

	return resultado;
end $
DELIMITER ;
-- Uso de funcion en select
select
	l.id_libro,
	l.titulo,
	ventasDeLibro(l.id_libro) as totalLibrosVendidos
from libros l ;


-- Uso procedimiento
DELIMITER $$
create procedure descuentaPrecioLibros (in miIdLibro INTEGER, in tipoDescuento CHAR(1))
begin
	declare	descuento integer;
	if (tipoDescuento = 'A') then
		set descuento = 30;
	elseif (tipoDescuento = 'B') then
		set descuento = 40;
	elseif (tipoDescuento = 'C') then
		set descuento = 50;
	else
		set descuento = 0;
	end if;
	UPDATE ventas SET precio_unitario = precio_unitario * (100-descuento)/100 WHERE id_libro = miIdLibro;
end$$

call descuentaPrecioLibros(1, 'A');