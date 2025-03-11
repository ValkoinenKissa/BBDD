-- cross join

select libros.id_libro,
       libros.titulo,
       libros.id_genero,
       generos.id_genero,
       generos.nombre_genero

from libros, generos;

-- INNER JOIN
select
	libros.id_libro,
	libros.titulo,
	libros.id_genero,
	generos.id_genero,
	generos.nombre_genero
from
	libros left join generos on libros.id_genero = generos.id_genero;
-- LEFT JOIN
select
	libros.id_libro,
	libros.titulo,
	libros.id_genero,
	generos.id_genero,
	generos.nombre_genero
from
	libros left join generos on libros.id_genero = generos.id_genero;
  -- right join equivalente
select
	libros.id_libro,
	libros.titulo,
	libros.id_genero,
	generos.id_genero,
	generos.nombre_genero
from
	generos right join libros on libros.id_genero = generos.id_genero;
-- RIGHT JOIN
select
	libros.id_libro,
	libros.titulo,
	libros.id_genero,
	generos.id_genero,
	generos.nombre_genero
from
	libros right join generos on libros.id_genero = generos.id_genero;

-- UNION
select * from generos
union
select * from generos where id_genero >3;

-- FULL JOIN
select
	libros.*,
	generos.*
from
	generos left join libros on libros.id_genero = generos.id_genero
UNION
select
	libros.*,
	generos.*
from
	libros left join generos on libros.id_genero = generos.id_genero;

-- LEFT OUTER JOIN
select
	libros.*,
	generos.*
from
	generos left join libros on libros.id_genero = generos.id_genero
where
	libros.id_genero is null;
-- RIGHT OUTER JOIN
select
	libros.*,
	generos.*
from
	generos right join libros on libros.id_genero = generos.id_genero
where
	generos.id_genero is null;

-- FULL OUTER JOIN
select
	libros.*,
	generos.*
from
	generos left join libros on libros.id_genero = generos.id_genero
where
	libros.id_genero is null
UNION
select
	libros.*,
	generos.*
from
	generos right join libros on libros.id_genero = generos.id_genero
where
	generos.id_genero is null;

-- LOS JOIN NO SOLO PUEDEN UNIR DOS TABLAS!!
select
	*
from
	generos left join libros on generos.id_genero = libros.id_genero
	left join autores on libros.id_autor = autores.id_autor;