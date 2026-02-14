-- retrieving the top 3 customers with highest scores

select first_name,score
from customers
order by score desc
limit 3;