


#  Month, prodcut name, variant, sold quantity, gross price per item, gross price total 
# for CROMA in year fiscal year 2021

select * from dim_customer;
select * from dim_product;
select * from fact_forecast_monthly;
select * from fact_freight_cost;
select * from fact_gross_price;
select * from fact_manufacturing_cost;
select * from fact_post_invoice_deductions;
select * from fact_pre_invoice_deductions;
select * from fact_sales_monthly;


-- Month, prodcut name, variant, sold quantity, gross price per item, gross price total 

-- THIS TABLE RETURS THE PRODUCT CODES SOLD TO ONLY CROMA IN YEAR 20221 ONLY
WITH PRODUCTS_CROMA_2021 AS(
select * from (select * from fact_sales_monthly where (customer_code= (select customer_code from dim_customer where customer = 'Croma')) having ((year(date)='2020' and month(date)>='9')) OR (year(date)='2021' and month(date)<='8')) as sales_2021_croma
)

-- select * from PRODUCTS_CROMA_2021;

select month(date) as Month, product as product_name, variant, sold_quantity,gross_price,(gross_price*sold_quantity) as total_gross_price from 
PRODUCTS_CROMA_2021 as PC2021
JOIN dim_product AS dp
ON dp.product_code=PC2021.product_code
join fact_gross_price as fgp
on fgp.product_code=dp.product_code 
where fiscal_year='2021'
order by  product_name, variant,Month
;

