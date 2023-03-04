/*Assume you are given the table below on Uber transactions made by users. Write a query to obtain the third transaction of every user. Output
the user id, spend and transaction date.*/


SELECT user_id,spend,transaction_date
FROM(SELECT *,
  ROW_NUMBER() OVER (
    PARTITION BY user_id ORDER BY transaction_date) AS row_num
  FROM transactions)as trans_num
WHERE row_num=3;