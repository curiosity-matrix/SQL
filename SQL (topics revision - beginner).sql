/*

types of sql commands

- DDL
create
alter 
drop
truncate


--DML
insert
update
delete


- SQL query
select


SQL query clauses
select (distinct)
from (join, on)
where
group by 
having
order by
limit


-- -> single line comment 
-- /*      mutiline comment
         * /    without space


-- select syntax
select colname1, colname2, ---  (* -> all)
from dbname.tbname;
 
              
-- distinct syntax
select distinct colname            distinct -> select unique rows 
								   remove duplicates
                                   ensure each value appears only once 
                                   

-- where syntax
select colnames
from dbname.tbname
where conditons (using comparison op or/and logical operators)


-- group by
select colnames, aggreagte function
from db.tb
where conditions
group by colname 
                    -- rule for group by ->  use when have 'for each' keyword in ques
                       group(combine) rows having same values in specified columns
                       used only when there is aggreagte functions in select
					   must match to no., data type nd names of column in select
                       colname shd be mentioned separately not with this *


-- alias -> temporary name given to column name


-- Having syntax
select colnames, aggregate function
from db.tb
where conditions on normal col
group by colname
having condition on aggregated col
                       
											where -> used before grp by on normal col
                                            having -> used after grp by on aggregated columns
             

-- order by syntax
select 												
 |
 |            
 |            
order by colname asc(default) 	     		order by -> sorts data in asc (default) or desc order
			OR            					used at last of all query only before limit
order by colname desc
             
             
-- limit
select 
 |
 |
 |
limit no_of_rows								limit -> used at very end of all clauses or end of query
											select rows from top to limit number
										
                                        
-- limit with offset
select 
 |
 |
 |
limit no_of_rows(n) offset skip_no_of_rows(m)		offset-> skip no.(m) of rows and then select til limit number(n rows)                               
                  
                  
-- execution order of queries
from
where
group by
having
select, distinct
order by
limit

                        
--  ;(semicolon) -> represents end of sql query
 
 
 -- create syntax
 create tb tb_name(											constraints -> not null
 col1 data_type constraint,										primary key (cvalues of col can't be null and must be unique)
 col2 data_type constraint,									    	primary key uniquely idenetifies a record
 |
 |
 );
 
 
 -- alter syntax											alter -> to modidy tb
 alter tb tb_name													col will always add at end 
 add colname data_type constraint
 
 alter tb tb_name													drop with alter -> to remove col from tb
 drop col_name
 
 
 --drop syntax
 drop tb tb_name												only drop -> removes tb from db
 
 
 -- truncate syntax
 truncate tb tb_name;										truncate -> remove all rows at once i.e content of tb 
																			but retains struct of tb
 
 
 
 
						tb keyword only with ddl commands -> as they deal with tb struct
												not with dml command -> as they deal with inside the tb
                                                     
                                                     
 -- insert syntax
 insert into tb_name(col1,col2,---)
 values(val1,val2,---)
		(val1,val2,--)							 insert into -> no. of col = no. of values else will be filled with null
														values must folow data type and constraints of columns
													    single or multiple values can be inserted at one go
                                                        col with constraint primary key or not null - can'nt be empty
                                                        not null or primary key col can skip assigning values
												-> order of inserting values must match col order
                                                        

-- update syntax
update tb_name
set col_name = value
where conndition									update -> where is mandatory else will updadte all values in a col


-- if warning arises
set sql_afe_updates = 0;
query;
set sql_safe_update = 1;


-- delete syntax
delete from tb_name										delete -> remove content or row within a table
where condition													where is mandatory else will del all rows


                                                     
 
 
 
 
 
 
 
 
 
 
 
 
 
 
                                        
-- 
	
