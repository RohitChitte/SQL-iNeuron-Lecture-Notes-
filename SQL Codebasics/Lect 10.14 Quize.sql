
WITH CTE1 as
(
select 
dc.market,
dc.region,
round(sum(fsm.sold_quantity*fgp.gross_price)/1000000,2) as gross_sales_mln
from dim_customer as dc
join fact_sales_monthly as fsm
on fsm.customer_code=dc.customer_code
join dim_product as dp 
on dp.product_code=fsm.product_code
join fact_gross_price as fgp 
on fgp.product_code=fsm.product_code and fgp.fiscal_year=fsm.fiscal_year
where fgp.fiscal_year=2021
group by dc.market,dc.region
)


select * from 
(select *,dense_rank() over(partition by region order by gross_sales_mln desc) as drank from CTE1) 
as T where drank<=2;

