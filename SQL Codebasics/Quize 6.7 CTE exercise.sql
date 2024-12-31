# Select all Hollywood movies released after the year 2000 that made more than 500 million $ profit or more profit. 
#Note that all Hollywood movies have millions as a unit hence you don't need to do the unit conversion. 
# Also, you can write this query without CTE as well but you should try to write this using CTE only.

#Step 1: Query to find if units of all hollywood movies in Millions.
#Step 2: Write CTE for profit>=500 millions + CTE for release_year>2000.
#Step 3: join both CTEs.


#Step 1.
# Query to verify if units of Hollywood movies is in millions and no need of unit conversion.
select distinct unit 
from financials
join movies
on movies.movie_id=financials.movie_id
where industry='Hollywood';

#Step 2
with x as(
	select *,((revenue-budget)/budget)*100 as profit_percent from financials
    ),
y as(
	select * from movies where release_year>2000
)

#Step3: joining both CTEs

select y.title,y.release_year,
	   x.profit_percent
from x
join y
on x.movie_id=y.movie_id 
where x.profit_percent>=500 
order by release_year,profit_percent;
    