											/* window aggregate functions */
        
							/* count function		(return no. of rows in a window) */
    
-- find total no. of orders
select count(*) as tot_order			-- include null
from orders;

-- find total no. of orders
-- additionally provide details such as orderid, orderdate
select orderid, orderdate,
count(*) over()
from salesdb.orders;

-- find total no. of orders
-- find tot no. of orders for each customer
-- additionally provide details such as orderid, orderdate
select customerid, orderid, orderdate,
count(*) over(),
count(*) over(partition by customerid)
from salesdb.orders;

-- find tot no. of customers and additionally provide all details, also tot no. of scores for the customer
select *,count(*) over () as no_of_cust,
count(score) over() as no_of_score
from salesdb.customers ;


		/* checking for duplicates */
-- check whether the table 'orders' contain any duplicate rows
select orderid,count(*)												-- usign group by and having clause
from salesdb.orders
group by orderid
having count(*)>1;

-- or 

select orderid,count(*) over(partition by orderid) as check_duplicates			-- using window function
from salesdb.orders	;			

-- in different database (orders_archieve)

select orderid,count(*) 					                		-- using group by and having clause
from salesdb.orders_archive
group by orderid
having count(*)>1;


select orderid, 
case when count(*) over(partition by orderid) >1 then count(*) over(partition by orderid) 			-- this will give non
end as duplicates																				-- duplicates as null
from salesdb.orders_archive;

select *
from(
select orderid,count(*) over(partition by orderid) as duplicates
from salesdb.orders_archive) as t1
where duplicates>1



