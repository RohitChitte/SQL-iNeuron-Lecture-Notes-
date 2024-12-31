--  Give list of names of actors who acted in movies with movie_id (101,110,121).
-- Select movies with ratings greater than ANY Marvel Moves
-- Select movies with ratings greater than ALL Marvel Movies.

-- kEYWORD: ALL, ANY, SOME, IN  


select * from actors;
select * from movies; 
select * from movie_actor;

-- Brute force approach using joins 
select mv.movie_id, mv.title , act.name from movies as mv inner join movie_actor as ma on  mv.movie_id=ma.movie_id inner join 
actors as act on act.actor_id=ma.actor_id where mv.movie_id in (101,110,121);

-- Method 2 
select * from actors where actor_id in (select actor_id from movie_actor  where movie_id in (101,110,121));
select * from actors where actor_id = ANY (select actor_id from movie_actor  where movie_id in (101,110,121));

-- List of Movies which rating is greater than ANY marvel movies. 
SELECT * FROM movies WHERE imdb_rating > (SELECT min(imdb_rating) FROM movies WHERE studio='Marvel Studios') ;
SELECT * FROM movies WHERE imdb_rating > ANY (SELECT (imdb_rating) FROM movies WHERE studio='Marvel Studios') ;

-- List of Movies whose ratings are greater than ALL marvel movies
select * from movies where imdb_rating > ALL (select imdb_rating from movies where studio='Marvel Studios');
select * from movies where imdb_rating >(select max(imdb_rating) from movies where studio = 'Marvel Studios');


-- Method 3. 
select* from movie_actor inner join (select * from actors where actor_id in (select actor_id from movie_actor  where movie_id in (101,110,121))) as actor_name
on movie_actor.actor_id=actor_name.actor_id inner join movies on movies.movie_id=movie_actor.movie_id;