/*Assume you have an events table on app analytics. Write a query to get the app’s click-through rate (CTR %) in 2022. Output the results in percentages rounded to 
2 decimal places.
Notes:
•Percentage of click-through rate = 100.0 * Number of clicks / Number of impressions
•To avoid integer division, you should multiply the click-through rate by 100.0, not 100.*/

--I have answered  SQL question that was asked in a job interview at Facebook.

--Approach 1

SELECT app_id , 
  round(100.0*sum(case when event_type='click' then 1 else 0 end)/
  sum(case when event_type='impression' then 1 else 0 end),2) as ctr
FROM events
where timestamp >= '2022-01-01' AND timestamp < '2023-01-01'
group by app_id;

--Approach 2

SELECT
  app_id,
  ROUND(100.0 *
    COUNT(CASE WHEN event_type = 'click' THEN 1 ELSE NULL END) /
    COUNT(CASE WHEN event_type = 'impression' THEN 1 ELSE NULL END), 2)  AS ctr_rate
FROM events
WHERE timestamp >= '2022-01-01' 
  AND timestamp < '2023-01-01'
GROUP BY app_id;
