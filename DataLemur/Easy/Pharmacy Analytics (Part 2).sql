/*CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. Each drug can only be produced by one manufacturer.
Write a query to find out which manufacturer is associated with the drugs that were not profitable and how much money CVS lost on these drugs. 
Output the manufacturer, number of drugs and total losses. Total losses should be in absolute value. Display the results with the highest losses on top.*/

--I have answered  SQL question that was asked in a job interview at CVS Health.

SELECT manufacturer , 
  count(drug) as drug_count , 
  ABS(sum(total_sales - cogs)) as total_loss
FROM pharmacy_sales
where total_sales<=cogs
group by manufacturer
order by total_loss desc;
