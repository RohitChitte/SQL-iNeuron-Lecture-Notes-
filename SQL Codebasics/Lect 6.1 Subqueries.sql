-- Subqueries

 -- 1. Single value Subquery
 -- 2. list of value Subquery
 -- 3. table returned by Subquery
 
 -- 1. Single value example
 -- Movie with max imdb rating (simple approach)
select * from movies order by imdb_rating desc limit 1;
-- Subquery apporach
select * from movies where imdb_rating = (select max(imdb_rating) from movies) ;
-- wrong approach  (Aggregate functions cannot be used in WEHER clause)
-- Aggregate functions can be used in (select, having, subquery, order by)
select * from movies where imdb_rating=max(imdb_rating); 

-- Min imdb_rating using subquery
select * from movies where imdb_rating = (select min(imdb_rating) from movies); 

-- Imdb_rating in range 

-- subqueries used in below main query.
select min(imdb_rating) from movies;
select max(imdb_rating) from movies; 

-- main query for range.
select * from movies where imdb_rating in ((select min(imdb_rating) from movies), (select max(imdb_rating) from movies)) ;

-- Getting actors with age in range 70 and 85  using HAVING 
select *, year(curdate())-birth_year as age from actors having age>70 and age<85 ;

-- Getting actors with age in range 70 and 85 using SUBQUERY to generate entire table
select * from (select name, YEAR(curdate())-birth_year as age from actors) as actors_age where age>70 and age<85;