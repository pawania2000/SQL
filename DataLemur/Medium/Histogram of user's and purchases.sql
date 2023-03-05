/*Assume you are given the table on Walmart user transactions. Based on a user's most recent transaction date, write a query to obtain the users
and the number of products bought.
Output the user's most recent transaction date, user ID and the number of products sorted by the transaction date in chronological order.*/



with histogram as(
SELECT transaction_date,user_id ,product_id,
  RANK() OVER (
    PARTITION BY user_id 
    ORDER BY transaction_date DESC) AS days_rank 
FROM user_transactions)
select transaction_date,user_id,count(product_id) as counting
from histogram
where days_rank=1
group by transaction_date,user_id
order by transaction_date,user_id;