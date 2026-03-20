											/* MIN() function and MAX() function*/
									-- return the lowest value within the window
                                    -- reuturns the highest value within the window
                                    
-- find the highest sales for each product

select o.productid, p.product, max(o.sales) over(partition by o.productid) as hishest_sales_per_prod
from salesdb.orders as o
inner join salesdb.products as p
on o.productid = p.productid;


-- find the highest and lowest sales across all orders and the highest and lowest sales for each product.
-- aditionally provide details such as orderid and orderdate
select productid, sales, orderid, orderdate,
max(sales) over() as higest_order_sales,
min(sales) over() as lowest_order_sales,
max(sales) over(partition by productid) as highest_sales_per_product,
min(sales) over(partition by productid) as lowest_sales_per_product
from salesdb.orders;

																										
-- show the employees who have highest salaries
select *
from
(
select employeeid, firstname, lastname, salary, max(salary) over() as highest_sal
from salesdb.employees
) as tb
where salary = highest_sal;

																										/* write */
-- calculate the deviation of each sale from both the min and max sales amounts.
select sales,
min(sales) over() as min_sales,
max(sales) over() as max_Sales,
sales - min(sales) over() as deviation_wrt_minSales,						-- high - low
max(sales) over() - sales as deviation_wrt_maxSales
from salesdb.orders


