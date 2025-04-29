/*
 1.	Muestra el número de empleados por oficina, ordenadas de mayor a menor.
 */

select offices.officeCode, offices.addressLine1, count(*) as numEmpleados
from offices
         inner join employees
                    on offices.officeCode = employees.officeCode
group by offices.officeCode, offices.addressLine1
order by numEmpleados desc;


/*
 2.	Muestra el número de productos distintos que ha pedido cada cliente en todos sus pedidos. (COUNT DISTINCT)
 */


select customers.customerNumber, customers.customerName, count(distinct productCode) as numProductosDistintos
from customers
         inner join orders on customers.customerNumber = orders.customerNumber
         inner join orderdetails on orders.orderNumber = orderdetails.orderNumber
group by customers.customerNumber, customers.customerName;


/*
3.	Muestra el número de productos que existen por línea de producto.
 */


select productlines.productLine, count(*) as numProductos
from productlines
         inner join products on productlines.productLine = products.productLine
group by productlines.productLine;

/*
 4.	Muestra la cantidad total de productos vendidos por línea de producto.
 */

select productlines.productLine, sum(quantityOrdered) as productosLineaVendidos
from productlines
         inner join products on productlines.productLine = products.productLine
         inner join orderdetails on products.productCode = orderdetails.productCode
group by productlines.productLine
order by productosLineaVendidos;


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

/*
 6.	Muestra los 5 clientes que más pagos hayan realizado y cuántos pagos han realizado.
 */

select c.customerNumber, c.customerName, count(p.checkNumber) as numPagos
from customers c
         join payments p on c.customerNumber = p.customerNumber
group by c.customerNumber, c.customerName
order by numPagos desc
limit 5;

/*
 7.	Muestra para cada cliente de cuántas líneas de producto han comprado productos.
 */