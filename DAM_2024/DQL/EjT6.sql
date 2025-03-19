/*
 1: Mostrar únicamente el título, año y duración de todas las películas de la tabla
 “pelicula” en la base de datos “películas”
 */

select pelicula.tituloPelicula, pelicula.anyoPelicula, pelicula.duracionPelicula from pelicula;



/*
 Eliminar la tabla “sala” de la base de datos “cines”. ¿Qué ocurre? Explica con tus palabras el motivo. (DROP)
 */
drop table sala;

-- Insertar los Cines Axión de la población Alcoy en la tabla “cine” (INSERT)

select * from cine;

delete from cine where idCine = 45;

insert into cine (nombreCine, poblacionCine) values ('Cines Axión', 'Alcoy');

update cine set poblacionCine = 'Alcoi' where idCine = 47;

select * from sala;

/*
  Localizar el id de los Cines Axión insertados previamente en el paso 3. Insertar en la tabla “sala” una sala
  indicando ese id en el campo idCine y sin especificar idSala. (INSERT)
 */

insert into sala (idCine, butacasSala) values (47, 300);

-- Insertar una sala con idCine 90. ¿Qué ocurre y por qué?

insert into sala (idCine, idSala, butacasSala) VALUES (90, 5, 400);


-- 7: Mostrar las salas por orden de butacas, de mayor a menor (ORDER BY)

select * from sala order by butacasSala desc;

-- Mostrar únicamente la sala con más butacas. (ORDER BY, LIMIT)

select * from sala order by butacasSala desc limit 1;

-- 9: Muestra todas las salas que tengan menos de 110 butacas. (WHERE)

select * from sala where butacasSala < 110;

-- 10: Muestra todas las salas que tengan más de 110 butacas y menos de 150. (BETWEEN)

select * from sala where butacasSala between 110 and 149;


select * from cine where idCine in (3, 5, 8, 13, 17);


-- 12: Muestra los cines cuyo id sea el 3,5,8, 13 o 17 y cuya población sea Valencia (IN, AND)

select * from cine where idCine in (3, 5, 8, 13, 17) and poblacionCine = 'Valencia';

-- 13: Muestra el número de cines en la tabla “cine” (COUNT)

select count(*) from cine;

