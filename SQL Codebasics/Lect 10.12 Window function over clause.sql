with CTE1 as
(select 
	customer,
    region,
    round(sum(net_sales)/1000000,2) as net_sales_mln
from net_sales ns
join dim_customer dc
on dc.customer_code=ns.customer_code
where ns.fiscal_year=2021
group by customer,region
)

select *,
		(net_sales_mln*100)/sum(net_sales_mln) over(partition by region)
from CTE1
order by net_sales_mln desc

