/* temporary disabling update safae mode 0 bcz its good that sql warns you so                 ***** 
--permanent diasbling it might take you in danger */

set sql_safe_updates=0;

update customers
set score = 0
where score is NULL;

set sql_safe_updates = 1;
