							 	                /* Filtering Data     -->    used with where clause */ 
																/* WHERE operators */
                                                                
								/* COMPARISON operators */
                                
		/* = (equal to operator) */

-- retrieve all cusotmers from germany
select *
from customers
where country ='Germany';


		/* <> or !=  ( not equal to operator ) */  -- =! X

-- retrieve all customers who are not from Germany
select *
from customers
where country =! 'Germany';


		/* > (greater than operator) */
        
-- retrieve all customers with score greater than 500
select *
from customers
where score>500;

	   /* >=  (greater than or equal to) */

-- retrieve all customers with score of 500 or more
select*
from customers
where score >= 500;


		/* < (less than operator)  */
        
-- retrieve all customers with score less than 500
select *
from customers
where score<500;


		/* <= (less than or equal to) */
	
-- retrieve all customers with score of 500 or less
select *
from customers
where score <=500;
