/*The table below contains information about tweets over a given period of time. Calculate the 3-day rolling average of tweets published by 
each user for each date that a tweet was posted. Output the user id, tweet date, and rolling averages rounded to 2 decimal places.
Important Assumptions:
•Rows in this table are consecutive and ordered by date.
•Each row represents a different day
•A day that does not correspond to a row in this table is not counted. The most recent day is the next row above the current row.
Note: Rolling average is a metric that helps us analyze data points by creating a series of averages based on different subsets of a dataset. 
It is also known as a moving average, running average, moving mean, or rolling mean.*/

with tweet as(
SELECT user_id , tweet_date , count(*) as rolling
FROM tweets
group by user_id , tweet_date
order by user_id , tweet_date
)
select user_id , tweet_date,ROUND(
  AVG(rolling) OVER (PARTITION BY user_id
  ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) as rolling_3
from tweet;