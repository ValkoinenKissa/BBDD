A) Slecciona el identificador, el nombre y el precio sobre los productos de los fabricantes Xiaomi o Samsung, con precios por debajo de 2000€, que esten disponibles y organizados por identificación y nombre.
select id_producto,nombre_producto, precio from producto where (fabricante like "Xiaomi" or fabricante like "Samsung") and precio < 2000 and stock like "S" order by id_producto,nombre_producto;
+-------------+---------------------+--------+
| id_producto | nombre_producto     | precio |
+-------------+---------------------+--------+
|        4707 | Xiaomi-Dokjopr55    | 794.93 |
|        7520 | Samsung-PKhqplpu479 | 274.65 |
+-------------+---------------------+--------+
total 2 filas

B) Selecciona el identificador, metodo de pago y la fecha del pedido de aquellos pedidos que se realizaron en Julio o Marzo, que estene entregados y que se entrgaron hace mas de 3 años. Usa este formato de fecha(El 23 de March del 1999).
select id_pedido as ID, metodo_pago as "Metodo de pago", date_format(fecha_pedido,"El %d de %M del %Y") as Fecha from pedido where (month(fecha_pedido) = 7 or month(fecha_pedido) = 3) and estado like "Entregado" and timestampdiff(YEAR,fecha_pedido,curdate()) > 3;
+------+-----------------+-------------------------+
| ID   | Metodo de pago  | Fecha                   |
+------+-----------------+-------------------------+
| 9517 | Bizum           | El 16 de March del 2015 |
| 9292 | Contra rembolso | El 30 de July del 2013  |
+------+-----------------+-------------------------+
total 2 filas

C)
Selecciona el nombre del empleado sin el apellido, con la inicial siempre en minuscula y la raiz cuadrada de el salario de los empleados redondeado al entero más cercano, sumado al salario base del empleado como Incremento_salario de aquellos empleados cuya longitud del apellido sea menor o igual a 10 caracteres y su nombre termine en s o en n ordenado por el nombre del empleado.

select substring_index(lower(substring(nombre, 1)), " ", 1) as Nombre, round(sqrt(salario), 2) + salario as Incremento_salario from empleado where length(substring_index(nombre, " ", -1)) <= 10 and substring_index(nombre, " ", 1) like "%s" or substring_index(nombre, " ", 1) like "%n";

+--------+--------------------+
| Nombre | Incremento_salario |
+--------+--------------------+
| simón  |             1631.9 |
| carlos |            4269.85 |
| carlos |            4320.23 |
| juan   |            4009.83 |
| juan   |            1550.88 |
+--------+--------------------+
total 5 filas

D) 

Seleccionar el cif agrupado por las diferentes empresas de paqueteria (segun sus cif), tambien contar la cantidad de pedidos que tramita cada agencia y mostar como "cantidad de pedidos". 
Tambien mostar la sección del CIF comprendida entre la posición equivalente al número de caracteres del id_cliente hasta la posición equivalente de la raiz cuadrada del 
total de caracteres de todos los datos identificativos de la tabla, guardar esta columna como CIF_intermedio, mostrar las agencias de paqueteria que hayanm tramitado mas de 5 pedidos, y ordenar por la cantidad de pedidos


select CIF, count(distinct id_pedido) as cantidad_pedidos, substring(CIF, length(id_cliente), sqrt((length(concat(id_pedido, id_cliente, id_producto))))) as CIF_Intermedio from compra group by CIF, CIF_Intermedio having cantidad_pedidos > 5 order by cantidad_pedidos;

+-----------+------------------+----------------+
| CIF       | cantidad_pedidos | CIF_Intermedio |
+-----------+------------------+----------------+
| A56251941 |                6 | 251            |
| P35052597 |                6 | 052            |
| I22187016 |                7 | 187            |
| T73203614 |                7 | 203            |
| N54939601 |                8 | 939            |
| F83148409 |               10 | 148            |
| P73410827 |               11 | 410            |
| T61049099 |               16 | 049            |
+-----------+------------------+----------------+
8 rows in set (0,04 sec)

E)

Selecciona el dominio del correo electronico del usuario, y el usuario hasta el numero de carctares totales del dominio del correo electronico, menos los caracteres del id_cliente
luego junta el id del cliente con el correo electronico y formatealo como se muestra en la tabla, muestra los datos de auqellas filas, cuya longitud del usuario sea par.


select substring_index(correo, "@", -1) as dominio, left(usuario, length(substring_index(correo, "@", 1)) - length(id_cliente)) as nom_usuario, concat(id_cliente,"@" ,substring_index(correo, "@", -1)) as mail from cliente where length(usuario) % 2 = 0; 

+-------------+-------------+------------------+
| dominio     | nom_usuario | mail             |
+-------------+-------------+------------------+
| hotmail.com | Tdzj        | 1816@hotmail.com |
| gmail.com   | Svgx        | 1852@gmail.com   |
| gmail.com   | Qdlo        | 2715@gmail.com   |
| icloud.com  | Ngvs        | 2852@icloud.com  |
| icloud.com  | Vbyh        | 2964@icloud.com  |
| gmail.com   | Qpgx        | 3391@gmail.com   |
| outlook.com | Rplv        | 4360@outlook.com |
| hotmail.com | Hwbv        | 4521@hotmail.com |
| gmail.com   | Iyjz        | 4714@gmail.com   |
| icloud.com  | Eect        | 4834@icloud.com  |
|..............................................|
| outlook.com | Heuu        | 9525@outlook.com |
| hotmail.com | Pxqb        | 9641@hotmail.com |
| outlook.com | Bpap        | 9643@outlook.com |
| outlook.com | Vuek        | 9797@outlook.com |
+-------------+-------------+------------------+
33 rows in set (0,00 sec)


F)

Selecciona el id del pedido, el metodo de pago con el que se realizo  y la fecha de los pedidos que fueron enviados hace menos de 200 días desde hoy, 
pero añadiendo 1 mes y 5 días a la fecha de inicio, en el formato mes-día (año), como se muestra en la tabla.

select id_pedido, metodo_pago, date_format(date_add(date_add(fecha_pedido, interval 1 month), interval 5 day), "%m-%d (%Y)") as fecha_pedido from pedido where timestampdiff(day, fecha_pedido, curdate()) < 200;

+-----------+------------------------+--------------+
| id_pedido | metodo_pago            | fecha_pedido |
+-----------+------------------------+--------------+
|      3210 | Tarjeta credito/debito | 11-08 (2023) |
|      2286 | Transferencia bancaria | 09-29 (2023) |
+-----------+------------------------+--------------+
2 rows in set (0,01 sec)

G)

Obtener el nombre y el salario del empleado que tienen el salario más alto y restale el precio de la consola más barata de entre las mas baratas de cada fabricante de su salario original.

select nombre, salario - (select min(precioBajo) as consolaMasBarata from  (select fabricante, min(precio) as precioBajo from producto where id_categoria in (select id_categoria from categoria where nombre_categoria like "Consolas") group by fabricante) as tabla) as salarioFinal from empleado where salario = (select max(salario) from empleado);


+----------------+--------------+
| nombre         | salarioFinal |
+----------------+--------------+
| Angela Navarro |      3914.23 |
+----------------+--------------+
total 1 fila