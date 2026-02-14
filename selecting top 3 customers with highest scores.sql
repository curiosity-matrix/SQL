-- retrieving the top 3 customers with highest scores

select first_name,score
from customers
order by score desc
limit 3;


output-->
first_name   | score
-------------|-------
John         | 900
Georg        | 750
Martin       | 500
