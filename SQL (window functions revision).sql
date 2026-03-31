-- group by 		        v/s       partition
/*	combines rows of		|	it retain the detailed info of eveyr row
    similar value and 		|	instead of combining rows
    detailed info 			|	it make windows for every set of rows
	gets lost				|	with different values 
							|    (widnow contains rows with similar values)
							|
	|						|					|
for aggregation 			|	for aggregation + detail
where detail 				|
dont' matters				|

*/


-- WINDOW FUNCTIONS

-- 1. Aggregate functions
/*
COUNT()   	
AVG()	
SUM()		 
MIN()		
MAX()		
*/

-- 2. RANK FUNCTIONS
/*
ROW_NUMBER()
RANK()
DENSE_RANK()
CUME_DIST()
PERCENT_RANK()
NTILE(N)
*/


-- 3. Value Functions
/*
LEAD(COLNAME,OFFSET)
LAG(COLNAME,OFFSET)
FIRST_VALUE(COLNAME)
LAST_VALUE(COLNAME)
NTH_VALUE(EXPRESSION,N)
*/

/*
FUNCTIONS			|      TAKES DATA TYPES     |   PARTITION BY CLAUSE 		|  ORDER BY CLAUSE

aggregate			|		count(all)			|		option-					|		option-
					|		others(numeric)		|	    -al						|		    -al
					|							|								|
rank				|			ntile(numeric)	|		    optio-				|			requi-
					|			others(empty)	|			 -nal				|			-red
					|							|								|
value				|			all				|	 optional					|		required

*/



-- ________________________________________________

-- SYNTAX OF WINDOW FUNCTION
/*
EXPRESSION
OVER(
	PARTITION BY COLIST,
    ORDER BY COLIST,
    FRAME_CLAUSE
    )
*/



-- Without Partition By 
/*
EXPRESSION OVER ()						-> Considers entire dataset as 1 window
*/

-- WITH PARTITION BY ON 1 COL
/*
EXP OVER (PARTITION BY COL)				--> makes windows based on columns
*/

-- WIHT PARTITION BY ON COMBINED COL
/*
EXP OVER(PARTITION BY COL1,COL2)
*/




-- use case 
/*
-> for keyowrd - across all -> over()
	             for each  -> over(partition by col)
*/



-- _________________________________________________________________________

-- Frame --> to select subset of values within a windows
/*
-- syntax
exp over(partition by col order by col
			rows between lower_val and higher_val )
            
            lower_val  -> current row , n preceedings , unbounded preceeding
            higher_val -> current row , n following , unbounded following
            
	-- rules
    lower val must be before the highest val
    frames must be used with order by clause
    
*/


-- window functions can only be used in select stat and order by clause