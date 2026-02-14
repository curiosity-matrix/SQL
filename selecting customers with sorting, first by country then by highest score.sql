-- retrieve all customers and sort them by country and then by highest score

select*
from customers
order by country asc,
		 score desc;