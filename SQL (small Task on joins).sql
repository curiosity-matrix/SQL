										/* TASK ON JOINS */
 
/*  using salesdb, retrieve a list of all orders, along with the related customer, product, adn emp details
fro each order dispaly;
orderID, Customer's name, product name, sales, price, salesperson's name		*/

-- selecting a db
use salesdb;

-- start step by step by checking output   		don't write full query directly at once
select o.orderid,o.sales,c.firstname as CustomerFirstName, c.lastname as CustomerLastName, p.product,p.price,e.firstname as SalespersonFirstName, e.lastname as SalesperesonLastName
from salesdb.orders as o 
left join salesdb.customers as c 
on o.customerid=c.customerid								-- join on same col name ( observe carefully ) using ER diagram
left join salesdb.products as p
on o.productid=p.productid
left join employees as e
on o.salespersonid=e.employeeid


