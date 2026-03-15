								/* SUM() function */
						-- reurns sum of values(numbers) in each window ignoring nulls

-- find the total sales across all orders and the total sales for each product additionally provide details as orderid and orderdate.
select orderid, orderdate, sales, 
sum(sales) over(partition by orderid) as total_Sales,
sum(sales) over(partition by orderid) as sales_by_product
from salesdb.orders;

-- in orders_archieve
select orderid, orderdate, productid sales, 
sum(sales) over() as total_Sales,
sum(sales) over(partition by productid) as sales_by_product
from salesdb.orders_archive;


-- find the percentage contribution of each product's sales to the total sales
select orderid, productid, sales, 
sum(Sales) over() as total_sales,
round((cast(sales as float) / sum(Sales) over())*100,2) as percentage_calc
from salesdb.orders;


						 /* AVG() function */
					-- returns average of values within function

-- return the avg sales for each product
			-- first we need to check for null            
select productid, sales
from salesdb.orders
where sales is null;
-- if ther is null need to be handled
select productid, sales, avg(coalesce(sales,0)) as handled_null_avg_sales
from salesdb.orders;

																								
-- find the average sales across all orders
-- and find the average sales for each products
-- additionally provide details such as orderid, orderdate
select orderid, orderdate, productid, sales, 
round(avg(coalesce(sales,0)) over(),2) as order_avg_sales,
round(avg(coalesce(sales,0)) over(partition by productid),2) as avg_Sales_by_product
from salesdb.orders;


-- find the avg scores of customers 
-- addiitionally provide details such as customerid and last name
		-- check for null in scores
select score, coalesce(Score,'miss') as chk_null
from customers;
		-- execution
select customerid, lastname, coalesce(score,'miss'),
round(avg(coalesce(score,0)) over (),2) as avg_score_of_cust
from salesdb.customers;


-- find all orders where sales are higher than the average sales across all orders
select *
from
(select *,
avg(coalesce(Sales,0)) over() as avg_sales
from salesdb.orders
) as t1
where sales>avg_sales


