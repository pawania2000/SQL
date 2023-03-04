/*Assume that you are given the table below containing information on viewership by device type (where the three types are laptop, tablet, and phone). Define 
“mobile” as the sum of tablet and phone viewership numbers. Write a query to compare the viewership on laptops versus mobile devices.
Output the total viewership for laptop and mobile devices in the format of "laptop_views" and "mobile_views".*/

--I have answered  SQL question that was asked in a job interview at New York Times.

--Approach 1

SELECT 
  sum(CASE WHEN device_type= 'laptop' THEN 1 ELSE 0 END) AS laptop_views, 
  sum(CASE WHEN device_type IN ('phone', 'tablet') THEN 1 ELSE 0 END) AS mobile_views 
FROM viewership;

--Approach 2

SELECT 
  COUNT(*) FILTER (WHERE device_type = 'laptop') AS laptop_views,
  COUNT(*) FILTER (WHERE device_type IN ('phone', 'tablet')) AS mobile_views
FROM viewership;
