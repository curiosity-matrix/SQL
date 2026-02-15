											/* DML commands */

										/* Insert command */
						
 insert into customers (id, first_name, country, score)
 values(6, 'Anna', 'USA', NULL),
		(7, 'Sam', NULL, 100);
        
insert into customers(id, first_name)
values(8,'Sara');							-- it wil automatically fill NULL

insert into customers(first_name)
values('shri');								-- will give error bcz primary kry cannot be null and 
											-- sql tries to assign NULL to id so it gives error

insert into customers(id, first_name, country, score)
values(9,'USA','MAX',NULL);

insert into customers(id, first_name, country, score)
values (10, 'Andreas', 'Germany', NULL);
                                            
select*
from customers;


											
                                            /* Query + Insert command */
								/* retrieving data from one table and putting it in another table */
                                
-- copy data from customers table into persons table     --> means source table: curomers , target table: persons
insert into persons(id, person_name,birth_date,phone)
select id, first_name, Null, 'Unknown'
from customers;

select * from persons;


									/* UPDATE command */
					
-- change the score of customer with ID 6 to 0

update customers
set score=0
where id=6;
             
select *
from customers
where id=6;


-- change the score of customer 8 to 0 and update the country to UK

update customers
set score=0,
	country = 'UK'
where id = 8;


-- update all customers with a NULL score by setting their score to 0

select *
from customers
where score is NULL;


/* temporary disabling update safae mode 0 bcz its good that sql warns you so                 ***** 
--permanent diasbling it might take you in danger */

set sql_safe_updates=0;

update customers
set score = 0
where score is NULL;

set sql_safe_updates = 1;


								/* DELETE command */

-- delete all customers with an ID greater than 5

select *
from customers
where id>5;


delete from customers
where id>5;


-- delete all data from the persons table

delete from persons;			-- better for small tables

-- OR 

Truncate table persons;

select * from persons;