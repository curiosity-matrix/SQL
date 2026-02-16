									/* Range operator */
								   /* BETWEEN operator */

-- retrive customers whose score falls in the range between 100 adn 500	(boundaries are inclusive)
select *
from customers
where score between 100 and 500; 			-- or score >=100 and score<=500

