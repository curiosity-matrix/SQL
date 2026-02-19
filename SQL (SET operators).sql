									/*  SET operators	*/
											-- Rule-1 ->  order by clause at the end of complete query
											-- Rule-2 -> no of columns must be same in each query
                                            -- Rule-3 -> data types of each column must be same
                                            -- Rule-4 -> order of col in each query must be same wrt data type
                                            -- Rule-5 -> ALIAS only in 1st query i.e (1st query is responsible for col name)
                                            -- Rule-6 -> correct columns mapping
                                    
								/* UNION operator -> returns all distinct rows from both the queries */

-- combine the data from emp and cust into one tb
select e.firstname, e.lastname
from salesdb.employees as e

union

select c.firstname, c.lastname
from salesdb.customers as c;



									/* UNION operator -> returns all rows from both the queries including duplicates */
                                    
-- combine the data from emp and cust into one tb including duplicates
select c.firstname, c.lastname
from customers as c
union all
select e.firstname, e.lastname
from employees as e;



									/* EXCEPT -->return rows from first query not present in second query  (minus)  */
         
use salesdb;

-- find the employees who are not customers at the same time
select distinct e.firstname, e.lastname
from employees as e
left join customers as c						-- except keyword is used in SQL server		-- using LEFT join
on e.firstname=c.firstname
	and e.firstname=c.lastname
where c.firstname is null or c.lastname is null;

																			-- using NOT EXIST
select e.firstname,e.lastname
from salesdb.employees as e								
where not exists (
select c.firstname,c.lastname
from salesdb.customers as c
where e.firstname=c.firstname
	and e.lastname=c.lastname
);



														


											/* INTERSECTION op --> return only common values from both the table  */
                                            
-- find emp who are also cust
select e.firstname, e.lastname
from employees as e
inner join customers as c								-- intersection in sql server 
on e.employeeid=c.customerid
where e.firstname = c.firstname or e.lastname = c.lastname;




				/* TASK -> orders are stored in separate tables (orders and ordersarchieve). 
                combine all orders into one report without duplicates  */


(select
'orders' as sourcetable, 
orderid,
productid,
customerid,
salespersonid,
orderdate,
shipdate,
orderstatus,
shipaddress,
billaddress,
quantity,
sales,
creationtime 
from salesdb.orders
union								
select 
'orders_archive' as sourcetable,
orderid, 
productid,
customerid,
salespersonid,
orderdate,												--  👉🏻✔️
shipdate,
orderstatus,
shipaddress,
billaddress,
quantity,
sales,
creationtime
from salesdb.orders_archive)
order by orderid;


select 
'orders' as sourceorder,
o1.orderid,
o1.productid,
o1.customerid,
o1.salespersonid,
o1.orderdate,
o1.shipdate,
o1.orderstatus,
o1.shipaddress,
o1.billaddress,
o1.quantity,
o1.sales,
o1.creationtime 
from orders as o1
left join orders_archive
on o1.orderid=orders_archive.orderid
union
select 
'orders_archive' as sourceorder,
oa.orderid, 
oa.productid,
oa.customerid,
oa.salespersonid,
oa.orderdate,
oa.shipdate,
oa.orderstatus,
oa.shipaddress,													
oa.billaddress,
oa.quantity,
oa.sales,
oa.creationtime
from orders_archive as oa
right join orders
on orders.orderid=oa.orderid
order by orderid;



