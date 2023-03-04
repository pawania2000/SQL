/*Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. 
You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.*/

--I have answered  SQL question that was asked in a job interview at LinkedIn.

--Approach 1

select distinct candidate_id 
from candidates
where skill IN('Python','Tableau','PostgreSQL')
GROUP BY candidate_id
having count(skill)=3;

--Approach 2

SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3;
