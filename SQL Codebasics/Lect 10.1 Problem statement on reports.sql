# 3 Problem Statements
# 1. Report to for Top Markets (Rank, Market, NetSales)
# 2. Report for Top Products (Rank, Product, NetSales)
# 3. Report for Top Customers (Rank, Customers, NetSales)

# Note: NetSales needs to be calculated
# Gross Price-Pre invoice Deduction = Net Invoice Sales
# Net Invoice Sales - Post invoice deductions = Net Sales

select * from dim_customer;
select * from fact_sales_monthly;
select * from fact_gross_price;
select * from fact_pre_invoice_deductions; 
select * from fact_post_invoice_deductions;

-- fsm.product_code,fsm.customer_code,fsm.sold_quantity,dc.market, fgp.fiscal_year,fgp.gross_price,fpid.pre_invoice_discount_pct,fpostid.discount_pct
# Note: This is my approach, approach followed in video is different
select 
fiscal_year,market,sum(sold_quantity*((1-discounts_pct)*pre_inv_disc)) as Net_Sales
from 
(
select 
fsm.product_code, fsm.customer_code, fsm.sold_quantity, 
dc.market, fgp.fiscal_year, fgp.gross_price,
fpid.pre_invoice_discount_pct,fpostid.discounts_pct,
(1-fpid.pre_invoice_discount_pct)*fgp.gross_price as pre_inv_disc
from fact_sales_monthly as fsm
join dim_customer as dc 
on dc.customer_code = fsm.customer_code
join fact_gross_price as fgp
on fgp.product_code=fsm.product_code and fgp.fiscal_year=get_fiscal_year(fsm.date)
join fact_pre_invoice_deductions as fpid
on fpid.customer_code=fsm.customer_code and fpid.fiscal_year=fgp.fiscal_year
join fact_post_invoice_deductions as fpostid
on fpostid.customer_code=fsm.customer_code and fpid.fiscal_year=get_fiscal_year(fpostid.date)
-- limit 100000
) 
as T
group by market,fiscal_year
order by Net_Sales desc;
