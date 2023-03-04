/*Assume you are given the table containing measurement values obtained from a Google sensor over several days. Measurements are taken several 
times within a given day.
Write a query to obtain the sum of the odd-numbered and even-numbered measurements on a particular day, in two different columns. Refer to the 
Example Output below for the output format.
Definition:
•1st, 3rd, and 5th measurements taken within a day are considered odd-numbered measurements and the 2nd, 4th, and 6th measurements are even-numbered measurements.*/



with measurements as(
SELECT CAST(measurement_time AS DATE) AS measurement_day , measurement_value,
  row_number() over (partition by cast(measurement_time as DATE)order by measurement_time) as num
from measurements)
select measurement_day,
 sum(case when num%2!=0 then measurement_value else 0 end) as odd,
 sum(case when num%2=0 then measurement_value else 0 end) as even
from measurements
group by measurement_day;