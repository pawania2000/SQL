/*Assume you are given the tables below about Facebook pages and page likes. Write a query to return the page IDs of all the Facebook pages 
that don't have any likes. The output should be in ascending order.*/

--I have answered  SQL question that was asked in a job interview at Facebook.

SELECT p.page_id
FROM pages p
left join page_likes l
on p.page_id = l.page_id
where l.page_id is null ;
