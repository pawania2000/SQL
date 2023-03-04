/*Assume you are given the table containing information on Amazon customers and their spending on products in various categories.
Identify the top two highest-grossing products within each category in 2022. Output the category, product, and total spend..*/


with highest_gross as(
select category , product , sum(spend) as total 
from product_spend
where transaction_date >='2022-01-01' and transaction_date < '2023-01-01'
group by category , product 
order by category , total desc
),
top_spend as(
select * ,RANK() OVER (PARTITION BY category order by total desc) as ranking
from highest_gross
)
select category , product , total
from top_spend
where ranking<=2;