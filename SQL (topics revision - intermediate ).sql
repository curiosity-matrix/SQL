											-- Filtering data
-- where opearators
							-- comparison operator ->   = , != , < , <= , > , >=
-- syntax
/*
select colnames or *
from dbname.tbname
where colname1 required_op value;				-- col1 = col2  OR  col = value  OR  expresssion = value  OR  function = values 
*/




							-- logical operator -> or , and , not
-- syntax
/*
select colnames or *
from db.tb
where condiiton1 logical_op condition2 ; 		-- for -> - or        - and 

where not(condition);							-- for not
*/





							-- range operator -> between value1 and value 2      ( both values are inclusive i.e. included )
-- syntax
/*
select colname
from db.tb
where colname between val1 and val2;
*/




							-- membership operator ->  - in        - not in
-- syntax
/*
select colnames
from db.tb
where colname in / not in (val1,val2,---);
*/





							-- search operator -> like -> % , _   ( for patterns)
/*
select colnames
from db.tb
where colname like "  ";   --  char% -> start with char and then anything 
						   --  %char -> start with anything but end with char
                           --  ___char -> after this much (no. of underscore) that can have any char but must have then this char
                           --  char__ -> same
                           --  used in different patterns depending upon question 
                           --  _ -> itne ke baad ye aye 
                           --  % -> after/before this kuch bhi aye 
                           --  or used in combinations
*/

-- _________________________________________________________________________________________________________________


								-- combining data   -> joins use to establish relationship among tables
					  -- row wise combine -> set op ->  union , union all , except , intersect
		-- col wise combine -> joins  -> inner , left , right , full , left-anti , right-anti , full-anti , cross


-- 1.  inner join -> return only matching rows from the two tables ( intersection )
/*
select alias.colnames
from db.tb1 as alias1
inner join db.tb2 as alias2
on alias1.col1 = alias2.col2
where condiotions
*/


-- 2. left join  -> it returns all rows from left and from right it gives matched rows and unmatched rows with null
/*
select alias.colnames
from db.tb1 as alias1
left join db.tb2 as alias2
on alias1.col1 = alias2.col2
where condiotions
*/


-- 3. right join  -> it returns all rows from right and from left it gives matched rows and unmatched rows with null
/*
select alias.colnames
from db.tb1 as alias1
right join db.tb2 as alias2
on alias1.col1 = alias2.col2
where condiotions
*/

-- 4. Full join  ->  there is no fill join keyword in my sql - so we use left join + union + right join
				-- union removes duplicate rows that are 100% identical
/*
(select alias.colnames
from db.tb1 as alias1
left join db.tb2 as alias2
on alias1.col1 = alias2.col2)

union

/*
(select alias.colnames
from db.tb1 as alias1
right join db.tb2 as alias2
on alias1.col1 = alias2.col2)

*/


-- 5. left anti join  -> means having all rows from left table that are not in right table
/*
select alias.colnames
from db.tb1 as alias1
left join db.tb2 as alias2
on alias1.col1 = alias2.col2
where alias2.col2 is NULL;
*/



-- 6. right anti join  -> means having all rows from right table that are not in left table
/*
select alias.colnames
from db.tb1 as alias1
right join db.tb2 as alias2
on alias1.col1 = alias2.col2
where alias1.col2 is NULL;
*/


 
-- 7. full anti join  -> means having all rows from left table that are not in right table and rom tight tb not in left tb
/*
select alias.colnames
from db.tb1 as alias1
left join db.tb2 as alias2
on alias1.col1 = alias2.col2
where alias2.col1 is NULL;

union

select alias.colnames
from db.tb1 as alias1
right join db.tb2 as alias2
on alias1.col1 = alias2.col2
where alias2.col2 is NULL;

*/


-- 8. Cross join -> combine every row from left tb to each row of right tb  -> no on condition
/*
select alias.colnames
from db.tb1 as alias1
cross join db.tb2 as alias2

-- or combine all rows from rigth tb to each row of left tb

select alias.colnames
from db.tb2 as alias1
join_type db.tb1 as alias2
*/



		-- u can even connect multiple tables    
/*
SELECT * or colnames
FROM tb1 a
JOIN tb2 b 
ON a.id = b.id
JOIN tb3 c 
ON b.id = c.id;

-- mix join with multiple tables
SELECT *
FROM tb1 a
LEFT JOIN tb2 b ON a.id = b.id
INNER JOIN tb3 c ON b.id = c.id;



-- for on condition while multiple tb joining
-- 👉 “ER diagram dekhna best practice hai kyunki wo relationships clear karta hai, 
-- lekin agar available na ho toh hum column names aur foreign key patterns se relationships identify kar sakte hain.”

*/



				   -- NOTE          : Order by clause used always at start after all statements of all joins , 
                            -- exactly at last of complete query
						-- we can give more than 1 on condition
                            
                            
                            
-- SET operators
-- -> must have same no. of columns with same data types and same order

-- 1. union -> remove duplicate values / rows (100% identical rows ko)
/*
(select alias1.colnames
from tb1 as alias1)

union

(select alias2.colnames
from tb2 as alias2)
*/


-- 2. union all -> retur all rows including duplicates also as many times its present
/*
(select alias1.colnames
from tb1 as alias1)

union all

(select alias2.colnames
from tb2 as alias2)
*/

-- 3. except op is not in my SQL so we use not exists
/*
select alias1.colnames
from tb1 as alias1
where not exists (						-- fir secondly wo un eq ko ko hta dega
select alias2.colnames
from alias2.tb2
where alias1.col = alias2.col)			-- 1st subquery execute hoke equal milega
*/


-- 4. intersection not in MY SQL -> use inner join


-- _______________________________________________________________________________________________________________


								-- EXPRESSIONS to match patterns 
                                -- ^ -> represents starts with
                                -- $ -> represnts ends with
/*
select colnames
from db.tb
where col regexp "^[characters]"
				or
	  col not regexp "^[characters]"
				or
      col regexp "[characters]$"
				or
	  col not regexp "[characters]$"          
*/


-- __________________________________________________________________________________________________________________


						-- FUNCTIONS
                       -- types -> single row func , muliti row func , nested func
                       
-- single row functions->  string func , numeric func , date adn time func , null func
-- multi row func -. aggregate func , window func

-- ____________________________________________________________
-- string functions -> 
					-- manipulation -> concat() , upper() , lower() , trim() , replace() 
					-- calculation -> length() 
                    -- substring string extraction -> left() , right() , substring()
                    
/*
							-- CONCAT() ->
select concat(col1 , "any symbol or char" , col2) as col_alis
from tb
where condition ;


							-- UPPER() ->
select upper(col) as col_alias
from tb
where condition;


							-- LOWER() ->
select lower(col) as col_alias
from tb
where condition;


							-- TRIM() -> remove whitespace from both sides c/a as leading and trailing sapces
select trim(col) as col_alias
from tb
where condition;


							-- replace() -> replace old val with new val
select replace (oldval , newval)  OR select('val to be replaced' , 'old_symbol' , 'new_symbol') as col_alias
from tb
where condititon;


							
                            -- length()
select length(col) as col_alias
from tb
where condition;


							-- left() -> to extract specific no. of character from start
select left(col,no._of_char) as col_alias
from tb
where condition;


						   -- right() -> to extract specifc no of character from end
select right(col,no._of_char) as col_alias
from tb
where condition;


							-- sustring() -> to extract part of string at specific position
select substring(col , start_pos , no._of_char_to_extract)		-> for no. of char - can also use length(trim(col))
from tb
where condition ; 

-- _________________________________________________________________________

								-- NUMBER FUNCTIONS

-- 1. abs() -> return positive value 
select abs(col)
from db.tb;


-- 2. round(val/col , no of decimal places )  -> to round off decimal values
select round(col , no. of decimla places)
from db.tb

-- _________________________________________________________________________


								--  Date and Time functions  ->   yyyy - mm - dd ->   hh : mm : ss


-- for current details

-- 1. curdate()  -> returns current date

-- 2. curtime() -> reuturns current time

-- 3. now() -> returns current date time 

-- _________________________________________

-- date and time part extraction  -> that return as integer

-- 1. day(col)   -> returns int

select day(col) as alias
from db.tb
where condition;


-- 2. date(col)   -> returns int

select date(col) as alias
from db.tb
where constions;


-- 3. year(col)  -> returns int

select year(col) as alias
from db.tb
where conditions;


-- 4. month(col)  -> reutrns int

select month(col) as alias
from db.tb
where conditions;

--_________________________________________


-- Extract ( part from col)  ;    part -> day / date / month / year / hour / min / second / quarter

select extract() as alias
from db.tb
where conditions;

--_________________________________________  

-- week () 
select week(col) as alias
from db.tb
where constions;

--________________________________________

-- last_day(col)

select last_day(col)
from db.tb
where conditions;

--_________________________________________________________

-- date and time part extraction  -> that return as string


-- 1.dayname(col)

select dayname(col) as alias
from db.tb
where constions;


-- 2. monthname(col)

select monthname(col) as alias
from db.tb
where constions;

--________________________________________________________

                        -- DATE_FORMAT -> used when need is to display them for presentaion -> return integer values
                        -- cast -> to change format
                        
-- date_format(col,"type")

select date_format(Col," %Y-%m-%d ")
from db.tb
where conditions;

								-- types (case sensitive )
                                
						code                meaning               example
                        
       year             %Y					4 digit yr            2026
                        %y					2					  26
                        
      month             %m					01 - 12				  02
                        %c					1 - 12                2
                        
      day               %d					01 - 31				  01
					    %e					1 - 31                 1
                        
	 month name         %M				    full name			  February
						%b                  half name             Feb
                        
	weekday name		%W					full name             Saturday
						%a					short name 			  sat
                        
        hour			%H					24 hr format		00 - 24
						%handler			12 he format         01- 12
                        
	   minutes			%i					minutes				45
       
		seconds			%s					sescond				45
        
        %p                                                       am / pm (auto detect)
        
        
--___________________________________________________



          -- CAST -> to change type of value to another type  ->     ex. str to date
          
select cast( value as type ) as alias
from db.tb
	
	
--____________________________________________________


--  date_add() -> to add/sub day  , month , yr , hr , min , sec , week
/*
select date_add(col/val , interval 5 day or 2 month or -4 day)  as alias            -- interval -> is a keyword
from db.tb
where condition;
*/


-- date_diff() -> to find difference between 2 dates -> returns only no. of days
/*
select date_dif(date1_or_col1 , date2_ot_col2) as alias
from db.tb
where conditions;
*/


-- timestampdiff()-> to find differnece wrt hr , min , sec , year , month
/*
timestampdiff(unit , startdate , enddate) as alias                    -- ex -timestampifff(year,birthdate,currentdate)
from db.tb																-- start date < end date
where conditions;
*/


-- str_to_date('col','format')  -> return value if col same as format ; returns null if not same
/*
select str_to_date('col','format') as alias
from db.tb
where conditions;
*/


-- __________________________________________________________________________________


-- case statements   -> all branches i.e. when then else - mutst return same data type
/*
select 
case
	when condition1	then result1
	ewhen condition2 then result2
    |
    |
    else default_value										--> no else stat - then returns null
end as colname
from db.tb
where condition;
*/

									-- CASE STATEMENT RULES
-- data type for all then statements must be same i.e. all str or all int
-- case stat can be used anywhere -> select , from ,where , group by

-- _________________________________________________________________________________


								-- NULL FUNCTIONS  -> null means nothing or unknown


-- used to check for null values

--  1.  is null													
--  2.  is not null

/*
select col
from db.tb
where col is null ;
		or
	col is not null;
*/



-- 3.  isnull				-> returns 0 or 1
/*
select isnull(Col)
from
where
*/



-- to replaec null values

-- 4. coalesce(col_or_val_to_be_replaced , with_what)
/*
select coalesce(val1,val2,vale3) as alias      -> it will replace null of val1 with given val2 if val2 also null then with val3
from db.rb
where condition;
*/



-- 5. ifnull    -> replaces null value with new value
/* 
select ifnull(col,new_val)
from db.tb
where condition;
*/



-- 6. nullif()    -> it returns null if the val of col1 = val of col2
/*
select nullif(col1,col2) as alias								-> 
from db.tb
where condition;



-- __________________________________________________________________________________________________

					-- null handling cases

-- so while using these alwasy use coalesce before tpo covert null to 0
-- sum , max , min , mean -> ignore null values but mean -> count row but not consider sum of null 

-- count(col) -> don't count null
-- count(*) -> counts null also

ex-> select coalesce(score,0) + 10 as updated_score



-- even while joining during on condition -> null = null is wrong so it will ignore such rows
												-- but we want all data
									-- use coalesce
-- ex for join
/*
SELECT 
    t1.id,
    COALESCE(t2.id, 'Not Found') as matched_id					       -- use colsesce in select instead of on condition
FROM table1 as t1
LEFT JOIN table2 as t2
ON t1.id = t2.id;


-- handling nulls before sorting data

-- nulls can be handled using case stat also -> 
	select 
		case 
			when col is null  then 0
			|
			|
			else col
		end as new_col_name
	from
    where
    

--_______________________________________________________________________________


-- NULL                	v/s					  empty string                       v/s            blank space
-- unknown val								str val having 0 char							  str val having space char
-- missing val

-- less storage								ocupies memory

-- data type as special marker 				string												string

-- best to use									fast												slow



--________________________________________________________________________________



			-- to find number l\of char in text
-- length(col)
/*
select length(col) as alias
from db.tb
where condition;



--_____________________________________________________________________________________


									-- handling empty values
        
select coalesce(nullif(trim(col),""),"n/a") as handled_col
from db.tb


--___________________________________________________________________________________


								-- data policy
		-- use deafult value instead of nyll or empty str or blank space
        
        
        
--__________________________________________________________________________________________



-- inner query is writtten in from clause with tb alias for subtb of sub query
/*
select col
from
(
select col1,col2,col3
from tb1
where conditions
) as tb2
group by col
order by col;
*/



-- ________________________________________________________________________________


									-- string change
-- replace(col,old_Val,new_val)
/*
select replace(col,old,new) as alias
from db.tb
where condition;
                