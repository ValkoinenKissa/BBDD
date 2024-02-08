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


SELECT nombrepuerto, altura / 1000 AS kilometros, pendiente, categoria FROM puerto WHERE (categoria = "1" AND pendiente > 6) OR (categoria = "E" AND pendiente < 7) ORDER BY kilometros DESC;


SELECT dorsal, nombre, edad + 3 as "edad+3", 
       (SELECT nomequipo FROM equipo WHERE ciclista.nomequipo = equipo.nomequipo) as "equipo con k"
FROM ciclista
WHERE (nombre LIKE "A%" OR nombre LIKE "B%") AND nomequipo LIKE "K%";


select numetapa, kms * 1000 as metros , salida from etapa where length(salida) > 5 and kms * 1000 < 100000 or length(salida) = 4 order by salida;


SELECT nombre, edad, nomequipo FROM ciclista WHERE nomequipo LIKE 'B%' AND ((edad >= 20 AND edad <= 25) OR (edad >= 30 AND edad <= 35));


SELECT nombre, edad, nomequipo, (edad - dorsal) AS diferencia FROM ciclista WHERE nombre LIKE "M%" AND nomequipo LIKE "B%" OR nombre LIKE "A%" AND nomequipo LIKE "M%";

SELECT numetapa, (kms * 1000) AS metros, salida FROM etapa WHERE LENGTH(salida) >= 5 AND (kms * 1000) < 100000 OR LENGTH(salida) = 4 ORDER BY salida;

SELECT DISTINCT extension_telefonica_empleado FROM t_empleados ORDER BY extension_telefonica_empleado;


SELECT nombre_empleado, comision_empleado, numero_hijos_empleado FROM t_empleados WHERE nombre_empleado LIKE "%a% %a%" AND numero_hijos_empleado = 0 OR comision_empleado IS NULL;

SELECT nombre_empleado, comision_empleado, numero_hijos_empleado 
FROM t_empleados WHERE LEFT(nombre_empleado, LOCATE(',', nombre_empleado) - 1) LIKE '%a%a%'AND (numero_hijos_empleado = 0 OR comision_empleado IS NULL);



SELECT nombre_empleado, comision_empleado, numero_hijos_empleado FROM t_empleados WHERE substring_index(nombre_empleado, ',', -1) like "%a%%a%" and (numero_hijos_empleado = 0 or comision_empleado IS NULL);

SELECT nombre_empleado, salario_base_empleado AS salario FROM t_empleados WHERE salario_base_empleado < 2200 AND (substring_index(nombre_empleado, ',', 1) LIKE 'M%' OR substring_index(nombre_empleado, ',', -1) LIKE '%Z') ORDER BY nombre_empleado;

SELECT codigo_empleado, extension_telefonica_empleado, nombre_empleado FROM t_empleados where abs(codigo_empleado - extension_telefonica_empleado) < 100 AND substring_index(nombre_empleado, ',', 1) NOT LIKE 'L%';

SELECT comision_empleado, nombre_empleado, salario_base_empleado FROM t_empleados WHERE numero_hijos_empleado > 3 ORDER BY comision_empleado, nombre_empleado;


SELECT nombre_empleado, fecha_nacimiento_empleado, fecha_ingreso_empleado FROM t_empleados WHERE SUBSTRING_INDEX(nombre_empleado, ',', 1) LIKE "%a%%r%" AND (YEAR(fecha_nacimiento_empleado) > 1960 OR YEAR(fecha_ingreso_empleado) > 1987);

SELECT nombre_empleado, comision_empleado, numero_hijos_empleado FROM t_empleados WHERE nombre_empleado LIKE "%a% %a%" AND numero_hijos_empleado = 0 OR comision_empleado IS NULL;

SELECT nombre_empleado, comision_empleado, numero_hijos_empleado 

FROM t_empleados WHERE LEFT(nombre_empleado, LOCATE(',', nombre_empleado) - 1) LIKE '%a%a%'AND (numero_hijos_empleado = 0 OR comision_empleado IS NULL);


SELECT distinct producto AS prodlen, precio_unidad  AS coste_total FROM facturas WHERE length(producto) = length(cliente) ORDER BY precio_unidad LIMIT 10;


SELECT terminal, cargo, date_add(date_add(finicio, interval 1 month), interval 5 day) AS finicio FROM usa WHERE timestampdiff(DAY, finicio, ffin) < 400;

SELECT substring(ISBN_C, 5) AS tercio, ISBN_C FROM Comic WHERE substring_index(Titulo, " ", -1) like "%1%";


SELECT concat(Nombre, " ", "(",especie,")" , " ", Nombre) AS personaje, Nacimiento from Personajes where substring(Nacimiento, 1, 2) = 0 or 5;



select count(*) from mascotas;

select count(*) from mascotas where fallecimiento is not null;

select count(*) from mascotas where fallecimiento is null;

select count(*) -count(fallecimiento) from mascotas;

select sum(veces_vacunacion) from mascotas;


select sum(timestampdiff(year,Nacimiento, curdate())) as años from mascotas where fallecimiento is not null;


select concat(Nombre), count(*) from mascotas;


select substring(cliente, 1, 4) as cli4, substring(producto, -4) as pro4 from facturas where unidades < 6;

select lower(concat(NOM_AUTOR, " ", APE1_AUTOR)) as Autor, concat(substring(Titulo, 1, 1), lower(substring(Titulo, 2))) as Titulo from libros;

select numerorem, numerodes, date_format(finicio, "%d de %m de %y") as finicio, date_format(ffin, "%d de %m de %y") as fin from llamada where timestampdiff(minute, finicio, ffin) > 10;

select numerorem, numerodes, date_format(finicio, "%H h %i m %s s") as finicio, date_format(ffin, "%H h %i m %s s") as fin from llamada where hour(finicio) between 9 and 11 and hour(ffin) not between 9 and 11;

select terminal, cargo,  date_format(finicio, "%d/%m/%Y") as finicio, date_format(ffin, "%d/%m/%Y") as ffin from usa where timestampdiff(month, finicio, ffin) > 6 and abs(day(finicio) - day(ffin)) < 5;

select terminal, cargo, date_format(date_add(date_add(finicio, interval 1 month), interval 5 day), "%m-%d (%Y)") as finicio from usa where timestampdiff (day, finicio, ffin) < 400;


select numerorem, numerodes,  date_format(finicio, "%d de %m de %Y") as finicio,  date_format(ffin, "%d de %m de %Y") as fin from llamada where timestampdiff(minute, finicio, ffin) > 10 and abs(substring(numerorem, -3) -substring(numerodes, -3)) > 3;

SELECT concat(Nombre, " ", "(",especie,")" , " ", Nombre) AS personaje, Nacimiento from Personajes where substring(Nacimiento, 1, 2) = 0 or 5;

select Nombre, Nacimiento from Personajes WHERE right(substring_index(Nacimiento, " ", 1), 1)  LIKE '%0' or (right(substring_index(Nacimiento, " ", 1), 1) like '%5');

select Nombre, Nacimiento, especie from Personajes WHERE right(substring_index(Nacimiento, " ", 1), 1)  LIKE '%0' or (right(substring_index(Nacimiento, " ", 1), 1) like '%5');

select concat(substring_index(Nombre, " ", 1), " ", "(",especie,")", " ", substring_index(Nombre, " ", 1)) as personaje, Nacimiento from Personajes where right(substring_index(Nacimiento, " ", 1), 1)  LIKE '%0' or (right(substring_index(Nacimiento, " ", 1), 1) like '%5');

select ISBN_N, Titulo from Novela where abs(timestampdiff(month, Ultima_edicion, Lanzamiento)) > 6 and locate(substring(ISBN_N, -1), ISBN_N) = 1;

select concat(substring_index(ISBN_C, "-", -4), substring_index(ISBN_C, "-", 4)) from Comic;

select substring(ISBN_C,TRUNCATE(length(ISBN_C) / 3, 0), length(substring(ISBN_C,TRUNCATE(length(ISBN_C) / 3, 0))) -2) as tercio, ISBN_C from Comic where substring(Titulo, -1) = 1 ;

select substring(Titulo, -1) from Comic;

4. Agregación múltiple

select max(nacimiento) as masJoven, min(nacimiento) as masMayor from mascotas where fallecimiento is null;


select nombre, nacimiento from mascotas where fallecimiento is null order by nacimiento asc limit 1;


select count(exito) as exitos from peticiones where exito = 0;

select date_format(max(tiempo), "%H:%i") as Hora from peticiones where tiempo_procesado > 3 and tipo_peticion like "%consulta%";

select lower(concat(NOM_AUTOR, " ", APE1_AUTOR)) as Autor, concat(upper(substring(Titulo, 1, 1)), lower(substring(Titulo, 2))) as Titulo from libros;


select concat(substring(cliente, 1, 4), "(", substring(producto, 1, 5), ")") as "cli(prod)", precio_unidad from facturas where precio_unidad between 0.25 and 1;

select lower(TITULO) as Titulo, concat(upper(substring(NOM_AUTOR, 1, 1)), lower(substring(NOM_AUTOR, 2))) as Autor from libros where NUM_PAGINAS > 200 order by TITULO desc;

select nombre_empleado from t_empleados order by substring(nombre_empleado,locate(",", nombre_empleado)) ;


select terminal, cargo, date_format(finicio, "%d/%m/%Y") as finicio, date_format(ffin, "%d/%m/%Y") as ffin from usa where  timestampdiff(day, finicio, ffin)  > 5 and timestampdiff(month, finicio, ffin) > 6;

select Nombre, substring_index(Nacimiento, " ", 1) as "edad en Batalla de Yavin" from Personajes where substring(Nacimiento, -3) like "%ABY%" ;

select Titulo, concat(Titulo,",", date_format(Lanzamiento, "%Y-%m"),":", Id_dir) as identif from Pelicula where timestampdiff(year, "2000-1-1", Lanzamiento) > 13 and substring_index(Titulo, ":", 1) like "%VI%" or substring_index(Titulo, ":", 1) like "%VII%" or substring_index(Titulo, ":", 1) like "%VIII%";

select count(*) especie, especie from  mascotas group by especie;

select count(*) especie, especie, count(*) sexo, sexo from mascotas group by especie, sexo;

select avg(timestampdiff(year, nacimiento, curdate())) as edadMedia, especie from mascotas where nacimiento is null;

select especie, group_concat(nombre) as nombres_mascotas from mascotas group by especie;

select propiertario, count(*) as num_mascotas, group_concat(nombre) as nombres from mascotas where nacimiento is null group by

select especie, sexo, group_concat(distinct propietario) as propietario from mascotas group by especie, sexo;

select group_concat(nombre) as nombre_mascotas, month(nacimiento) as mes_nac from mascotas group by month(nacimiento) order by month(nacimiento);

select group_concat(nombre) as nombre, dayname(nacimiento) as diaNac from mascotas group by diaNac, nombre order by dayname(nacimiento) asc;


select substring(Nombre, length(Profesion), length(Planeta)) as codigo from Personajes where length(Nombre) >= length(concat(Planeta, Profesion));

select ISBN_N, Titulo from Novela where timestampdiff(month, Lanzamiento, Ultima_edicion) > 6 and locate(substring(ISBN_N, -1), ISBN_N) = 1;

select substring(ISBN_N, -1) from Novela;


select nombre_departamento, presupuesto_departamento, (presupuesto_departamento * 0.0732) / 4 as incremento, (presupuesto_departamento * 0.0732) / 4 + presupuesto_departamento as nuevo_presupuesto  from t_departamentos where (presupuesto_departamento / 12) > 710 order by nombre_departamento;

select nombre_empleado, salario_base_empleado from t_empleados where year(fecha_ingreso_empleado) >= 1997 or year(fecha_ingreso_empleado) = 1976 order by nombre_empleado;

select substring_index(nombre_empleado, ",", -1) as nombre, fecha_nacimiento_empleado as nacimiento, fecha_ingreso_empleado as ingreso from t_empleados where timestampdiff(year, fecha_ingreso_empleado, "2020-1-1") <= round(timestampdiff(year, fecha_nacimiento_empleado,"2020-1-1" ) / 2);


select nombre_empleado, salario_base_empleado from t_empleados where (codigo_departamento = 110 or codigo_departamento = 111) and (numero_hijos_empleado = 0 or salario_base_empleado / numero_hijos_empleado > 1000);


select ISBN_N, Titulo from Novela where timestampdiff(month, Lanzamiento, Ultima_edicion) > 6 and locate(substring_index(ISBN_N, "-", -1), ISBN_N) = 1;

select Titulo, concat(SW_Era,",", date_format(Lanzamiento, "%Y-%m"),":", Id_dir) as identif from Pelicula where timestampdiff(year, "2000-1-1", Lanzamiento) > 13 and substring_index(Titulo, ":", 1) like "%VI%" or substring_index(Titulo, ":", 1) like "%VII%" or substring_index(Titulo, ":", 1) like "%VIII%";


select substring_index(nombre_empleado, ",", -1) as nombre, fecha_nacimiento_empleado as nacimiento, fecha_ingreso_empleado as ingreso from t_empleados where timestampdiff(day, fecha_ingreso_empleado, "2020-1-1") <= round(timestampdiff(day, fecha_nacimiento_empleado,"2020-1-1" ) / 2);


select nombre_empleado from t_empleados where ((numero_hijos_empleado * 100) < salario_base_empleado / 10) and (numero_hijos_empleado * 100) >= 100 order by nombre_empleado;



select nombre_empleado, salario_base_empleado from t_empleados where year(fecha_ingreso_empleado) >= 1997 or year(fecha_ingreso_empleado) = 1976 order by nombre_empleado;


select date_format(max(tiempo), "%H:%i") as Hora from peticiones where tiempo_procesado > 3 and (tipo_peticion like "%consulta%");


select count(*) as exitos from peticiones where exito = 1;

select min(tiempo) as Antigua, max(megabytes_ficheros) as Mb, max(tiempo_procesado) as "Tiempo procesado" from peticiones where tipo_peticion like "%actualizacion%";

select codigo_cliente, truncate(avg(megabytes_ficheros), 2) as media_megas, truncate(avg(numero_ficheros),2) as media_ficheros from peticiones group by codigo_cliente;

select hour(tiempo) as hora, count(*) as num_peticiones from peticiones group by hora order by hora asc;

select month(tiempo) as mes, sum(numero_ficheros) as num_ficheros, truncate(sum(megabytes_ficheros) / 1024, 2) as gigabytes from peticiones where tipo_peticion like "%insercion%" group by mes order by mes asc;


select codigo_cliente, max(tiempo_procesado) as max_t, max(megabytes_ficheros) as max_f, min(tiempo_procesado) as min_t, min(megabytes_ficheros) as min_f from peticiones where codigo_cliente like "%ES%" group by codigo_cliente;


select codigo_cliente, month(tiempo) as mes, max(tiempo) as ultima, min(tiempo) as primera from peticiones group by codigo_cliente, mes order by mes asc;

select codigo_cliente, count(exito) as fracasos from peticiones where tipo_peticion like "%consulta%" and exito = 0 group by codigo_cliente having fracasos < 800 order by fracasos desc;

select tipo_peticion, avg(tiempo_procesado) as tiempo_medio, sum(exito) as aceptadas from peticiones where codigo_cliente like "%ES%" group by tipo_peticion;

select codigo_cliente, hour(tiempo) as franja, sum(exito) as peticiones from peticiones where exito > 700 or exito < 1000 group by codigo_cliente, franja;

select count(*) as empleados from t_empleados where salario_base_empleado < (select avg(salario_base_empleado) from t_empleados);

select nombre_departamento from t_departamentos where codigo_departamento IN(select codigo_departamento from t_empleados where salario_base_empleado=(select max(salario_base_empleado) from t_empleados));


select codigo_empleado, nombre_empleado from t_empleados where year(fecha_ingreso_empleado) between 1980 and 1989 and codigo_departamento in (select codigo_departamento from t_departamentos where presupuesto_departamento < 10000);


select codigo_departamento, presupuesto_departamento from t_departamentos;

select id from rol where nombre like "%Alumno%";

select min(fechaPermCirc) as "Fecha mas antigua", marca from automoviles group by marca having count(marca) > 40;


select nombre, apellidos from persona where id in (select ida from alumno where idg in (select idg from (select count(*) as alumnos, idg from alumno group by idg) as subtabla where alumnos = 1));

select codigo_cliente, month(tiempo) as mes, truncate((count(*) * 0.01 + sum(megabytes_ficheros) * 0.005 + sum(numero_ficheros) * 0.005), 2) as coste from peticiones where tipo_peticion not like "%consulta%" and exito != 0 group by codigo_cliente, mes order by mes;


select month(tiempo) as mes, substring(codigo_cliente, 1, 2) as pais, tipo_peticion, count(exito) as fallidas, sum(tiempo_procesado) as tiempo from peticiones where exito = 0 group by mes, pais, tipo_peticion having tiempo > 300 order by pais, tiempo desc;


select codigo_cliente, month(tiempo) as mes, count(exito) as peticiones from peticiones where exito = 1 group by codigo_cliente, mes having peticiones < 4000 order by mes;


select nombre_empleado from t_empleados where salario_base_empleado < (select avg(salario_base_empleado) from t_empleados);

select nombre_departamento from t_departamentos where codigo_departamento in (select codigo_departamento from t_empleados where salario_base_empleado = (select max(salario_base_empleado) from t_empleados));




select cliente, max(total_factura) as "Factura mas alta"  from (select num, cliente, sum(precio_unidad * unidades) as total_factura from facturas group by cliente, num) as subconsulta group by cliente;


select codigo_empleado, nombre_empleado from t_empleados where year(fecha_ingreso_empleado) between 1980 and 1989 and codigo_departamento in (select codigo_departamento from t_departamentos where presupuesto_departamento < 10000);

select nombre_empleado, salario_base_empleado from t_empleados where salario_base_empleado = any (select salario_base_empleado from t_empleados where codigo_departamento in (select codigo_departamento from t_departamentos where codigo_centro = (select codigo_centro from t_centros where ubicacion like "%C/ Atocha%" ))) and codigo_departamento not in (select codigo_departamento from t_departamentos where codigo_centro = (select codigo_centro from t_centros where ubicacion like "%C/ Atocha%"));


select producto, count(producto) as lineas, sum(unidades) as unidades, avg(unidades) as media from facturas where unidades group by producto order by media;

select substring(cliente, 1, length(cliente) / 2) as cod_cli, producto, avg(precio_unidad) as media, count(unidades) as num from facturas where precio_unidad >= 4 group by cod_cli, producto order by producto, cod_cli;

select concat(right(cliente, 2), left(cliente, 2)) as cod_cli, sum(unidades * precio_unidad) as total, count(*) as num from facturas where dayofweek(fecha_fac) between 5 and 7 group by cod_cli order by total desc limit 3;

select nombre_empleado, salario_base_empleado from t_empleados where salario_base_empleado > 3000 and codigo_departamento in (select codigo_departamento from t_empleados group by codigo_departamento having avg(salario_base_empleado) <3000);



Mostrar por departamento cuánto presupuesto de departamento tendría cada empleado.
cod_dep	presupuesto_medio
100	40000.0000
110	5000.0000
111	1375.0000
112	1285.7143
120	3000.0000
121	500.0000
122	1200.0000
130	666.6667


select codigo_departamento as cod_dep, presupuesto_departamento / (select count(*) from t_empleados where codigo_departamento = cod_dep group by codigo_departamento) as presupuesto_medio from t_departamentos;


Si se despidiese al empleado que más gana de cada departamento, y un salario mensual pasase al presupuesto del departamento, ¿a cuánto ascendería cada presupuesto de departamento?
cod_dep	presupuesto_departamento + (select max(salario_base_empleado) from t_empleados where codigo_departamento = cod_dep)
100	127200
110	19800
111	14100
112	12800
120	5700
121	6400
122	10500
130	6200

select codigo_departamento as cod_dep, presupuesto_departamento + (select max(salario_base_empleado) from t_empleados where codigo_departamento = cod_dep) as presupuesto from t_departamentos;


Selecciona la diferencia de la media de las pólizas de la aseguradora Direct Seguros por año con la media de todas las pólizas de cada año.

Solución 9 filas:

año	difMedia
2000	20.7500
2001	-75.3167
2002	24.4649
2003	-148.5645
2004	-466.0784
2005	-212.7480
2006	-0.4848
2007	25.7143
2009	48.5000


select year(fechaAlta) as año, avg(cuantia) - (select avg(cuantia) as media from polizas where nombreAseguradora like "Direct Seguros" and year(fechaAlta) = año ) as difMedia from polizas group by año order by año;


select truncate(avg(salario_base_empleado),2) from t_empleados where codigo_departamento in (select codigo_departamento from t_departamentos where presupuesto_departamento < 10000);

select nombre_departamento from t_departamentos where codigo_departamento in (select codigo_departamento from t_empleados where year(fecha_nacimiento_empleado) between 1978 and 1989);

select nombre_empleado, year(fecha_nacimiento_empleado) as "año" from t_empleados where codigo_departamento in (select codigo_departamento from t_departamentos where presupuesto_departamento < 4000) and numero_hijos_empleado > 2;


Selecciona el nombre del empleado sin el apellido, con la inicial siempre en minuscula y el cudrado de el salario de los empleados redondeado al entero más cercano sumado al salario base del empleado como Incremento_salario de aquellos empleados cuya longitud del apellido sea menor o igual a 10 caracteres y su nombre termine en s o en n ordenado por el nombre del empleado.


select substring_index(lower(substring(nombre, 1)), " ", 1) as Nombre, round(sqrt(salario), 2) + salario as Incremento_salario from empleado where length(substring_index(nombre, " ", -1)) <= 10 and substring_index(nombre, " ", 1) like "%s" or substring_index(nombre, " ", 1) like "%n";

#Selecciona todos los nacidos en Cádiz (CA), Toledo (TO) o Valencia (V).

Total filas: 6


select * from nacimientos where Provincia like "%to%" or Provincia like "%C%" or Provincia like "%V%";

solucion carlos:

Se puede utilizar el comparador de igualación ya que los datos son atomicos es decir solo CA o TO, pero si no obligatoriamente un like

select * from nacimientos where provincia = "CA" or provincia = "TO" or provincia = "V";


Selecciona todos los no nacidos en Málaga (MA) y que su primer apellido o nombre empiecen por A

Total filas: 6

Selecciona todos los no nacidos en Málaga (MA) y que su primer apellido o nombre empiecen por A

select * from nacimientos where Provincia != "MA" and Apellido1 like "A%";


Selecciona todos los no nacidos en Madrid (M) ordenados de más nuevo a más antiguo por fecha de nacimiento.

Total filas: 17

select * from nacimientos where Provincia not like "%M%" order by FechaNac desc;


Selecciona el nombre y apellidos de los nacidos entre mayo de 2006 y abril de 2007, ordenados descendentemente por ambos apellidos.

Total filas: 3

select nombre, Apellido1, Apellido2 from nacimientos where FechaNac between "2006-05-01" and "2007-04-30" order by Apellido1, Apellido2 desc;


Selecciona las columnas de apellido1, apellido2 y fecha de aquellas filas en las que su fecha de nacimiento se encuentre entre 2-1-2005 y 10-11-2005, ambos incluidos, ordenados por fecha.

Total filas: 7


select Apellido1, Apellido2, FechaNac from nacimientos where FechaNac between "2005-01-02" and "2005-11-10" order by FechaNac;


Selecciona todos los que su primer apellido contenga dos letras 'a' o el segundo la letra 'z'.

Total filas: 9

select * from nacimientos where Apellido1 like "%a%%a%" or Apellido1 like "%z%";

De la tabla FACTURAS visualizar el nombre del cliente, nombre del producto, el precio unitario, 
las unidades pedidas y el valor total de las unidades pedidas bajo el título de columna TOTAL EUR, y otra columna TOTAL PST en pesetas en vez de euros. 
Hay que tener en cuenta que no existían los céntimos de peseta hace 25 años, por lo que habrá que redondear para que no muestre céntimos.

114 filas.

select cliente, producto, precio_unidad as "Precio unitario", precio_unidad * unidades as TOTAL_EUR, round((precio_unidad * unidades) * 166.386) as TOTAL_PST from facturas;


De la tabla FACTURAS visualizar el nombre del producto, el precio unitario, las unidades pedidas, el valor total de las unidades pedidas bajo el título PRECIO_TOTAL
 y una última columna donde se aplicará un descuento del 15% bajo el título de PRECIO_FINAL. Se tendrá en cuenta que únicamente se seleccionarán las filas que superen las 15 unidades y ordenadas  
 ascendentemente por su fecha de factura, aunque dicha fecha no se visualizará.

55 filas:


select producto, precio_unidad, unidades, precio_unidad * unidades as PRECIO_TOTAL, abs((precio_unidad * unidades * 0.15) - (precio_unidad * unidades)) as PRECIO_FINAL from facturas where unidades > 15 order by fecha_fac;


"De la tabla FACTURAS visualizar el nombre del producto y el valor total de las unidades pedidas bajo el título PRECIO_TOTAL y ajustando el precio al entero siguiente. 
Se tendrá en cuenta que únicamente se seleccionarán aquellas filas que tengan 15 o menos unidades y se ordenarán ascendentemente por el PRECIO_TOTAL. Pista: Función Ceil."

Total 59 filas:

select producto,  ceil(precio_unidad * unidades) as PRECIO_TOTAL from facturas where unidades <= 15 order by PRECIO_TOTAL;


De la tabla FACTURAS visualizar el número de factura, el nombre del producto, el precio unitario de las filas cuyo número de factura sea par, ordenadas descendentemente por número de factura y visualizando una nueva columna 
con el valor de la raíz cuadrada del número de factura y con el alias “Raíz”  redondeada a dos decimales. Pista: Funciones Round y Sqrt.

Total 61 filas:

select num, producto, precio_unidad, round(sqrt(num), 2) as Raiz from facturas where num % 2 = 0 order by num desc;


De la tabla FACTURAS visualizar la fecha de factura, el producto, las unidades, el número de paquetes y los huecos del último paquete de aquellas facturas en que las unidades sean inferiores a 36, 
ordenados descendentemente por la columna de fecha de factura. Se ha de tener en cuenta que en un paquete caben 12 unidades.

Total 87 filas:

select fecha_fac, producto, unidades, ceil(unidades / 12) as num_paquetes, ceil(unidades / 12) * 12 - unidades as huecos from facturas where unidades < 36 order by fecha_fac desc;


De la tabla FECHAS, visualizar aquellas fiestas cuyo día de celebración es distinto al de la fiesta real.

Total 2 filas:

select FIESTA from fechas where timestampdiff(day, FECHA_FI, FECHA_CE) != 0;


De la tabla libros, los títulos y el precio por página en céntimos, de aquellos cuyas páginas cuesten más de 3 céntimos.

Total 4 filas:

select titulo, (precio / NUM_PAGINAS * 100) as "Precio pagina cts" from libros where (precio / NUM_PAGINAS) > 0.03;


De la tabla empelados muestra el código, el sueldo y las dietas de los empleados que no tengan comisión y cuyo sueldo sea menos de 10 veces las dietas.

Total 1 filas:

select codigo, sueldo, dietas from empleados where  comision is null and sueldo < dietas * 10;


De la tabla facturas, muestra todas las columnas cuyos clientes comienzan por "El" con más de 50 unidades, o que no comiencen por "El" y tengan menos de 5.

Total 13 filas:

select * from facturas where substring_index(cliente, " ", 1) like "%El%" and unidades > 50 or substring_index(cliente, " ", 1) not like "%El%" and unidades and unidades < 5;

Muestra el nombre, la edad y el equipo de los ciclistas que tengan entre 20 y 25 años, o entre 30 y 35 años, pero que pertenezcan a equipos que empiezan por B.

Total 7 filas:

!!!!Mucho ciudado con los parentesis!!!!

select nombre, edad, nomequipo from ciclista where nomequipo like "B%" and (edad between 20 and 25 or edad between 30 and 35);


Selecciona el dorsal, nombre y edad de los ciclistas cuya cifra de unidad de dorsal coincide con la cifra de unidad de su edad. (Fijarse: 11 con 31, 17 con 37, 21 con 31, etc).

Total 8 filas

select dorsal, nombre, edad from ciclista where (dorsal % 10) = (edad % 10);

Selecciona el nombre, la edad, el equipo y la diferencia entre la edad y el dorsal, de aquellos cuyo nombre empieza por M y el equipo por B, o el nombre por A y el equipo por M.

Total 7 filas:

select nombre, edad, nomequipo, abs(edad - dorsal) as diff from ciclista where nombre like "M%" and nomequipo like "B%" or nombre like "A%" and nomequipo like "M%";

Selecciona los kilómetros, la salida, la llegada y el dorsal (del ganador) de las etapas cuya longitud en kilómetros es múltiplo del dorsal del ganador, pero de aquellas etapas que no sean circulares.

Total 9 filas:

select kms, salida, llegada, dorsal from etapa where kms % dorsal = 0 and salida != llegada;

Selecciona el número de etapa, los metros que tiene la etapa y de dónde sale de aquellas etapas con 5 o más caracteres en el lugar de salida y menos de 100000 metros de longitud, o con solo cuatro caracteres en el lugar de salida sin importar la longitud. Mostrar ordenado alfabéticamente por la salida.

Total 4 filas:

select numetapa, kms * 1000 as metros, salida from etapa where length(salida) >= 5 and (kms * 1000) < 100000 or length(salida) = 4 order by salida;


Mostrar el código de empleado, el la extensión telefónica y el nombre del empleado de aquellos donde no hay más de 100 de diferencia entre su código de empleado y su extensión telefónica y cuyo apellido no comienza por la letra L.
Total filas: 4

select codigo_empleado, extension_telefonica_empleado, nombre_empleado from t_empleados where abs(codigo_empleado - extension_telefonica_empleado) < 100 and nombre_empleado not like "L%";

Selecciona el código de empleado, su nombre y apellidos y su paga, sabiendo que la paga será el salario mas un 25% de la comisión por cada hijo que tenga. 
Solo ha de mostrar de aquellos que tienen comisiones y se incorporaron a la empresa el 1 de enero de 1990 o posterior.

select codigo_empleado, nombre_empleado, salario_base_empleado + comision_empleado * 0.25 * numero_hijos_empleado as Paga from t_empleados where comision_empleado is not null and year(fecha_ingreso_empleado) > "1990-1-1";

Mostrar el nombre, la comisión y el número de hijos de los empleados, de aquellos que tengan dos letras "a" en el nombre
 (no tiene por qué en el apellido, solo obligatorio en el nombre: por ejemplo "Alvarez, Rosa" no lo cumple, pero sí "Veiga, Juliana"), y que o no tengan hijos o no tengan comisión.
Total filas: 9

select nombre_empleado, comision_empleado, numero_hijos_empleado from t_empleados where substring_index(nombre_empleado, " ", -1) like "%a%%a%" and (numero_hijos_empleado <1 or comision_empleado is null);


Mostrar el nombre, y las fechas de nacimiento e ingreso de aquellos empleados que contengan las letras "a" y "r" (en ese orden) en el apellido (no tiene por qué en el nombre, solo obligatorio en el apellido: por ejemplo 
"Lasa, Mario" no lo cumple, pero sí "Aguirre, Pablo") y, además de esto, que hayan nacido desde 1960 o se hayan incorporado desde 1987

select nombre_empleado, fecha_nacimiento_empleado, fecha_ingreso_empleado from t_empleados where substring_index(nombre_empleado, " ", 1) like "%a%%r%" and (year(fecha_nacimiento_empleado) > "1960-1-1" or year(fecha_ingreso_empleado) > "1987-1-1");

De la tabla FACTURAS visualizar la fecha de factura, el producto y las unidades de aquellas filas en que las  unidades sean divisibles entre 12, ordenados por la columna de fecha de factura.

Total 62 filas:


select fecha_fac, producto, unidades from facturas where unidades % 12 = 0 order by fecha_fac;

De la tabla FACTURAS visualizar las unidades de aquellas filas en que el número de unidades sea menor que 10, visualizando además una nueva columna con el valor de las unidades elevadas al cubo y con el alias Unid. al cubo. Pista: Función pow.

Total 28 filas:

select unidades, pow(unidades, 3)as "Alias unid" from facturas where unidades < 10;

De la tabla FACTURAS visualizar el número de factura, las unidades, la diferencia entre el número de factura y las unidades con el alias VAL_SIGNO y el valor absoluto de la diferencia entre el número de factura y las unidades con el alias VAL_ABSOLUTO 
de aquellas filas donde el número de unidades supere al doble del número de factura. Pista: Función abs

Total 57 filas:

select num, unidades, num - unidades as "VAL_SIGNO", abs(num - unidades) as "VAL_ABSOLUTO" from facturas where unidades > num * 2;

De la tabla EMPLEADOS visualizar las columnas del valor de la diferencia en entre DIETAS y COMISION con el alias “Diferencia”, 
el valor absoluto de la diferencia entre DIETAS y COMISION con el alias “Absoluto”, el valor del signo de la diferencia entre DIETAS y 
COMISION con el alias “Signo” y por último el va lor de la suma del SUELDO, DIETAS y COMISION con el alias “Total”. Pista: Función sign.

Total 6 filas:

select dietas - comision as diferencia, abs(dietas - comision) as Absoluto, sign(dietas - comision) as signo, sueldo+dietas+comision as Total from empleados;

De la tabla FECHAS visualizar en mayúsculas la columna FIESTA de aquellas filas cuya fecha de celebración sea anterior al mes de agosto. Pista: Función upper y month.

Total 5 filas:

select upper(fiesta) from fechas where month(fecha_ce) < 8;

De la tabla LIBROS visualizar en minúscula el nombre del autor y relleno por la derecha del carácter punto (.) hasta 25 posiciones. Pista: Función rpad.

Total 12 filas:

select rpad(lower(NOM_AUTOR), 25, ".") as autor from libros;



De la tabla LIBROS visualizar el nombre del autor cambiando las letras ‘A’ por letras ‘O’ y el título cambiando las letras ‘E’ por letras ‘U’. Pista: Función replace.

Total 12 filas:


select replace(NOM_AUTOR, "A", "O") as "Nombre Autor", replace(TITULO, "E", "U") as titulo from libros;

De la tabla FECHAS visualizar en mayúsculas la columna FIESTA de aquellas filas cuya longitud de FIESTA sea par. Pista: Función length.

Total 4 filas:

select upper(fiesta) as Fiesta from fechas where length(fiesta) % 2 = 0;

De la tabla DATOSPERSONALES visualizar en minúsculas la dirección con el alias Direc., código postal con el alias CP, población con el alias Pob., provincia con el alias Prov., teléfono con el alias Tlf. 
y estado civil con el alias Est. Civ. de aquellas filas que no tengan como población MADRID. Pista: Función lower.

Total 3 filas:

select lower(direccion) as Direc, codigo_postal as CP, poblacion as Pob, provincia as Prov, telefono as Tlf, estado_civil as "Est. Civ." from datospersonales where POBLACION not like "%MADRID%";

Muestra los 4 primeros caracteres del cliente junto a los 5 primeros del producto entre paréntesis en 
un campo llamado cli(prod), y el precio de cada unidad, de los productos cuyas unidades valen entre 0.25 y 1. 11 filas

cli(prod)   | precio_unidad |

+-------------+---------------+

| Supe(Cuaja) |          0.25 |

| Ahor(Cuaja) |          0.25 |

| Ahor(Cuaja) |          0.25 |

| Bara(Cuaja) |          0.25 |

| Bara(Cuaja) |          0.25 |

| Supe(Cuaja) |          0.25 |

| Comp(Cuaja) |          0.25 |

| El B(Cuaja) |          0.25 |

| El C(Cuaja) |          0.25 |

| Blan(Cuaja) |          0.25 |

| Supe(Cuaja) |          0.25 |

+-------------+---------------+

11 rows in set (0,00 sec)



select concat(left(cliente, 4), "(", left(producto, 5), ")") as "cli(prod)", precio_unidad from facturas where precio_unidad between 0.25 and 1.11;


Muestra los 10 productos con menor coste total (precio por unidades), mostrando del nombre del producto los mismos caracteres que
 tiene el nombre del cliente. Ordenarlo por el coste total ascendente. 10 filas



select left(producto, length(cliente)) as prodlen, precio_unidad * unidades as coste_total from facturas order by coste_total limit 10;


Muestra los 4 primeros caracteres del cliente y los 4 últimos del producto, de las facturas que tienen menos de 6 unidades. (11 filas)

select left(cliente, 4) as cli4, right(producto, 4) as pro4 from facturas where unidades < 6;

De la tabla LIBROS visualizar la columna del título del libro con la primera en minúscula y el resto en mayúscula con el alias “Titulo”, visualizando así mismo la columna del nombre
del autor rellena por la izquierda con el carácter subra yado (_) hasta un total de 25 posiciones y con el alias “Autor”. Pista: Función lpad.


select concat(lower(left(Titulo, 1)), upper(substring(titulo, 2))) as Titulo, lpad(NOM_AUTOR, 25, "_") as Autor from libros;

De la tabla LIBROS visualizar la concatenación del nombre del autor y el primer apellido todo ello en minúscula y separados por un espacio en blanco con el alias “Autor”. 
Visualizar además la columna del título con la primera letra de la columna en mayúscula y el resto en minúscula con el alias “Título”. Pista: función concat y substr.


select lower(concat(NOM_AUTOR, " ", APE1_AUTOR)) as Autor, concat(upper(left(titulo, 1)), lower(substring(titulo, 2, length(titulo)))) as titulo from libros;


De la tabla LIBROS visualizar el título en minúscula y el nombre del autor con la primera en mayúsculas y el resto en minúsculas con el alias “Autor”,
de aquellas filas cuyos libros tengan más de 200 páginas, ordenado  descendentemente por título.

select lower(TITULO) as titulo, concat(upper(left(NOM_AUTOR, 1)), lower(substring(NOM_AUTOR, 2, length(NOM_AUTOR)))) as Autor from libros where NUM_PAGINAS > 200 order by titulo desc;


Mostrar el nombre del producto relleno con puntos hasta 15 caracteres seguido de dos puntos, espacio y el nombre del cliente llamado "procli", después el coste total resultante de multiplicar unidades por precio unidad,
y finalmente el número de monedas de 50 céntimos necesarias para pagar ese coste total, 
de aquellas filas cuyo nombre de producto tiene menor longitud que la posición de la primera "o" en el nombre del cliente. Total 28 filas:

| procli                          | coste_total | monedas50 |

+---------------------------------+-------------+-----------+

| Yogurt lim¢n...: Super Paquito  |        1.20 |         3 |

| Leche entera...: Super Paquito  |       72.00 |       144 |

| Leche semi.....: Super Paquito  |       74.88 |       150 |

| Leche calcio...: Super Paquito  |       37.44 |        75 |

| Cuajada........: Super Paquito  |        2.50 |         5 |

| Yogurt fresa...: Super Paquito  |        0.60 |         2 |

| Leche entera...: Super Paquito  |       72.00 |       144 |

| Flan...........: Super Paquito  |       36.00 |        72 |

| Cuajada........: Super Paquito  |        1.50 |         3 |

| Queso fresco...: Super Paquito  |       18.06 |        37 |

| Yogurt lim¢n...: Super Paquito  |        1.80 |         4 |

| Yogurt fresa...: Super Paquito  |        2.40 |         5 |

+---------------------------------+-------------+-----------+

28 rows in set (0,01 sec)



select concat(rpad(producto, 15, "."),": ", cliente) as procil, precio_unidad * unidades as coste_total, ceil(precio_unidad * unidades) / 0.50 as monedas50 from facturas where length(producto) < locate("o", cliente);


Mostrar el terminal y el cargo que usó dicho terminal, así como la fecha de inicio y final de uso 
(en formato de fecha español día/mes/año con dos dígitos), de aquellos que estuvieron más de 6 meses en el cargo, y 
los días del mes de la fecha de inicio y de final no difieren en más de 5.

Total filas: 6

select terminal, cargo, date_format(finicio, "%d/%m/%Y") as finicio, date_format(ffin, "%d/%m/%Y") as ffin from usa where timestampdiff(month, finicio, ffin) > 6 and abs(day(finicio) - day(ffin)) < 5;

Muestra el número de remitente y de destino, así como las hora, minuto y segundo (en el formato indicado en la tabla) 
del inicio y final de la llamada, de aquellas que comenzaron entre las 9 y las 11 pero no terminaron en esa franja.

Total filas: 4

 numerorem | numerodes | finicio     | ffin        |

+-----------+-----------+-------------+-------------+

| 620020200 | 620020203 | 11h,55m,53s | 12h,10m,30s |

| 620020200 | 620020203 | 11h,57m,28s | 12h,00m,13s |

| 620020200 | 633909002 | 11h,55m,58s | 12h,07m,44s |

| 620020207 | 620020200 | 10h,13m,20s | 12h,00m,01s |

+-----------+-----------+-------------+-------------

!!!OPERADORES EXTRAÑOS IMPORTANTE NO VIENE EN APUNTES!!!


select numerorem, numerodes, date_format(finicio, "%kh, %im, %ss") as finicio, date_format(ffin, "%kh, %im, %ss") as ffin from llamada where hour(finicio) between 9 and 11 and hour(ffin) not between 9 and 11;


Selecciona los números que intervienen en las llamadas de más de 10 minutos cuyos 
tres primeros dígitos están separados por más de 3 números, 
mostrando las fechas de inicio y fin de llamada como se muestra en la tabla.

9 filas

 numerorem | numerodes | finicio          | fin              |

+-----------+-----------+------------------+------------------+

| 620020200 | 620020207 | 23 de 12 de 2018 | 23 de 12 de 2018 |

| 620020200 | 633909002 | 02 de 12 de 2019 | 02 de 12 de 2019 |

| 620020205 | 635230101 | 22 de 11 de 2018 | 23 de 11 de 2018 |

| 620020205 | 635230101 | 21 de 07 de 2019 | 21 de 07 de 2019 |

| 620020205 | 635230101 | 07 de 02 de 2020 | 07 de 02 de 2020 |

| 620020207 | 620020200 | 28 de 03 de 2019 | 28 de 03 de 2019 |

| 635230103 | 620020200 | 17 de 01 de 2020 | 17 de 01 de 2020 |

| 635230103 | 620020200 | 19 de 01 de 2020 | 19 de 01 de 2020 |

| 635230103 | 620020200 | 23 de 01 de 2020 | 23 de 01 de 2020 


select numerorem, numerodes, date_format(finicio, "%d de %m de %Y") as finicio, date_format(ffin, "%d de %m de %Y") as fin from llamada where timestampdiff(minute,finicio, ffin) > 10 and abs(right(numerorem, 3) - right(numerodes, 3)) > 3;



Selecciona los terminales que usaron los cargos que estuvieron menos de 400 días en el cargo, pero añadiendo 1 mes y 5 días a la fecha de inicio, 
en el formato mes-día (año), como se muestra en la tabla.

Total filas: 7


 terminal | cargo            | finincio     |

+----------+------------------+--------------+

|      896 | Director         | 10-06 (2018) |

|      897 | Director         | 10-06 (2018) |

|      904 | Director         | 01-15 (2019) |

|      906 | Director         | 02-07 (2019) |

|      913 | Jefe de proyecto | 03-18 (2019) |

|      929 | Director         | 01-24 (2019) |

|      930 | Director         | 01-28 (2019) |

+----------+------------------+--------------+

7 rows in set (0,02 sec)


select terminal, cargo,  date_format(date_add(date_add(finicio, interval 1 month), interval 5 day), "%m-%d (%Y)") as finicio from usa where timestampdiff(day, finicio, ffin) < 400;

Muestra el campo nombre_empleado completo de todos los empleados, pero ordenado por su nombre.

Pista: usar función locate, ya que nombre no es un campo, 
está dentro del campo nombre_empleado que incluye el nombre tras una coma.

nombre_empleado  |

+------------------+

| ALBA, ADRIANA    |

| DIEZ, AMELIA     |

| LOPEZ, ANTONIO   |

| GARCIA, AUGUSTO  |

| CAMPS, AURELIO   |

| AGUIRRE, AUREO   |

| MU�OZ, AZUCENA   |

| MORAN, CARMEN    |

| PONS, CESAR      |

| FIERRO, CLAUDIA  |

| SANZ, CORNELIO   


Total filas: 34

select nombre_empleado from t_empleados order by substring_index(nombre_empleado, ",", -1);

#Funcion equivalente:

select nombre_empleado from t_empleados order by substring(nombre_empleado,locate(",",nombre_empleado) +2,length(nombre_empleado));


Mostrar los personajes de Starwars que nacieron en años acabados en 0 o 5, 
sin importar si son ABY o DBY. Mostrar solo la primera y última parte del nombre y
en medio la raza del personaje.

select concat(substring_index(nombre, " ", 1), " ", "(", especie,  ")", " ", substring_index(nombre, " ", -1)) as personaje, Nacimiento from Personajes where substring_index(nacimiento, " ", 1) % 5 = 0;


Mostrar el tercio intermedio del código ISBN_C y a su lado el código ISBN_C completo, de los títulos de Cómic que son el primer volumen. 
Se indica el volumen al final del título siempre. Pista: hay que truncar la longitud de ISBN.

Total filas: 7

#DIFICIL!!!

| tercio | ISBN_C            |

+--------+-------------------+

| 6-060  | 759-6-060-9194-2  |

| 6-060  | 759-6-060-9199-7  |

| -302-9 | 978-1-302-90941-3 |

| -416-2 | 978-8-416-24410-2 |

| -416-4 | 978-8-416-47653-4 |

| -416-6 | 978-8-416-69355-9 |

| -491-4 | 978-8-491-46779-3 |

+--------+-------------------+

7 rows in set (0,00 sec)


select substring(ISBN_C, round(length(ISBN_C)/3,0), round(length(ISBN_C)/3,0)) as tercio, ISBN_C from Comic where right(Titulo,1) = "1";




select substring(nombre, length(Profesion), length(Planeta)) as codigo from Personajes where length(nombre) >= length(concat(Planeta, Profesion));


select Nombre, substring_index(nacimiento, " ", 1) as "edad en Batalla de Yavin" from Personajes where  substring_index(nacimiento, " ", -1) like "%ABY%";

Muestra el ISBN y el Título de las novelas cuya última edición fue seis meses o más tarde que su lanzamiento y cuyo último dígito del ISBN aparece al menos una vez más en el propio ISBN.

Total filas: 1

ISBN_N
Titulo
978-1-101-88495-9	Discipulo Oscuro

select ISBN_N, Titulo from Novela where timestampdiff(month, lanzamiento, Ultima_edicion) > 6 and locate(right(ISBN_N, 1), ISBN_N) between 1 and length(ISBN_N) -1 ;



Mostrar el título de la película y un identificador formado por la era, año, mes y director (según se muestra en la tabla con comas y dos puntos) de las películas que siendo recomendadas
 para mayores de 13 años pudo ir cumpliendo dicha recomendación alguien nacido el 1 de enero de 2000,
 pero que sean del capítulo 6 o posterior. Nota: para el capítulo, al ser números romanos, como excepción podemos dar por hecho que no habrá más filas que las que hay en la propia tabla.

Total filas: 2

+-----------------------------------------+--------------------------+

| Titulo                                  | identif                  |

+-----------------------------------------+--------------------------+

| Episodio VII: El Despertar de la Fuerza | First Order,2015-12:4    |

| Episodio VIII: Los Ultimos Jedi         | New Jedi Order,2017-12:6 |

+-----------------------------------------+--------------------------


select titulo, concat(SW_Era, ",", date_format(lanzamiento, "%Y-%m"), ":", Id_dir) as identif from Pelicula where timestampdiff(year, "2000-1-1", lanzamiento) > 13 and substring_index(substring_index(titulo, ":", 1), " ", -1) like "%VI%";



Llamemos presupuesto medio mensual de un departamento al resultado de dividir su presupuesto anual entre 12. 
Supongamos que se decide aumentar los presupuestos medios mensuales de todos los departamentos en un 7,32% a partir del mes de octubre inclusive. 
Para los departamentos cuyo presupuesto mensual medio es de más de 710€, hallar por orden alfabético el nombre de departamento, su presupuesto inicial, su incremento y 
su presupuesto anual total después del incremento. La dirección general, la primera, ha de resultar en 122169 (128676 es incorrecto) El último es Sector Servicios con 9162.675

| nombre_departamento | presupuesto_departamento | incremento    | nuevo_presupuesto |

+---------------------+--------------------------+---------------+-------------------+

| DIRECCION COMERCIAL |                    15000 |  274.50000000 |    15274.50000000 |

| DIRECCION GENERAL   |                   120000 | 2196.00000000 |   122196.00000000 |

| SECTOR INDUSTRIAL   |                    11000 |  201.30000000 |    11201.30000000 |

| SECTOR SERVICIOS    |                     9000 |  164.70000000 |     9164.70000000 |

+---------------------+--------------------------+---------------+-------------------+



select nombre_departamento, presupuesto_departamento, (presupuesto_departamento / 4) * 0.0732 as incremento, presupuesto_departamento + (presupuesto_departamento / 4) * 0.0732  as nuevo_presupuesto from t_departamentos where (presupuesto_departamento / 12) > 710 order by nombre_departamento;


Muestra solo el nombre (sin apellido), la fecha de nacimiento y de ingreso de aquellos empleados 
que llevaban la mitad de su vida o más en la empresa el 1 de enero de 2010.

+---------+------------+------------+

| nombre  | nacimiento | ingreso    |

+---------+------------+------------+

| CESAR   | 1949-10-11 | 1970-02-15 |

| JULIO   | 1950-08-10 | 1968-01-15 |

| MARCOS  | 1954-10-18 | 1976-03-18 |

| PILAR   | 1960-09-28 | 1979-01-22 |

| LAVINIA | 1962-02-26 | 1986-02-04 |

| ADRIANA | 1966-10-27 | 1987-03-01 |

| OCTAVIO | 1965-05-21 | 1986-09-10 |

| OTILIA  | 1969-10-25 | 1988-02-15 |

| GLORIA  | 1967-11-30 | 1988-02-14 |

+---------+------------+------------


select substring_index(nombre_empleado, ",", -1) as nombre, fecha_nacimiento_empleado as nacimiento, fecha_ingreso_empleado as ingreso from t_empleados where timestampdiff(year, fecha_nacimiento_empleado, fecha_ingreso_empleado) <= timestampdiff(year, fecha_ingreso_empleado, "2010-01-01");


Hallar, por orden alfabético, los nombres de los empleados tales que si se les da una gratificación de 100 € por hijo, 
el total de esta gratificación no supera a la décima parte del salario, siempre que reciban al menos 100€.

Total filas: 15

| nombre_empleado |

+-----------------+

| AGUIRRE, AUREO  |

| CAMPOS, ROMULO  |

| CAMPS, AURELIO  |

| GALVEZ, PILAR   |

+-----------------+

15 rows in set (0,02 sec)


select nombre_empleado from t_empleados where salario_base_empleado / 10 >  numero_hijos_empleado * 100 and numero_hijos_empleado > 0 order by nombre_empleado;


Hallar por orden alfabético los nombres y 
salarios de empleados de los departamentos 110 y 111 que o bien no tengan hijos o bien su salario por hijo supere a 1.000€


MUY IMPORTANTES LOS PARENTESIS CUANDO ESTA PRESENTE LA CLAUSULA OR

select nombre_empleado, salario_base_empleado from t_empleados where (codigo_departamento = 110 or codigo_departamento = 111) and (numero_hijos_empleado = 0 or salario_base_empleado / numero_hijos_empleado > 1000 ) order by nombre_empleado;


Obtener los nombres y sueldos de los empleados que hayan empezado a trabajar en la empresa el año 1997 en adelante o durante el año 1976, por orden alfabético

Total filas: 12


select nombre_empleado, salario_base_empleado from t_empleados where fecha_ingreso_empleado >= "1997-01-01" or year(fecha_ingreso_empleado) = 1976 order by nombre_empleado;


¿Cuántos clientes tenemos? (BD_PETICIONES)


select count(distinct codigo_cliente) from peticiones;


¿Cuáles son los diferentes clientes que tenemos?

select codigo_cliente from peticiones group by codigo_cliente;

¿Cuántas peticiones han sido confirmadas?

select count(exito) as exitos from peticiones where exito = 1;

¿Cuántas peticiones han sido descartadas?

select count(exito) as descartes from peticiones where exito = 0;


¿Cual es el tiempo medio de procesado empleado para las peticiones cuyos ficheros ocupan3MB o más?

select avg(tiempo_procesado) as tiempo_medio from peticiones where megabytes_ficheros >= 3;


¿Cual es el mayor tiempo de procesado empleado para las peticiones cuyos ficheros ocupan
2,5MB o menos?
Resultado 1 filas:

tiempo_mayor
3

select max(tiempo_procesado) as tiempo_mayor from peticiones where megabytes_ficheros <= 2.5;

¿A qué hora se realizó la consulta más reciente, cuyo tiempo de procesado es mayor que 3?

Resultado 1 fila:

Hora
12:02

select date_format(max(tiempo), "%H : %i") as reciente from peticiones where tiempo_procesado >3 and tipo_peticion like "%consulta%";


Muestra de cuándo es la petición más antigua, la petición con mayor peso en Mb y la petición con mayor tiempo de procesado, que no sea inserción ni consulta.

Resultado 1 fila:

MUCHO CUIDADO CON LOS ENUNCIADOS!!!

select min(tiempo) as Antigua, max(megabytes_ficheros) as Mb, max(tiempo_procesado) as tiempo_procesado from peticiones where tipo_peticion not like "%insercion%" and tipo_peticion not like "%consulta%";


¿Cuál es el mayor peso medio de los ficheros de una inserción, redondeado a dos decimales, siempre que dicha inserción tenga más de 1 fichero? Aclaración: 
si hay más de un fichero, no se puede saber su peso ya que megabytes_ficheros indica el peso total de todos los ficheros, por ello hay que estimarlo.
 Si hay tres ficheros y todo pesa 6, supondremos que cada uno pesa 2, pudiendo ser en realidad 4, 1 y 1.

Resultado 1 fila:

Mayor peso medio
3.17


select truncate(max(megabytes_ficheros / numero_ficheros), 2) as media from peticiones where tipo_peticion like "%insercion" and numero_ficheros > 1;



¿Cual es el tiempo medio de procesado empleado para las peticiones cuyos ficheros están pordebajo de los 200KB?

select avg(tiempo_procesado) as tiempo_medio from peticiones where (megabytes_ficheros * 1024) < 200;


¿Cuántas peticiones de cada tipo se han registrado? Muestra las más comunes primero.



| tipo_peticion | numero  |

+---------------+---------+

| insercion     | 1447524 |

| consulta      |  434418 |

| actualizacion |  144345 |

+---------------+---------+

3 rows in set (0,96 sec)


select tipo_peticion, count(*) as numero from peticiones group by tipo_peticion order by numero desc;


¿Cuántas peticiones han sido descartadas por mes? Ordena de enero a diciembre.

| mes  | descartadas |

+------+-------------+

|    1 |        2819 |

|    2 |        3164 |

|   12 |        5005 |

+------+-------------+

12 rows in set (0,39 sec)




select month(tiempo) as mes, count(*) as descartadas from peticiones where exito = 0 group by mes order by mes;



¿Cuántas peticiones han sido confirmadas por país? El país se conoce por los dos primeros caracteres del codigo_cliente. Mostrar los países con menos tráfico primero.

select left(codigo_cliente, 2) as pais, count(*) as numConfirmados from peticiones group by pais order by numConfirmados;

¿Cuánto tiempo de procesado ha empleado cada cliente?

select codigo_cliente, sum(tiempo_procesado) from peticiones group by codigo_cliente;

¿Cuántas peticiones han sido registradas por hora?


select hour(tiempo) as hora, count(tipo_peticion) as numero_peticiones from peticiones group by hora order by hora;

¿Cuántas peticiones han sido registradas por día de la semana?

select dayname(tiempo) as dia_semana, count(*) as "peticiones" from peticiones group by dia_semana;

#"Aqui tenemos otra solucion: "

select dayofweek(tiempo) as dia, count(*) as num_peticiones from peticiones group by dia order by dia;


¿Cuántos ficheros han sido insertados por mes, y cuánto espacio de almacenamiento han
consumido, en GB? Ordenar por mes y mostrar solo dos decimales.

Resultado 12 filas:

mes	num_ficheros	gigabytes
1	59032	17.82
2	63527	18.99
3	68964	20.57
4	88649	26.63
5	80780	24.33
6	85292	25.54
7	460590	137.88
8	550781	165.03
9	278663	83.22
10	93706	28.06
11	93511	28.14
12	102267	30.83


select month(tiempo) as mes, sum(numero_ficheros) as "num_ficheros", truncate(sum(megabytes_ficheros) / 1024, 2) as gigabytes from peticiones where tipo_peticion like "%insercion%" group by mes order by mes;



Cuál es el tamaño medio de las peticiones registradas, por cliente, así como la media de ficheros por petición? Limitar ambos resultados a dos decimales sin redondear.

 codigo_cliente | media_megas | media_ficheros |

+----------------+-------------+----------------+

| DE22222222B    |        0.42 |           1.39 |

| DE66666666F    |        0.43 |           1.39 |

| ES00000000L    |        0.43 |           1.39 |

| ES11111111A    |        0.42 |           1.40 |

| ES12345678M    |        0.42 |           1.39 |

| ES44444444D    |        0.42 |           1.40 |

| ES55555555E    |        0.42 |           1.39 |

| ES87654321N    |        0.42 |           1.39 |

| ES99999999H    |        0.42 |           1.39 |

| IT88888888G    |        0.42 |           1.39 |

| UK33333333C    |        0.43 |           1.39 |


select codigo_cliente, truncate(avg(megabytes_ficheros), 2) as "media_megas", truncate(avg(numero_ficheros) ,2) as "media_ficheros" from peticiones group by codigo_cliente;


Para cada cliente español, mostrar el mayor tiempo y tamaño máximo de ficheros de una petición, así como el menor tiempo y menor tamaño de ficheros.
Resultado 7 filas:

| codigo_cliente | max_t | max_f | min_t | min_f |

+----------------+-------+-------+-------+-------+

| ES00000000L    |     4 |  6.04 |     1 |     0 |

| ES11111111A    |     4 |  5.17 |     1 |     0 |

| ES12345678M    |     4 |  6.01 |     1 |     0 |

| ES44444444D    |     4 |  4.78 |     1 |     0 |

| ES55555555E    |     4 |   5.1 |     1 |     0 |

| ES87654321N    |     4 |  6.34 |     1 |     0 |

| ES99999999H    |     4 |  4.44 |     1 |     0 |

+----------------+-------+-------+-------+-------+

7 rows in set (13,21 sec)



select codigo_cliente, max(tiempo_procesado) as max_t, max(megabytes_ficheros) as max_f, min(tiempo_procesado) as min_t, min(megabytes_ficheros) as min_f from peticiones where left(codigo_cliente, 2) like "%ES%" group by codigo_cliente;


Para los clientes españoles, obtener el número de peticiones confirmadas, contando cada tipo de
petición por separado, así como el tiempo medio de procesado.


 tipo_peticion | tiempo_medio | aceptadas |

+---------------+--------------+-----------+

| consulta      |       1.1845 |    337740 |

| insercion     |       1.1795 |   1125469 |

| actualizacion |       1.1674 |    112442 |

+---------------+--------------+-----------+

3 rows in set (8,61 sec)

select tipo_peticion, avg(tiempo_procesado) as tiempo_medio, count(exito) as aceptadas from peticiones where exito = 1 and left(codigo_cliente, 2) like "%ES%" group by tipo_peticion;

¿Qué clientes y en qué meses han realizado menos de 4.000 peticiones con éxito? Mostrar los
resultados asociados a cada cliente en filas consecutivas, con los meses ordenados de menor a mayor.

Resultado 20 filas:

select codigo_cliente, month(tiempo) as mes, count(exito) as peticiones_exito from peticiones where exito = 1 group by mes, codigo_cliente  having peticiones_exito < 4000 order by codigo_cliente, mes;

Obtener los meses en los que ha estado activo cada cliente, junto con la fecha y hora de la primera y la última
petición registrada, ordenados por mes. Se considera que un cliente ha estado activo un mes si ha realizado al menos una petición.

select codigo_cliente, month(tiempo) as mes, max(tiempo) as ultima, min(tiempo) as primera from peticiones group by codigo_cliente, mes order by mes;

Las tarifas se aplican por petición, y todos los clientes las comparten. No se facturan ni las peticiones descartadas, ni los borrados, ni las consultas.

Coste base: 0,01€
Coste por tamaño: +0,005€ por MB
Coste por ficheros: +0,005€ por fichero
¿Cuál ha sido la facturación mensual de cada cliente? Mostrar los datos de cada mes en filas
consecutivas.

codigo_cliente | mes  | coste   |

+----------------+------+---------+

| ES00000000L    |    1 |  140.89 |

| ES87654321N    |    1 |   94.79 |

| ES11111111A    |    1 |  141.14 |

| ES12345678M    |    1 |  117.58 |

| 



select codigo_cliente, month(tiempo) as mes, round(sum(0.01 + (0.005 * megabytes_ficheros + 0.005 * numero_ficheros)), 2) as coste from peticiones where exito = 1 and tipo_peticion not like "%consulta%" and tipo_peticion not like "%borrado%" group by codigo_cliente, mes order by mes;

¿Qué clientes han realizado menos de 800 peticiones de tipo consulta sin éxito? Ordénalos por el número de fracasos de mayor a menor

select codigo_cliente, count(*) as fracasos from peticiones where exito = 0 and tipo_peticion like "%consulta%" group by codigo_cliente having fracasos < 800 order by fracasos desc;

Teniendo en cuenta las siguientes franjas horarias:
Franja 0: 00:00-03:59
Franja 1: 04:00-07:59
Franja 2: 08:00-11:59
Franja 3: 12:00-15:59
Franja 4: 16:00-19:59
Franja 5: 20:00-23:59
Por cliente, mostrar las franjas horarias en las que, a lo largo de todo el primer trimestre, ha
registrado un máximo 700 peticiones exitosas, o un mínimo de 10000.
Resultado 28 filas:

codigo_cliente	franja	peticiones
DE22222222B	0	1
DE22222222B	1	10
DE22222222B	2	650
DE22222222B	5	183
DE66666666F	0	17
DE66666666F	1	60
ES00000000L	0	35
ES00000000L	1	92
ES00000000L	4	10229
ES11111111A	0	29
ES11111111A	1	83
ES11111111A	4	10368
ES12345678M	0	23
ES12345678M	1	73
ES44444444D	0	5
ES44444444D	1	19
ES44444444D	5	328
ES55555555E	0	26
ES55555555E	1	79
ES87654321N	0	534
ES87654321N	2	15412
ES87654321N	3	13166
ES87654321N	5	632
IT88888888G	0	25
IT88888888G	1	49
UK33333333C	0	7
UK33333333C	1	34
UK33333333C	5	658

Solución sencilla
select codigo_cliente, truncate(hour(tiempo)/4,0) as franja, count(*) as peticiones from peticiones where month(tiempo) < 4 and exito group by codigo_cliente, franja having peticiones < 700 or peticiones > 10000 order by codigo_cliente, franja;

Solución fácil pero larga
select codigo_cliente,case
when date_format(tiempo,"%H:%i") between '00:00' and '03:59' then 0
when date_format(tiempo,"%H:%i") between '04:00' and '07:59' then 1
when date_format(tiempo,"%H:%i") between '08:00' and '11:59' then 2
when date_format(tiempo,"%H:%i") between '12:00' and '15:59' then 3
when date_format(tiempo,"%H:%i") between '16:00' and '19:59' then 4
when date_format(tiempo,"%H:%i") between '20:00' and '23:59' then 5
end as franja, count(exito) as peticiones from peticiones where exito= 1 and month(tiempo)<=3 group by codigo_cliente,franja having peticiones<700 or peticiones>10000 order by codigo_cliente;


Por cada combinación de mes, país y tipo de petición, obtener el número total de peticiones fallidas, 
así como el tiempo total invertido en procesarlas, siempre y cuando dicho total supere los 5 minutos 
( el tiempo en la tabla está indicado en segundos). Mostrar los resultados de cada país en filas consecutivas, 
y los mayores tiempos totales primero.


------+------+---------------+----------+--------+

| mes  | pais | tipo_peticion | fallidas | tiempo |

+------+------+---------------+----------+--------+

|    9 | DE   | insercion     |     1833 |   1927 |

|    8 | DE   | insercion     |     1393 |   1486 |

|   12 | DE   | insercion     |      582 |    619 |

|   11 | DE   | insercion     |      561 |    587 |

|    9 | DE   | consulta      |      557 |    586 |

|    6 | DE   | insercion     |      551 |    576 |


+------+------+---------------+----------+--------+

44 rows in set (0,95 sec)


select month(tiempo) as mes, left(codigo_cliente, 2) as pais, tipo_peticion, count(*) as fallidas, sum(tiempo_procesado) as tiempo from peticiones where not exito group by mes, pais, tipo_peticion having tiempo > 300 order by pais, tiempo desc;



¿Cuántos empleados ganan menos que la media?: 20


select count(*) from t_empleados where (select avg(salario_base_empleado) from t_empleados) > salario_base_empleado;

select nombre_departamento from t_departamentos where presupuesto_departamento = (select max(presupuesto_departamento) from t_departamentos);

select cliente, max(max_fac) from  (select num, cliente, sum(precio_unidad * unidades) as max_fac from facturas group by cliente, num) as Factua_mas_alta group by cliente order by cliente;


select cliente, sum(precio_unidad * unidades) - (select count(distinct num) * 0.10 from facturas) as precio_descuento from facturas group by cliente;