/*
Generate a yearly report for Croma India where there are two columns
1. Fiscal Year
2. Total Gross Sales amount In that year from Croma
*/

select * from fact_sales_monthly where customer_code = 90002002 ;
select * from fact_gross_price;


select fiscal_year,round(sum(gross_price*sold_quantity),2) as total_sales from 
fact_sales_monthly as fsm
join fact_gross_price as fgp
on fsm.product_code=fgp.product_code and get_fiscal_year(fsm.date)=fgp.fiscal_year
where customer_code = 90002002
group by fiscal_year 
order by fiscal_year asc;
