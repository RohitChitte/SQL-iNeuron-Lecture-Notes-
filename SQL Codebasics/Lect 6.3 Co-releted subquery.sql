-- Table with actor_id, actor_name, mvoies count

-- Using joins
-- grouping on actor id on movie_actor table and joining it with actors table
select actors.actor_id, actors.name,movie_count from actors inner join (select actor_id,count(movie_id) movie_count from movie_actor group by actor_id) as movie_count_t 
on actors.actor_id=movie_count_t.actor_id order by movie_count desc;

-- Joining the tables actor and movie_actor and then grouping.
select a.actor_id, a.name, count(ma.movie_id) as movie_count from movie_actor as ma inner join actors as a on ma.actor_id=a.actor_id group by a.actor_id order by movie_count desc;


-- Using Corelated subquery
-- Actors and number of Movies done.
select actors.actor_id, actors.name,(select count(*) from movie_actor where actor_id=actors.actor_id) as movie_count from actors order by movie_count desc;

