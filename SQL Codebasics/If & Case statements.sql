
-- Calculate age from birth year using CURDATE function
select *, YEAR(CURDATE())-birth_year as age from actors order by age;


-- if condition for 2 possibilities (INR, USD) only
select *, 
if (currency='INR', 'Indian Rupee', 'US dollar') as Note
 from financials;
 
 -- for more than 2 conditions use case
 -- bring revenue to same unit
 -- Billions ---> Millions = revenue*1000
 -- Thousands ---> Millions = revenue/100

 
SELECT *, 
	CASE
		WHEN unit='thousands' THEN revenue/1000
		WHEN unit='Billions' THEN revenue*1000
        ELSE revenue
	END as revenue_mln
FROM moviesdb.financials;



-- Converting Currencies from Rupee to dollar and vice versa
-- using above query as sub query

SELECT *, 
	CASE
		WHEN currency='INR'THEN revenue_mln/100
        ELSE revenue_mln
     END AS currency_dolar_mln,2
     ,
     CASE
		WHEN currency='USD'THEN revenue_mln*100
        ELSE revenue_mln
     END AS currency_rupees_mln
FROM 
	(SELECT *, 
		CASE
			WHEN unit='thousands' THEN revenue/1000
			WHEN unit='Billions' THEN revenue*1000
			ELSE revenue
		END as revenue_mln
	FROM moviesdb.financials) as table1;