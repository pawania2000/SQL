/*A Microsoft Azure Supercloud customer is a company which buys at least 1 product from each product category.
Write a query to report the company ID which is a Supercloud customer.*/


with supercloud as(
SELECT c.customer_id , count(distinct p.product_category) as category_count
FROM customer_contracts c
left join products p
on c.product_id = p.product_id 
group by c.customer_id)
select customer_id
from supercloud
where category_count = (select count(distinct product_category)
  from products)
order by customer_id;