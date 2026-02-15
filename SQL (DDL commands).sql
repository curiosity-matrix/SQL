									/* SQL - DDL Commands */

									     /* CREATE command */
									
-- create a new table called persons with columns: id, person_name, birth_date, and phone

create table persons(
id int not null,								-- or id in not null primary key.
person_name varchar (50) not null, 
birth_date date,
phone varchar (15) not null,
constraint pk_persons primary key(id)          -- or primaary key (id) 
);


select *
from persons;


										/* ALTER command */
									
					/* adding new column */
-- add new column named email to the persons table

alter table persons
add email varchar(50) not null;

					/* remove existing column */
-- remove the column phone from the table persons

alter table persons
drop column phone;


									 /* DROP command */

-- delete table persons from the database

drop table persons;



