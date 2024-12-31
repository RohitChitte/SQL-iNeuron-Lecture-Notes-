--  Having clause 

-- Observation 1 : Execution order : FROM -->WHERE--->GROUP BY--->HAVING---> ORDER BY
-- Observation 2 : Where clause can have column not in select statement.
-- Observation 3 : Having clause must have column in select statement.
select title from movies where industry='Bollywood' having imdb_rating>5  ; -- this won't work.

--  Get the release year with count of movies greater than 2

-- step 1 getting release_year and count of movies in descending order 
select release_year, count(*) movie_count from movies group by release_year order by movie_count desc;

-- step 2 using where clause to get only movies count greater than 2 (won't work)
select release_year, count(*) movie_count from movies where movie_count>2 group by release_year order by movie_count desc; 
-- Becuase WHERE is executed before GROUP BY WHERE doesn't have movie_count as movie_count is only availaible when group by release_year is executed
-- after group by movie_count will be available 

-- USE HAVING cluase when condition to be applied on column that is available after group by and is availaible in select statement.
-- remember above execution order.
select release_year, count(*) movie_count from movies  group by release_year HAVING movie_count>2 order by movie_count desc; 

