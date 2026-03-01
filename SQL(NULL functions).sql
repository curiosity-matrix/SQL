										/* NULL FUNCTIONS */
                        
/* to check NULL values */

-- IS NULL 

select *
from customers
where lastname IS NULL;
                        

-- IS NOT NULL

select *
from customers
where lastname is not null;


-- ISNULL	

select *, isnull(lastname)
from customers;



/* REPLACING NULL VALUES */

-- IFNULL()

select ifnull(lastname,'sirname') 
from customers;


-- NULLIF()

select nullif(lastname,'Brown') as missing_lastname
from customers;


-- coalesce()

select coalesce(shipaddress,billaddress,'missingaddress') 
from orders;




-- find the avg scores of the customes
select score
from customers;



-- over () -> to keep the aggregated result in each row without collapsing unlike group by
select country,avg(score) as avg_sccore
from customers
group by country;

select *,avg(score) over() as avg_Score
from customers;


		/*  HANDLIMG NULL BEFORE avg()  */
        
-- HNADLING NULL in scores column
select *,
avg(score) over() as avg_with_null,
avg(coalesce(score,0)) over () as coalesce_avg
from customers;



				/* handling null before concat() and addition  */
                
-- display the full name of customers in a single field by merging their first and last name, and add 10 binus points to each customer's score
select coalesce(firstname,'missing_f_name') as f_name , coalesce(lastname,'missing_l_name') as l_name ,
concat(coalesce(firstname,'missing_f_name'), ' ' ,coalesce(lastname,'missing_l_name')) as full_name,
score,
coalesce(score,0)+10 as bonus_Score														-- anything +or- null = null
from customers;


			/*  handle NULL before joins	*/
		
        
        
			/*  handling NULL before sorting  */

-- sort the customers from lowest to highest scores, with NULLs appearing last
select customerid, score, coalesce(score,0) as handling_null_before_sort
from customers
order by coalesce(score,0) asc;

						-- OR 
                        
-- Checking for a NULL using FLAG i.e CASE
select customerid,score,
case
when score is null
then 1
else 0
end as check_null
from customers;



	 /* usign NULLIF(val1,val2) to handle divide by zero error  */ 
	
-- find the sales price for each order by dividng the sales by the quantity
									
select sales, quantity, sales/quantity as sales_price
from orders;													-- returns null for divide by 0



-- isnull, is null, is not null in select query returns 0(false) and 1(true) as output


-- identify the customers who have no score
select *
from customers
where score is null;


-- list of all customers who have score
select *
from customers
where score is not null;




/* LEFT ANTI JOIN -> LEFT JOIN + IS NULL    |  RIGHT ANTI JOIN -> RIGHT JOIN + IS NULL  */

-- list all details for customers who have not placed any order
select *
from customers as c
left join orders as o
on c.customerid  = o.customerid
where o.customerid is null;



select length('   ') as tot_len, length(trim('   '))  as trim_len;



/* CASE STATEMENTS */
/* create report showing total sales for each of the following categories:
high(sales over 50), medium(Sales 21-50), and low (sales 20 or less)
sort the categories from highest to lowest.*/

select sales_category, sum(sales) as tot_categorywise_sales
from (select sales,
case 
when sales>50 then 'high'
when sales between 21 and 50 then 'medium'
else 'low'
end as sales_category
from salesdb.orders) as t						-- pehele from execute hua, sales_category as new col mila
group by sales_category							-- fir new col ke acc grouping ki
order by tot_categorywise_sales desc;			-- as t (kuki inner query result degi ek tb format me to usko ek temp name
														-- dena pdega jisko outer query use kregi




-- retrieve employee detail with gender displayed as full text
select employeeid,firstname,lastname,
case
when gender='m' then 'male'
when gender='f' then 'female'
else 'invalid gender'
end as gender_full_text
from employees;



-- retrieve customers details with abbeviated country code

select distinct country					-- to check all countries
from salesdb.customers;

select customerid,firstname, lastname,
case 
when country='Germany' then 'DE'
when country='USA' then 'US'
else 'n/a'
end as abbreviated_country
from salesdb.customers;



			/* HNADLING NULLS USING CASE STATEMENT */
-- find the avg scores of customers and treat nulls as 0. additionally provide details such customerid and lastname
select customerid, lastname,avg(coalesce(score,0)) over() as avg_score			-- or can use case stat but here null function is better to use
from salesdb.customers;
 
 -- or
 
 select customerid, lastname,					
 case 
 when score is null then 0
 else score
 end as no_null_Score,
 avg (
 case
 when score is null then 0
 else score
 end ) over() as avg_score
from salesdb.customers;
 
 
 -- count how many times each cutomer has made an order with sales greater than 30
 select customerid,count(*) as order_count
 from salesdb.orders
 where sales>30
 group by customerid;
 
				-- same with case stat 

select customerid,
sum(case
when sales>30 then 1
else 0
end ) as sales_flag
from salesdb.orders
group by customerid

                

