select nombre, nomequipo from ciclista where 
nombre like "____ %" and nombre < nomeequipo;


select dorsal, nombre from ciclista where nombre like "% C%" and edad < 29 or nombre like "% A%" and edad >29;

select dorsal, nombre, edad, nomequipo from ciclista where dorsal = edad * 2 or nombre like "%u% %u%" order by edad desc;

select nombrepuerto from puerto where not %puerto%



select distinct region, continent from World where continent like "a%" order by continent, region;


select cliente, producto, precio_unidad, unidades, precio_unidad * unidades AS TOTAL_EUR, round(precio_unidad * unidades * 166.386) AS TOTAL_PST from facturas;






select fiesta from fechas where FECHA_FI != FECHA_CE;


select num, producto, precio_unidad, round(sqrt(num),2) AS raiz from facturas where num % 2 = 0 order by num desc;


select codigo, sueldo, dietas from empleados where comision is null and sueldo < dietas * 10;




select nombrepuerto, round(altura/pendiente, 1) as dificultad from puerto where num %2=0 order by dificultad;


select salida, abs(dorsal - numetapa) as diferencia from etapa;

select fecha_fac, producto, unidades, round(unidades / 12) as num_paquetes, 12 * ceil(unidades/12) - unidades as hueco_ultimo_paquete  from facturas where unidades < 36 order by fecha_fac desc;



select nombre, edad, nomequipo, (edad- dorsal) as diferencia from ciclista where nombre like "M%" and nomequipo like "B%" or nombre like "A%" and nomequipo like "M%";






select kms, salida, llegada, dorsal from etapa where salida != llegada and (kms % dorsal = 0);


SELECT Name, Code, TRUNCATE((YEAR(CURDATE()) - IndepYear) / 100.0, 2) AS centenario, IndepYear
FROM Country
WHERE TRUNCATE((YEAR(CURDATE()) - IndepYear) / 100.0, 2) > 3
ORDER BY centenario DESC;


select nombre, apellido1, date_format(FechaNac, "%d de %M de %Y") as nacimiento from nacimientos where month(FechaNac) < 5 and day(FechaNac) > 10;


select nombre, apellido1, date_add(FechaNac, interval 18 year) as mayoriaEdad from nacimientos where weekday(FechaNac) = 2;


select * from nacimientos where (length(nombre) + length(apellido1) + length(apellido2)) >20;




select concat(left(Nombre, 1), " ", Apellido1) as Nacido from nacimientos where Apellido1 like "%_b%";


select substring_index(concat(nombre, " ", Apellido1, " ", Apellido1), "e", 2) as Nacido from nacimientos where concat(nombre, " ", Apellido1, " ", Apellido2) like "%e%e%";


select fecha_fac, producto, unidades from facturas where (unidades % 12 = 0) order by fecha_fac;


select concat(lower(rpad(NOM_AUTOR, 25, "."))) as Autor from libros;


select dorsal, nombre, edad from ciclista where substring(dorsal, length(dorsal), 1) = substring(edad, length(edad), 1);


select nombrepuerto, altura as kilometros, pendiente, categoria from puerto where (categoria = "1" and pendiente > 6) or (categoria = "E" and pendiente < 7) order by kilometros desc;


select dorsal, nombre, date_add(edad, interval 3 year) as "edad+3" from ciclista where (nombre like "%A" or nombre like "%B") and nomequipo like "%K";