select * from actors;
select * from financials ;
select * from languages;
select * from movie_actor;
select * from movies;


--  Print all movie titles and release year for all Marvel Studios movies. -- 
select title, release_year from movies where studio = 'Marvel Studios' ;

-- %Avenger : string ending with Avenger
-- Avenger% : String starting with Avenger
-- %Avenger% : String with somewhere containging Avenger

-- Print all movies that have Avenger in their name.-- 
select * from movies where title like '%Avenger%';


-- Print the year when the movie "The Godfather" was released.--  
select title, release_year from movies where title like '%Godfather%';

-- Print all distinct movie studios in the Bollywood industry.-- 
select distinct studio from movies where industry='Bollywood';