-- 1. Select all the movies with minimum and maximum release_year. Note that there \
-- can be more than one movie in min and a max year hence output rows can be more than 2

-- Get the max year and min year
select max(release_year) from movies;
select min(release_year) from movies;

-- Using subquery
select * from movies where release_year in ((select max(release_year) from movies),(select min(release_year) from movies)) order by release_year ;


-- ChatGPT join approach
SELECT m.*
FROM movies m
JOIN (SELECT MAX(release_year) AS max_year, MIN(release_year) AS min_year FROM movies) AS years
ON m.release_year = years.max_year OR m.release_year = years.min_year
ORDER BY m.release_year;

-- 2. Select all the rows from the movies table whose imdb_rating is higher than the average rating

select * from movies where imdb_rating > (select avg(imdb_rating) from movies) order by imdb_rating ; 

