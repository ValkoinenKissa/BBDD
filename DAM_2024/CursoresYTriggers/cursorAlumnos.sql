
/*
 Ha llegado una nueva alumna al centro. Viene de hacer 1DAM en otro centro y tiene todos los módulos aprobados.
 Desea matricularse de todos los módulos de 2DAM. Para no llevar a cabo tdo el proceso manualmente hemos pensado en
 crear un procedimiento que lo haga automáticamente. Además, queremos pasarle como parámetros el NIA, el nombre y
 los apellidos de la alumna para que el mismo procedimiento haga el alta en la tabla de alumnado. Una vez dada de alta,
 la matricularemos de todos los módulos de 2DAM.


 Para matricular a nuestra nueva alumna en todos los módulos de 2DAM no hay más opción que ir haciendo un INSERT por
 cada módulo. Lo más práctico, en este caso, sería crear un cursor donde estén todos los módulos de 2DAM,
 ir recorriendo uno a uno dichos módulos y hacer un INSERT en la tabla matricula para cada uno de ellos
 */

drop procedure matricularAlumno;


DELIMITER //

CREATE PROCEDURE matricularAlumno(in niaAlumno int, in nombre varchar(30), in apellidos varchar(30))
BEGIN
DECLARE done INT DEFAULT FALSE;
declare idDelModulo varchar(4);
declare idDelCiclo int;

DECLARE cursorAlumnos CURSOR FOR
select idModulo, idCiclo from modulo inner join modulociclo using (idModulo) inner join ciclo
using (idCiclo) where idCiclo = 3 and cursoModulo = 2;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

INSERT INTO alumnado VALUES (niaAlumno, nombre, apellidos);

OPEN cursorAlumnos;

bucle: LOOP
    FETCH cursorAlumnos INTO idDelModulo, idDelCiclo;
    IF done THEN
        LEAVE bucle;
    END IF;

insert into matricula values (niaAlumno, idDelModulo, idDelCiclo, null);

END LOOP;

CLOSE cursorAlumnos;
END //

delimiter ;


call matricularAlumno(2809999, 'Albert', 'el gran');