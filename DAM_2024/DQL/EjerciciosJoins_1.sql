/*
 Muestra los 5 empleados que más clientes hayan conseguido (JOIN, GROUP BY, ORDER BY, LIMIT)
 */

select employees.employeeNumber,
       employees.lastName,
       employees.firstName,
       count(customers.customerNumber) as Nclientes
from employees
         inner join customers on employees.employeeNumber = customers.salesRepEmployeeNumber
group by employees.employeeNumber, employees.lastName, employees.firstName
order by Nclientes desc
limit 5;

/*
 Muestra los 5 empleados que más dinero hayan generado con los pagos de sus clientes (JOIN, GROUP BY, ORDER BY, LIMIT)
 */

select employees.employeeNumber,
       employees.lastName,
       employees.firstName,
       sum(amount) as totalVentas
from employees
         inner join customers on employees.employeeNumber = customers.salesRepEmployeeNumber
         inner join payments on customers.customerNumber = payments.customerNumber
group by employees.employeeNumber, employees.lastName, employees.firstName
order by totalVentas desc
limit 5;
;


/*
 Muestra los productos, su precio de compra, la cantidad de producto vendido y su precio unitario. (JOIN)
 */

select products.productCode,
       products.productName,
       products.buyPrice,
       quantityOrdered as cantidadPedida,
       orderdetails.priceEach
from productlines
         inner join products on productlines.productLine = products.productLine
         inner join orderdetails
                    on products.productCode = orderdetails.productCode
where products.productCode = 'S10_1678'
group by productName;


/*
 Muestra los productos, su precio de compra, la cantidad de producto vendido, su precio, su beneficio unitario
 (beneficio = precio de venta – precio de compra) y el beneficio total de cada compra. (JOIN, operaciones con columnas)
 */

select products.productCode,
       products.productName,
       products.buyPrice,
       orderdetails.priceEach,
       (orderdetails.priceEach - products.buyPrice)    as unitProfit,
       orderdetails.quantityOrdered,
       sum(orderdetails.priceEach - products.buyPrice) as totalProfit
from productlines
         inner join products
                    on productlines.productLine = products.productLine
         inner join
     orderdetails on products.productCode = orderdetails.productCode
where products.productCode = 'S10_1678'
group by products.productCode, productName, buyPrice;


/*
 Muestra el beneficio total de la compañía por cada producto de mayor a menor. (JOIN, operaciones con columnas, GROUP BY, ORDER BY)
 */


select products.productCode, products.productName, sum((priceEach - buyPrice) * quantityOrdered) as totalProfit
from productlines
         inner join products
                    on productlines.productLine = products.productLine
         inner join orderdetails on products.productCode = orderdetails.productCode
         inner join orders on orderdetails.orderNumber = orders.orderNumber
group by products.productCode, productName
order by totalProfit desc;