										/* Membership Operator */
                        
				/* IN operator */

-- retrieve all customerrs from either Germany or USA
select*
from customers
where country in ('Germany','USA');     		-- or country ='Germany' or country='USA'


				/* NOT IN operator */

-- retrieve all customers who are not in germany and UK
select *
from customers
where country not in ('Germany','UK');