# Standard deviation is a technique used in the data industry for an outlier removal. 
# A business manager decided that any imdb_rating (in our movies table) that is plus or minus one standard deviation 
# away from an average (which is 7.95) is considered an outlier. Write a query that prints these outliers.alter



#Standard deviation is a technique used in the data industry for an outlier removal. 
#A business manager decided that any imdb_rating (in our movies table) 
#that is plus or minus one standard deviation away from an average (which is 7.95) is considered an outlier. 
#Write a query that prints these outliers,

select round(avg(imdb_rating),2) from movies; 
select round(stddev(imdb_rating),2) from movies;

# CTE to calculate upper and lower bound
with 
	upper_bound as(
		select round(avg(imdb_rating)+stddev(imdb_rating),2) from movies
	),
    lower_bound as(
		select round(avg(imdb_rating)-stddev(imdb_rating),2) from movies
)

# Anyting above upper_bound and below_lower bound is outlier.
select * from movies where imdb_rating >(select * from upper_bound) OR imdb_rating<(select * from lower_bound) order by imdb_rating;


# Write a query to select most youngest and oldest 3 actors from our movies database
(select * 
from actors order by birth_year LIMIT 3)
UNION
(select * 
from actors order by birth_year DESC LIMIT 3) order by birth_year;


#Write a query to display 6th highest imdb_rating from movies table
SELECT * FROM movies ORDER BY imdb_rating DESC LIMIT 1 OFFSET 5