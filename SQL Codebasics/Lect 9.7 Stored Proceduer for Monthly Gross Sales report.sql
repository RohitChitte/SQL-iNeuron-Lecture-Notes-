# Query to get customer_code for Croma
select * from dim_customer where customer like "%Croma%";

#Get Monthly Gross sales for particular customer
select date,sum(gross_price*sold_quantity) as total_sales from 
fact_sales_monthly as fsm
join fact_gross_price as fgp
on fsm.product_code=fgp.product_code and get_fiscal_year(fsm.date)=fgp.fiscal_year
 where customer_code = 90002002
 group by date
 ;
 
 
 # Creating Stored Proceduer from above query
 /*
 CREATE PROCEDURE get_monthly_gross_sales_for_customer (
	in_customer_code TEXT
)
BEGIN
	select date,sum(gross_price*sold_quantity) as total_sales from 
	fact_sales_monthly as fsm
	join fact_gross_price as fgp
	on fsm.product_code=fgp.product_code and get_fiscal_year(fsm.date)=fgp.fiscal_year
	 where find_in_set(fsm.customer_code, in_customer_code)>0
     group by date;
END
*/