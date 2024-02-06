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


select producto, count(producto) as lineas, sum(unidades) as unidades, avg(unidades) as media from facturas group by producto order by media;

select substring(cliente, 1, length(cliente) / 2) as cod_cli, producto, avg(precio_unidad) as media, count(unidades) as num from facturas where precio_unidad >= 4 group by cod_cli, producto order by producto, cod_cli;

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


select concat(right(cliente, 2), left(cliente, 2)) as cod_cli, sum(unidades * precio_unidad) as total, count(*) as num from facturas where weekday(fecha_fac) between 3 and 6 group by cod_cli order by total desc limit 3;


select cliente, day(fecha_fac) as dia, count(*) as numero, sum(precio_unidad * unidades) as coste from facturas where length(cliente) <= 14 and precio_unidad > 0.50 group by dia, cliente order by dia;



select producto, count(producto) as lineas, sum(unidades) as unidades, avg(unidades) as media from facturas group by producto order by media limit 3;



select substring(cliente, 1, length(cliente) /2) as cod_cli, producto, avg(precio_unidad) as media, count(unidades) as num from facturas where precio_unidad >= 4 group by producto, cod_cli order by producto, cod_cli;

Selecciona la inicial del nombre con un punto y el apellido separado por espacio y 
la fecha de nacimiento con el formato 00 de January de 90 de 
aquellos que viven en una ciudad donde viven menos de 3 personas de la base de datos.
Resultado 4 filas:
persona	fechaNac
C. Jimemenz	28 de February de 76
J. Sanz	16 de June de 91
A. Beltran	30 de November de 00
A. Gomez	23 de December de 98


select concat(left(nombre, 1), ".", apellidos) as Persona, date_format(fnac, " %d de %M de %y ") from persona where ciudad in (select ciudad from persona group by ciudad having count(ciudad) < 3);

Selecciona el código, el rango y la sanción de las infracciones muy graves cuyo importe es igual o superior al doble de la que tiene mayor cuantía de las graves.
Solución 3 filas:
codigo	rango	importe
10	Muy Grave	600
11	Muy Grave	600
18	Muy Grave	1500


select codigo, rango, importe from sanciones where importe >= (select max(importe) *2  from sanciones where rango like "Grave");


Selecciona el nombre y el apellido de las personas que son alumnos de grupos con un solo alumno:
Resultado 4 filas:

nombre	apellidos
Ana	Beltran
Belen	Figar
Sarai	Agbar
Alberto	Zara

select nombre, apellidos from persona where id in (select id from alumno where idg in (select id from grupo group by id having count(id) = 1));


Selecciona la matrícula de los coches de marca KIA que tienen
 pólizas de seguro a todo riesgo sin franquicia y su mes de alta de la póliza es noviembre.
Solución 2 filas:
matricula
1000CNY
1000CPB

select matricula from automoviles where marca like "KIA" and matricula in (select matricula from polizas where descripcion like "Todo riesgo sin franquicia" and month(fechaAlta) = 11);


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


De la tabla FACTURAS visualizar el nombre del producto y el valor total de las unidades pedidas bajo el título PRECIO_TOTAL y ajustando el precio al entero siguiente. 
Se tendrá en cuenta que únicamente se seleccionarán aquellas filas que tengan 15 o menos unidades y se ordenarán ascendentemente por el PRECIO_TOTAL. Pista: Función Ceil.

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