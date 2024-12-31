
-- Get names of actors whose age between (70,85)
select * from (select *,year(curdate())-birth_year as age from actors) as act_age where age>70 and age<85;

-- same query using CTE.alter
with actors_age as (
	select *,year(curdate())-birth_year as age 
    from actors
)
select * from actors_age where age>70 and age<85;


# Question : Movies that produced 500% profit and rating was less than avg rating of all movies.
# Step 1: Get movies with 500% or more profit.
# Get movies with ratings less than avg rating. 
select * from movies;
select * from financials;


# movies_id, title, profit_percentage, imdb_ratings
with x as(
	select *, ((revenue-budget)/budget)*100 as proft_per from financials
),
y as(
	select * from movies where imdb_rating<(select avg(imdb_rating) from movies)  
)
select 		
	y.movie_id, y.title,
    x.proft_per,y.imdb_rating
from x
join y
on x.movie_id=y.movie_id 
where x.proft_per>=500;