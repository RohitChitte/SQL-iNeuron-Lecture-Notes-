select * from actors;
select * from financials;
select * from languages;
select * from movie_actor;
select * from movies;

-- 1) Print profit % for all the movies  
select mv.title, ((fn.revenue-fn.budget)/fn.budget)*100 as profit_percent from movies as mv inner join financials as fn on mv.movie_id=fn.movie_id;


-- Codebasic solution 
select *, (revenue-budget) as profit, (revenue-budget)*100/budget as profit_pct from financials;
   