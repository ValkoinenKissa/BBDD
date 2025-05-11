/*
 1.	Muestra el número de empleados por oficina, ordenadas de mayor a menor.
 */

select o.officeCode, o.city, count(*) as numEmpleados
from offices o
         inner join employees e
                    on o.officeCode = e.officeCode
group by o.officeCode, o.city
order by numEmpleados desc;

/*
 2.	Muestra el número de productos distintos que ha pedido cada cliente en todos sus pedidos. (COUNT DISTINCT)
 */


select c.customerNumber, c.customerName, count(distinct productCode) as numProductosDistintos
from customers c
         inner join orders o on c.customerNumber = o.customerNumber
         inner join orderdetails od on o.orderNumber = od.orderNumber
group by c.customerNumber, c.customerName;


/*
3.	Muestra el número de productos que existen por línea de producto.
 */

SELECT products.productLine, count(productCode) as NumProductos
FROM `products`
GROUP BY productLine;

/*
 4.	Muestra la cantidad total de productos vendidos por línea de producto.
 */

select p.productLine, sum(o.quantityOrdered) as numProductosVendidos
from products p
         inner join orderdetails o on p.productCode = o.productCode
group by p.productLine;

/*
 5.	Muestra el número de pedidos y el precio medio de todos los pedidos que
    hayan realizado los clientes de cada empleado.
 */

select e.employeeNumber,
       e.firstName,
       count(o.orderNumber) as numPedidos,
       avg(ot.totalPedido)  as totalPedido
from employees e
         join customers c on c.salesRepEmployeeNumber = e.employeeNumber
         join orders o on o.customerNumber = c.customerNumber

         join (select orderdetails.orderNumber,
                      sum(orderdetails.quantityOrdered * orderdetails.priceEach) as totalPedido
               from orderdetails
               group by orderNumber) ot on ot.orderNumber = o.orderNumber
group by e.employeeNumber, e.firstName
order by e.employeeNumber;

SELECT A.employeeNumber,
       A.lastName,
       A.firstName,
       COUNT(A.orderNumber) AS numeroPedidos,
       AVG(A.subtotal_Aux)  AS precioMedioPedidos
FROM (SELECT employees.employeeNumber,
             employees.lastName,
             employees.firstName,
             orders.orderNumber,
             SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS subtotal_Aux
      FROM employees
               LEFT JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber
               LEFT JOIN orders USING (customernumber)
               LEFT JOIN orderdetails USING (orderNumber)
      GROUP BY employees.employeeNumber, employees.lastName, employees.firstName, orders.orderNumber) A
GROUP BY A.employeeNumber, A.lastName, A.firstName;

/*
 6.	Muestra los 5 clientes que más pagos hayan realizado y cuántos pagos han realizado.
 */

select c.customerName, count(p.checkNumber) as numPagos
from customers c
         join payments p on c.customerNumber = p.customerNumber
group by c.customerName
order by numPagos desc
limit 5;


SELECT customers.customerName, COUNT(payments.customerNumber) AS NumPagos
FROM customers
         LEFT JOIN payments USING (customerNumber)
GROUP BY customers.customerNumber
ORDER BY NumPagos DESC
LIMIT 5;

/*
 7.	Muestra para cada cliente de cuántas líneas de producto han comprado productos.
 */

select c.customerName, count(distinct p.productLine) as numLineasCompradas
from customers c
         left join orders o on c.customerNumber = o.customerNumber
         left join orderdetails od on o.orderNumber = od.orderNumber
         left join products p on od.productCode = p.productCode
group by c.customerName;


SELECT customers.customerName, COUNT(DISTINCT products.productLine) AS NumLineasProducto
FROM customers
         LEFT JOIN orders USING (customerNumber)
         LEFT JOIN orderdetails USING (orderNumber)
         LEFT JOIN products USING (productCode)
GROUP BY customers.customerName;


/*
 8.	Muestra el número de pedidos realizados en los que aparece cada línea de producto.
 */

select p.productLine, count(distinct orderNumber) as numPedidosRealizados
from products p
         join orderdetails od
              on p.productCode = od.productCode
group by p.productLine;


SELECT products.productLine, COUNT(DISTINCT orderdetails.orderNumber) AS NumPedidos
FROM products
         LEFT JOIN
     orderdetails USING (productCode)
GROUP BY products.productLine;