								/* window basics OR ANALYTICAL FUNCTIONS */
                                

-- find tot sales across all orders
 select sum(sales)
 from salesdb.orders;
 
 -- find tot sales for each products
 select productid, sum(Sales)
 from salesdb.orders
 group by productid;
 
 -- find tot sales for each product with additional details like orderid, orderdate
 select productid,orderid,orderdate, sum(sales)
 from salesdb.orders
 group by productid, orderid, orderdate	;							-- X (wrong)
 
	/* using window function */
    -- over()																				/* PARTITTION BY */

select productid, orderid, orderdate, sum(sales) over( partition by productid) as tot_sales
from salesdb.orders;


-- find the total sales across all orders
-- finf total sales fro each product
-- additionally provide details such as orderid, ordderdate

select productid, orderid, orderdate,
sum(sales) over() as order_total_sales,
sum(sales) over( partition by productid) as product_total_sales
from salesdb.orders;



-- find the total sales across all orders
-- finf total sales fro each product
-- find total sales for each combination of product and order status
-- additionally provide details such as orderid, ordderdate

select productid, orderid, orderdate, orderstatus,
sum(sales) over() as order_total_sales,
sum(sales) over(partition by productid, orderstatus) as ToatalSalesForProductndOrderStatus,
sum(sales) over( partition by productid) as product_total_sales
from salesdb.orders;


																									/* RANK */
																								
-- rank each order based on their sales from highest to lowest and provide details orderid, orderdate
select orderid, orderdate, sales, rank() over(  order by sales desc)
from salesdb.orders;



					/* using Frames */
select orderid, orderdate, orderstatus, sales,
sum(sales) over(partition by orderstatus order by orderdate
rows between unbounded preceding and current row)as tot_sales_pf_prev2
from orders;


-- window fuctiono can aslo be used with order by
select orderid, orderdate, orderstatus, sales ,
sum(sales) over(partition by orderstatus )as tot_sales_pf_prev2
from orders
order by sum(sales) over(partition by orderstatus )		;				-- or desc


-- rank the customers based on their total sales
select customerid,tot_sales,rank() over(order by tot_Sales desc)
from ( select customerid, sum(sales) as tot_sales
from orders
group by customerid) as t1		;

-- or

select customerid, sum(Sales) as tot_sales,
rank() over(order by sum(sales) desc)
from orders
group by customerid

