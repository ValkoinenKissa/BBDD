/*
En nuestra base de datos de películas hemos pensado en crear una tabla llamada PERSONAJE donde queremos dar de alta
todos los personajes que aparecen en las películas y la cantidad de apariciones de cada uno. La tabla podría ser:

idPersonaje int(11), nombrePersonaje varchar(25), aparicionesPersonaje int(11)

Necesitaremos un SELECT sobre la tabla INTERPRETACIÓN que nos devuelva los nombres de los personajes y las apariciones
de cada uno, y un cursor que recorra dicho SELECT y realice las inserciones correspondientes en la nueva tabla.
Tdo ello, claro está, dentro de un procedimiento almacenado.
 */

create table personaje (
    idPersonaje int (11) primary key auto_increment,
    nombrePersonaje varchar(25),
    aparicionesPersonaje int (11)
);

DELIMITER //

CREATE PROCEDURE cuentaPersonajes()

BEGIN

DECLARE nombre VARCHAR(25);

DECLARE apariciones INT;

DECLARE personajes CURSOR FOR

SELECT personaje, COUNT(*) FROM interpretacion GROUP BY personaje;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET @finalizado=1;

OPEN personajes;

bucle: LOOP

   FETCH personajes INTO nombre, apariciones;

   IF @finalizado=1 THEN LEAVE bucle;

   END IF;

   INSERT INTO personaje VALUES(NULL, nombre, apariciones);

END LOOP bucle;

CLOSE personajes;

END //

DELIMITER ;

call cuentaPersonajes();


