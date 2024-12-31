-- 1. How many movies were released between 2015 and 2022
select count(movie_id) from movies where release_year between 2015 and 2022;

-- 2. Print the max and min movie release year
select (min(release_year)) as mini, (max(release_year)) as maxim from movies;

-- 3. Print a year and how many movies were released in that year starting with the latest year
select count(movie_id), release_year from movies group by release_year order by release_year desc;