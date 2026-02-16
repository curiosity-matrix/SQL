											/* Logical operators */
                            
/* AND operator --> all conditions must be True */

-- retrieve all customers who are from USA AND have score greaterr than 500
select*
from customers
where country='USA' AND score > 500;



/* OR operator --> atleat one condition must be True for a row to be in result */

-- retrieve all customers who are either from USA or have score greater than 500
select *
from customers
where country="USA" or score>500;



/* NOT operator --> it reverses the result i.e. include rows that dont match with the condition */

-- retrieve all customers with a score not less than 500
select*
from customers
where  not(score<500);  				-- or  score >=500
 