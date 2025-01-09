# Get the col percentage sales out of total sales for each customer using window func


select *,total_sales_per_cust*100/sum(total_sales_per_cust) over() as pct_of_total_sales from (
SELECT customer, round(sum(net_sales),2) as total_sales_per_cust  FROM gdb0041.net_sales ns
join dim_customer as dc
on dc.customer_code=ns.customer_code
where fiscal_year=2021
group by customer
) 
as T
order by pct_of_total_sales
desc;