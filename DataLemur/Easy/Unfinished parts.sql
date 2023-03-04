/*Tesla is investigating bottlenecks in their production, and they need your help to extract the relevant data. Write a query that determines 
which parts have begun the assembly process but are not yet finished.

Assumptions

•Table parts_assembly contains all parts in production.
•A part with no finish_date is an unfinished part.

I have answered  SQL question that was asked in a job interview at Tesla.*/

SELECT distinct part
FROM parts_assembly
where finish_date  is null 
group by part ;