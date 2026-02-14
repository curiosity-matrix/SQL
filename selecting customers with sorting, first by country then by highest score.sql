-- retrieve all customers and sort them by country and then by highest score

select*
from customers
order by country asc,
		 score desc;



Output-->

id 	| first_name	| country	| score
----|---------------|-----------|--------
4	| Martin	    | Germany	| 500
1	| Maria			| Germany	| 350
3	| Georg			| UK 		| 750
2	| John			| USA 		| 900
5	| Peter			| USA		| 0
