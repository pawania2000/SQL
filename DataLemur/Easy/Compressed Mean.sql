/*You are trying to find the mean number of items bought per order on Alibaba, rounded to 1 decimal place.

However, instead of doing analytics on all Alibaba orders, you have access to a summary table, which describes how many items were in an order
(item_count), and the number of orders that had that many items (order_occurrences).

I have answered  SQL question that was asked in a job interview at Alibaba.*/

--Approach 1

SELECT 
   ROUND(SUM(item_count::DECIMAL*order_occurrences)/SUM(order_occurrences),1) AS mean
FROM items_per_order;

--Approach 2

SELECT 
   ROUND(CAST(SUM(item_count * order_occurrences) AS DECIMAL) / SUM(order_occurrences), 1) AS means
FROM items_per_order;
