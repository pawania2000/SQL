/*Your team at JPMorgan Chase is soon launching a new credit card. You are asked to estimate how many cards you'll issue in the first month.
Before you can answer this question, you want to first get some perspective on how well new credit card launches typically do in their first 
month.
Write a query that outputs the name of the credit card, and how many cards were issued in its launch month. The launch month is the earliest 
record in the monthly_cards_issued table for a given card. Order the results starting from the biggest issued amount.*/



with card_launch as(
SELECT card_name,issued_amount,MAKE_DATE(issue_year, issue_month, 1) as issue_date,
  min(MAKE_DATE(issue_year, issue_month, 1)) over (partition by card_name) as launch
FROM monthly_cards_issued)
select card_name,issued_amount
from card_launch
where issue_date=launch
order by issued_amount desc;