use mydatabas;

										/* SELECT AND From clauses */

-- RETRIEVE ALL CUSTOMER DATA

select *
from customers;

-- RETRIEVE ALL ORDER DATA

SELECT *
FROM ORDERS;


-- RETRIEVE EACH CUSTOMER'S NAME, COUNTRY AND SCORE

select 
	first_name,
    country,
    score
from customers;



										/* WHERE CLASUE */
                                        
-- SELECT DATA OF CUSTOMERS WITH SCORE GRETAER THAN 500

SELECT *
FROM CUSTOMERS
WHERE SCORE>500;

-- RETRIEVE CUSTOMERS WITH A SCORE NOT EQUAL TO 0

SELECT *
FROM CUSTOMERS
WHERE score!=0;     -- <> or != --> not equal to

-- retrieve customers from germany

select *
from customers
where country="GERMANY";

-- interested only to see name and company not id or score

select first_name,country
from customers
where country="germany";



									/* ORDER BY CLAUSE */
                                    
-- retrieve all customers and sort the results by the highest score first

select *
from customers
order by score desc;

-- retrieve all customers and sort the results by the lowest score first

select * 
from customers
order by score asc; 		-- or or highest score first -> desc   

-- retrieve all customers and sort them by country and then by highest score

select*
from customers
order by country asc,
		 score desc;
         
select first_name
from customers
where country ='germany'
order by score asc;
         


										/* GROUP BY clause */
                    
-- find total score for each country

select country,first_name,sum(score) as total_score
from customers
group by country,first_name;

-- find the total score and total numbers of customers for  each country

select country, sum(score) as tot_score, count(first_name) as tot_no_of_cust 
from customers
where country ='germany'
group by country;


select country 
from customers
where country='germany' or country='usa'
group by country
order by country desc;


										/* HAVING clause */
                                        
-- 	find the avg score for each country considering only customers with a score not equal to 0 and 
-- return only those countries with an average score greater than 430

select country, avg(score) as avg_score
from customers
where score <> 0
group by country
having avg_score > 430;


										/* DISTINCT keyword */
                                        
-- return unique list of all companies
select distinct country
from customers;


										/* Top keyword*/

-- retrieve only 3 customers

select * 
from customers
limit 3;
					
                    
-- return 3 highest scored country

select country, score
from customers
order by score desc
limit 3;

-- return data after 2 rows

select *
from customers
limit 3 offset 2;		-- or limit 2,5;


-- return the lowest 2 customers based on the score
select first_name, country, score
from customers
order by score asc
limit 2;



select country, sum(score)
From customers
where score > 400
group by country
having sum(score) > 550
Order by country
limit 1;




-- WE CAN RUN MULTIPLE QUERIES AT ONE GO 
select * 
from customers;

select *
from orders;
 
 
 
           /* SELECTING FIXED VALUES  */
select 123 as static_value;

select 'hello' as static_value;

select id, first_name, 'new_customers' as customer_type
from customers;
