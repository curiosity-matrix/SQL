												/*  FUNCTIONS  */
                                            
                                            /* STRING - MANIPULATIONS */
/* CONCAT() -- join strings  */

use mydatabase;
-- show a lst of cust firstname together eith country in one column
select first_name, country, concat(first_name,' - ',country) as name_country
from customers;


/* LOWER() --> coverts all char of str to lowercase AND UPPER() --> all char to upercase */

-- transform the customer's first name to lowercase
select first_name, lower(first_name) as lower_name
from customers;

-- transform the customer's first name to lowercase
select upper(first_name) as upper_name
from customers;


/* TRIM() -> removes leading and trailing spaces */
-- find customers whose first name contains leading or trailing spaces
select first_name as spaced
from customers
where first_name regexp '^[ ]' or first_name regexp '[ ]$'	;		-- using regexp

select first_name as spaced
from customers
where first_name <> trim(first_name);								-- using trim()

select first_name as spaced, length(first_name) as len_f_name, length(trim(first_name)) as trim_len_f_name,
length(first_name) - length(trim(first_name)) flag					-- flag
from customers
where length(first_name)<>length(trim(first_name));



/* REPLACE() --> to replace old val with new val */

select '123-456-789' as phone, replace ('123-456-789','-','/') as clean_phone;

-- changing file extension
select 'sql_learn.txt' as text_file, replace('sql_learn.txt','.txt','.csv') as csv_file;



/* length() --> to find no. of characters -> MYSQL  |  len() -> SQL server */

-- calc length of each customer's first name
select first_name, length(first_name) as tot_char
from customers;



/* left() -> to extract specific no. of char from start and right() -> from end functions */

-- retrieve the first two character of each firstname
select first_name, left(first_name,2) as first_2_char
from customers;

-- retreiev last teo character of each name
select first_name, right(first_name,2) as last_2_char
from customers;



/* SUBSTRING() -> extracts a part of string at a specific position */

-- retrieve the list of customer's first names removing the first character
select first_name, substring(trim(first_name),2,length(first_name)) as sub_name
from customers;



/* ROUND() -> rounds off the value */
select 3.147 as number, round(3.147,2) as round_off_2, round(3.147,1) as round_off_1, round(3.147,0) as round_off_0;



/* abs() -> returns absolute(positive) value of a number */
select -10 as negative, abs(-10) as positive;


/* DATE() -> year-month-date(yyyy-mm-dd) */
use salesdb;
select orderid, orderdate, shipdate, creationtime,  '2026-02-21' as static_todays_Date, curdate() as today,
 date(creationtime) as part, now() as now
from salesdb.orders;



						/* DATE and TIME --> PART EXTRACTION */
	-- DAY() -> returns day from a date
select creationtime, day(creationtime) as day
from salesdb.orders;

	-- year() -> return year from a date
select creationtime, year(creationtime)
from orders;

	-- month() -> return month from a date
select creationtime, month(creationtime) as month
from orders;

-- datepart() -> sql server  | extract() -> MySQL                      -- 	extraction integers ***
select creationtime,
 extract(year from creationtime) as ct_year,
 extract(month from creationtime) as ct_month,
 extract(day from creationtime) as ct_day,
 extract( hour from creationtime) as ct_hr,
 extract(minute from creationtime) as ct_min,
 extract(second from creationtime) as ct_sec,
 extract( quarter from creationtime) as ct_quarter,
 week(creationtime) as ct_week
from orders;
    
																		/* extracting strings(names) */  
select creationtime, dayname(creationtime) as dayname,
monthname(creationtime) as monthname
from orders;


			/* last_day() -> return last day of month */
select creationtime, monthname(creationtime) as day_name, last_day(creationtime) as lst_day
from orders;



-- how many orders were placed each year
select year(orderdate) as yr, count(*) as no_of_orders
from salesdb.orders
group by year(orderdate);


-- how many orders were placed each month
select monthname(orderdate) as M_onth, count(*) as no_of_orders
from salesdb.orders
group by monthname(orderdate);


-- show all orders that were placed during the month of february
select *, monthname(orderdate) as M_onth
from salesdb.orders
where month(orderdate)=2;							-- monthname(orderdate) = 'february'



						/* DATE FORMAT 
| Code | Meaning          | Example  |
| ---- | ---------------- | -------- |
| `%Y` | 4-digit year     | 2026     |
| `%y` | 2-digit year     | 26       |
| `%m` | month (01–12)    | 02       |
| `%c` | month (1–12)     | 2        |
| `%d` | day (01–31)      | 21       |
| `%e` | day (1–31)       | 21       |
| `%M` | month name       | February |
| `%b` | short month name | Feb      |
| `%W` | weekday name     | Saturday |
| `%w` | weekday no       | 6        |			0-> sunday | 6-> saturday
| `%a` | short weekday    | Sat      |
| `%H` | hour (00–23)     | 14       |
| `%h` | hour (01–12)     | 02       |
| `%i` | minutes          | 35       |
| `%s` | seconds          | 10       |
| `%p` | am or pm         | pm       |			*/

select creationtime,
date_format(creationtime,'%Y-%m-%d'),
 date_format(creationtime,'%Y') as Yr,
 date_format(creationtime,'%y') as yr,
 date_format(creationtime,'%m') as 0_month,
 date_format(creationtime,'%c') as month,
 date_format(creationtime,'%M') as month_name,
 date_format(creationtime,'%b') as short_month_name,
 date_format(creationtime,'%d') as 0_day,
 date_format(creationtime,'%e') as day,
 date_format(creationtime,'%w') as weekday_no,
 date_format(creationtime,'%W') as weekday_name,
date_format(creationtime,'%a') as short_weekday_name,
date_format(creationtime,'%H') as 24_hr,
date_format(creationtime,'%h') as 12_hr,
date_format(creationtime,'%i') as min,
date_format(creationtime,'%s') as sec,
date_format(creationtime,'%p') as am_or_pm
from salesdb.orders;


-- show creation time using following format 		- day wed jan q1 2025 12:34:56 PM
select creationtime, 
concat('day', ' ' , date_format(creationtime,'%a') , ' ' , date_format(creationtime,'%b') , ' ' ,'q', extract(quarter from creationtime) , ' ' ,date_format(creationtime,'%Y %h:%i:%s') , ' ' , date_format(creationtime,'%p')) as formatted
from salesdb.orders;

		
        
									
                                    /* CAST() and convert() -> to convert one data type into other  */
                                    
-- convert str to int(signed) using cast()
select cast('123' as signed) as 'str to int';


-- convert str to int(signed) using convert()
select convert('123',signed) as 'str to int with cast',
convert('123' , signed) as 'str to int wiht convert';

-- convert str to date
select cast('2026-02-22' as date) as 'str to date with cast', 
convert('2026-02-01', date) as 'str to date with convert';

-- conert date time to date
select cast(creationtime as date) as ' date_time to date with cast',
convert(creationtime , date) as 'date_time to date with convert' 
from salesdb.orders;


-- style as parameter in converrt - in sql swerver



				/* date_add(date, interval_keyword value unit) --> to add or sub day or month or year or hr or min or sec or week */ 
 
 -- adding 2 years to order date
 select orderdate, date_Add(orderdate, interval 2 year) as 'afer 2 yrs'
 from salesdb.orders;
 
 -- adding 3 months to order date
 select orderdate, date_Add(orderdate, interval 3 month) as 'after 3 months'
 from orders;
 
 -- 10 days before
 select orderdate, date_Add(orderdate, interval -10 day) as '10 day beofre'
 from orders;
 
 
 
			/* datediff(end_date,start_date) - only for days  | TimeStampDiff(unit,start_dat, end_date) - for month,yr,hr,min,sec */
            
-- calulate age of emplyees
select firstname,monthname(birthdate) as 'birthday month' , timestampdiff(year,birthdate,current_date()) as age
from employees;

-- find the avg shipping duration in days of each month
select  year(orderdate) as order_yr, monthname(orderdate) as order_month, avg(datediff(shipdate,orderdate)) as 'avg ship days'
from salesdb.orders
group by year(orderdate),monthname(orderdate);



-- find the no. of days b/w each order and the previos order

-- lag(col,how many rows back u want to look) over (order by col) -> is a window function 

select orderdate,
lag(orderdate) over (order by orderdate) as prevdate,					
datediff(orderdate,lag(orderdate) over (order by orderdate)) as difference
from orders;


-- DATE validation

select str_to_date('123','%Y-%m-%d') as result;
select str_to_date('2026-2-23','%Y-%m-%d') as result;


-- CASE WHEN		-- all branches (then, else) must return same data type

select orderdate,
case 
when str_to_Date(orderdate,'%Y-%m-%d') is null
then 'not a date'
else "it's a date"
end as date_check
from orders;

