#GROSS MONTHLY TOTAL SALES REPORT FOR CROMA
# As a product owner, I need an aggregate monthly gross sales report for croma india customer so that I can track how much
# sales this particular customeer is generating for AtliQ and manage our relationship accordingly .
# The Report should have the following fields
# 1. Month (Date)
# 2. Total gross sales amount to croma india in this month

select date,sum(fgp.gross_price*fsm.sold_quantity) as total_sales from 
fact_sales_monthly as fsm 
join fact_gross_price as fgp
on fsm.product_code=fgp.product_code and get_fiscal_year(fsm.date)=fgp.fiscal_year
where customer_code = 90002002
group by date 
order by date asc;