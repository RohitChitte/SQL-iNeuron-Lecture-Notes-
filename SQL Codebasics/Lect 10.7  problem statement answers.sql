

select 
market,
round(sum(net_sales)/1000000,2) as net_sales_mln 
from net_sales 
where fiscal_year=2021 
group by market 
order by net_sales_mln desc limit 5;

select 
customer,
round(sum(net_sales)/1000000,2) as net_sales_mln  
from net_sales as ns
join dim_customer as dc
on dc.customer_code=ns.customer_code
where fiscal_year=2021
group by customer
order by net_sales_mln desc limit 5;



