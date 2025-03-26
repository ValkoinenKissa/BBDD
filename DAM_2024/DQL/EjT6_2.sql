/*
En la base de datos instituto,
genera una consulta para obtener los nombres de los ciclos
(Sistemas Informáticos y Redes, Desarrollo de Aplicaciones Multiplataforma, etc.)
junto con los id de sus módulos (LEFT JOIN)
 */

select ciclo.idCiclo, ciclo.nombreCiclo, modulociclo.idModulo from ciclo
left join modulociclo on ciclo.idCiclo = modulociclo.idCiclo;

/*
 En la base de datos instituto, genera una consulta para obtener los id, nombres de los ciclos
 (Desarrollo de Aplicaciones Multiplataforma, Desarrollo de Aplicaciones Web…)
 y número total de horas junto con sus módulos, y el nombre y duración en horas de los módulos.
 Muestro las tres primeras filas del resultado:

(AS, LEFT JOIN, Subconsultas?)

 */

 select ciclo.idCiclo, ciclo.nombreCiclo, modulo.idModulo, ciclo.horasCiclo, modulo.nombreModulo, modulo.horasModulo
 from ciclo left join modulociclo on ciclo.idCiclo = modulociclo.idCiclo
 left join modulo on modulociclo.idModulo = modulo.idModulo;


/*
  Obtén el número total de horas de cada ciclo agrupando la anterior consulta y sumando los números de horas de los
  módulos (SUM, GROUP BY). ¿Cuadran las horas obtenidas de esta forma con las de la columna horasCiclo?
 */

select ciclo.idCiclo, ciclo.nombreCiclo, ciclo.horasCiclo, sum(modulo.horasModulo) as totalHorasModulo
from ciclo left join modulociclo on ciclo.idCiclo = modulociclo.idCiclo
left join modulo on modulociclo.idModulo = modulo.idModulo group by ciclo.idCiclo, ciclo.nombreCiclo, ciclo.horasCiclo;


/*Filtra los resultados de la anterior agrupación de forma que no aparezcan aquellos ciclos
 que no tengan módulos asignados (HAVING, IS NOT NULL)
 */

select ciclo.idCiclo, ciclo.nombreCiclo, ciclo.horasCiclo, sum(modulo.horasModulo) as totalHorasModulo
from ciclo left join modulociclo on ciclo.idCiclo = modulociclo.idCiclo
left join modulo on modulociclo.idModulo = modulo.idModulo
group by ciclo.idCiclo, ciclo.nombreCiclo, ciclo.horasCiclo having totalHorasModulo is not null;

/*
 Explica en pocas palabras los pasos que se ejecutan en la última consulta generada (EXPLAIN)
 */

explain select ciclo.idCiclo, ciclo.nombreCiclo, ciclo.horasCiclo, sum(modulo.horasModulo) as totalHorasModulo
from ciclo left join modulociclo on ciclo.idCiclo = modulociclo.idCiclo
left join modulo on modulociclo.idModulo = modulo.idModulo
group by ciclo.idCiclo, ciclo.nombreCiclo, ciclo.horasCiclo having totalHorasModulo is not null;

/*
  Vamos a modificar la información del módulo con id ‘0484’, introduciendo como número de horas 296 (UPDATE).
  Repite la consulta del ejercicio 3. ¿Qué ha cambiado?
 */


select * from modulo where idModulo = 0484;

update modulo set horasModulo = 296 where idModulo = 0484;

select ciclo.idCiclo, ciclo.nombreCiclo, modulo.idModulo, sum(ciclo.horasCiclo) as horasCiclo, modulo.nombreModulo, modulo.horasModulo
 from ciclo left join modulociclo on ciclo.idCiclo = modulociclo.idCiclo
 left join modulo on modulociclo.idModulo = modulo.idModulo group by horasCiclo limit 3;


/*
 Borremos el ciclo Sistemas Informáticos y Redes de la tabla de ciclos. (DELETE)
 */

 select * from ciclo;

delete ciclo from mcgrawinstituto.ciclo where nombreCiclo = 'Sistemas Informáticos y Redes';
