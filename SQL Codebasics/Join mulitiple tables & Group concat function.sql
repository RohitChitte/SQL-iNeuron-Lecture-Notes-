-- Requirement 1 : actor name ---> list of movies for actor

select * from actors;
select * from movies;
select * from movie_actor;

-- Get the count of Actors in each movie. 

select m.title, group_concat(a.name SEPARATOR " | ") as actors, count(a.name) as actor_count
from 
movies m JOIN movie_actor  ma
on ma.movie_id = m.movie_id
join actors a on a.actor_id=ma.actor_id
group by m.movie_id 
order by actor_count desc
;

-- get the count of movies done by each actor in single row
 
select 
a.name, group_concat(m.title separator " | ")  as movies, 
count(m.title) as movie_count
from 
actors a join movie_actor ma on ma.actor_id=a.actor_id
join movies m on m.movie_id=ma.movie_id group by a.actor_id
order by movie_count desc;

