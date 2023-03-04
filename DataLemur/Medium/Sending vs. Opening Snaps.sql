/*Assume you are given the tables below containing information on Snapchat users, their ages, and their time spent sending and opening snaps. 
Write a query to obtain a breakdown of the time spent sending vs. opening snaps (as a percentage of total time spent on these activities) for 
each age group.
Output the age bucket and percentage of sending and opening snaps. Round the percentage to 2 decimal places.
Notes:
•You should calculate these percentages:
   •time sending / (time sending + time opening)
   •time opening / (time sending + time opening)
•To avoid integer division in percentages, multiply by 100.0 and not 100.*/

with cte as(
SELECT age.age_bucket,
 sum(case when a.activity_type='send' then a.time_spent else 0 end) as time_sending,
 sum(case when a.activity_type='open' then a.time_spent else 0 end) as time_opening,
 sum(a.time_spent) as total_timespent
FROM activities as a
join age_breakdown as age 
on age.user_id = a.user_id
WHERE a.activity_type IN ('send', 'open')
group by age.age_bucket
)
select age_bucket , 
  ROUND(100.0 * time_sending / total_timespent, 2) AS send_perc, 
  ROUND(100.0 * time_opening / total_timespent, 2) AS open_perc 
from cte;