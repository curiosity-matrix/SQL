						/* AGGREGATE FUNCTIONS */


/* COUNT(*) */
-- find tot no of orders
select count(*) as tot_no_of_orders
from mydatabase.orders;

-- find the tot sales of all orders
select sum(sales) as tot_sales
from mydatabase.orders;
                        
-- find avg sales of all orders
select avg(sales) as avg_sales
from mydatabase.orders;

-- find highest sales of all orders
			-- using aggregated function - max()
            select max(sales)
            from mydatabase.orders;
            
            -- using order by clause
            select sales
            from mydatabase.orders
            order by sales desc
            limit 1;
            

-- find the lowest sales of all orders
			-- using min()
            select min(sales) as lowest_sales
            from mydatabase.orders;
            
            -- using order by
            select sales as lowest_sales
            from mydatabase.orders
            order by sales asc
            limit 1;
            
            
-- combining all
						/* AGGREGATE FUNCTIONS */


/* COUNT(*) */
-- find tot no of orders
select count(*) as tot_no_of_orders
from mydatabase.orders;

-- find the tot sales of all orders
select sum(sales) as tot_sales
from mydatabase.orders;
                        
-- find avg sales of all orders
select avg(sales) as avg_sales
from mydatabase.orders;

-- find highest sales of all orders
			-- using aggregated function - max()
            select max(sales)
            from mydatabase.orders;
            
            -- using order by clause
            select sales
            from mydatabase.orders
            order by sales desc
            limit 1;
            

-- find the lowest sales of all orders
			-- using min()
            select min(sales) as lowest_sales
            from mydatabase.orders;
            
			-- using order by clause
            select sales
            from mydatabase.orders
            order by sales asc
            limit 1;
            
            
-- combining all
select customer_id,count(*) as tot_no_of_orders,
		sum(Sales) as tot_sales,
        avg(sales) as avg_sales,
        max(sales) as highest_sales,
        min(sales) as loweswt_sales
from mydatabase.orders 
group by customer_id




