# Execute below 4 queries one by one to see the differenc in output

select * from expenses;
select *,row_number() over() from expenses;
select *,row_number() over(partition by category);
select *,row_number() over(partition by category order by amount) from expenses;

# Difference in Row_number(), rank(), dense_rank()

select *,
	row_number() over(partition by category order by amount) as Rn,
    rank() over(partition by category order by amount) as rnk,
    dense_rank() over(partition by category order by amount) as drnk
from expenses;

# Question: Get the top 2 expenses from each category
with CTE1 as
(
select *, 
dense_rank() over(partition by category order by amount desc) as drank 
from expenses
)
select * from CTE1 where drank<=2;

# ROW_NUMBER VS RANK VS DENSE RANK functions on students table
select *,
row_number() over(order by marks) as Rn,
rank() over(order by marks) as Rnk, 
Dense_rank() over(order by marks) as Drnk
from student_marks;


# Write a stored proceduer to get top n products in each division by their quantity sold in given financial year
# below is not SP but implemented using CTE
With CTE2 as
(
select 
dp.product,
dp.division,
sum(fsm.sold_quantity) sum_sold_quantity
from dim_product dp 
join fact_sales_monthly as fsm 
on fsm.product_code=dp.product_code
where fiscal_year=2021
group by dp.product,dp.division
)

select * from (select *,dense_rank() over(partition by division order by sum_sold_quantity desc) as drank from CTE2) as T where drank<=3 ;
