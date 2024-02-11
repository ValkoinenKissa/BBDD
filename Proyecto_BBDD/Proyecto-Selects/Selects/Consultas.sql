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


select CIF, count(distinct id_pedido) as cantidad_pedidos, substring(CIF, length(id_cliente), sqrt((length(id_pedido)))) as CIF_pedido from compra group by CIF, CIF_pedido having cantidad_pedidos > 5;

Mostrar la sección del CIF comprendida entre la 
posición equivalente al número de caracteres del id_cliente hasta la posición equivalente de la division del numero de caracteres del id_pedido entre la raiz cuadrada de la longitud del propio cif