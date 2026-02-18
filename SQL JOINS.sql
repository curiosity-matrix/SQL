									/* NO JOIN */

-- retreive all data from customers and orders in two different results

select *
from customers;

select *
from orders;



									/* INNER JOIN --> RETURN ONLY MATCHING ROWS FROM BOTH TABLE*/ 

-- get all customers along with their orders, but only for customers who have placed an order

select *
from customers
INNER JOIN orders						-- by default its inner join if you don't specify type of join
on customers.id=orders.customer_id;
-- better to see only required columns
select id,first_name,order_id,order_date,sales
from customers
inner join orders
on customers.id=orders.customer_id;

				-- use ALIAS 

select c.id,c.first_name,o.order_id,o.order_date,o.sales
from customers as c
inner join orders as o
on c.id=o.customer_id;




									/* Left join --> returns all rows from left tb and matching rows from right tb */
                                            
-- get all customers along with their orders, including those without orders

select c.id,c.first_name,o.order_id,o.sales
from customers as c
left join orders as o
on c.id=o.customer_id;



									/* Right join --> return all rows from right table and only the matching rows from left table */
                                    
		-- get all customers along with their orders, including orders without matching customers

select c.id,c.first_name,o.order_id,o.sales
from customers as c
right join orders as o
on c.id=o.customer_id;

					-- same using left join

select c.id, c.first_name,o.order_id,o.sales
from orders as o
left join customers as c
on o.customer_id=c.id;
                                    
                                    
                                    
                                    
                                    /* FULL JOIN  is not directly in MYSQL - works on SQL server*/
                                    -- left join + right join + union(no duplicates)
                                    
-- get all customers and all orders, even if there is no match

(select c1.id,c1.first_name,o1.order_id,o1.sales,o1.customer_id
from customers as c1
left join orders as o1
on c1.id=o1.customer_id)

union 

(select c2.id,c2.first_name,o2.order_id,o2.sales,o2.customer_id
from customers as c2
right join orders as o2
on c2.id=o2.customer_id);




								/* LEFT ANTI JOIN --> return rows from left table that dont match to rows in right table */

-- get all customers who haven't placed any order
select *
from customers as c
left join orders as o
on c.id = o.customer_id
where o.customer_id is null;



-- get all orders without matching customers
select*
from customers as c
right join orders as o
on c.id=o.customer_id
where c.id is null;

-- same using left join
select *
from orders as o 
left join customers as c
on o.customer_id=c.id
where c.id is null;




										/* FULL ANTI JOIN --> return rows that dont match in either of the tables  */

-- /* find customers without orders and orders wihout customers
(select *
from customers as c1
left join orders as o1
on c1.id=o1.customer_id
where o1.customer_id is null)

union

(select *
from customers as c2
right join orders as o2
on c2.id=o2.customer_id
where c2.id is null);



-- get all customers along with their orders, but only for customers who have placed an order (without using inner join)
                                
select *
from customers as c
left join orders as o 
on c.id=o.customer_id
where o.customer_id is not null;



								/* CROSS JOIN --> retrun all possible combination of rows */
select *
from customers
cross join orders as o;