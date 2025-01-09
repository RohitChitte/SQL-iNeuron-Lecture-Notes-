

select * from
fact_sales_monthly as fsm
join dim_product as dm
on fsm.product_code=dm.product_code
join fact_gross_price as fgp
on fgp.product_code=fsm.product_code and fgp.fiscal_year=get_fiscal_year(fsm.date)
where fsm.customer_code=90002002
and fiscal_year(fsm.date)=2021
limit 100000;