select * 
from data_analyst_jobs;

--Q1 How many rows are in the data_analyst_jobs table?

SELECT count (*) 
FROM data_analyst_jobs;

--Q1_Answer: 1793

--Q2 Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;

--Q2_Answer: ExxonMobil

--Q3 How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT count (*) 
FROM data_analyst_jobs
WHERE location = 'TN';

SELECT count (*)
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';

/*Q3_Answer: 
TN Listings = 21
TN+KY Listings = 27 */

--Q4 How many postings in Tennessee have a star rating above 4?

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE location = 'TN'
    AND star_rating > 4;
    
--Q4_Answer: 3

--Q5 How many postings in the dataset have a review count between 500 and 1000?

SELECT * FROM data_analyst_jobs;

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--Q5_Answer: 151

--Q6 Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?

SELECT *
FROM data_analyst_jobs;

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY state
ORDER BY avg_rating DESC;

--Q6_Answer: NE

--Q7 Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT *
FROM data_analyst_jobs;

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

--Q7_Answer: 881

--Q8 How many unique job titles are there for California companies?

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

--Q8_Answer: 230

--Q9 Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT *
FROM data_analyst_jobs;

SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count >5000 
    AND company IS NOT NULL
GROUP BY company;

--Q9_Answer: 40

--Q10 Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count >5000 
    AND company IS NOT NULL
GROUP BY company
ORDER BY avg_rating DESC;

--Q10_Answer: Unilever, 4.2. Answer 

--Q11 Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

SELECT *
FROM data_analyst_jobs;

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%'
    OR title LIKE '%analyst%'
    OR title LIKE '%ANALYST%';

--Q11_Answer: 774

--Q12 How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT DISTINCT(title)
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%'
    AND title NOT LIKE '%Analytics%'
    AND title NOT LIKE '%ANALYST%'
    AND title NOT LIKE '%ANALYTICS%'
    AND title NOT LIKE '%analytics%'
    AND title NOT LIKE '%analyst%';

    
--Q12_Answer: Tableau

/* BONUS
You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
Disregard any postings where the domain is NULL.
Order your results so that the domain with the greatest number of hard to fill jobs is at the top.
Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?*/

SELECT *
FROM data_analyst_jobs;

SELECT count(*)
FROM data_analyst_jobs
WHERE days_since_posting > 21
    AND domain IS NOT NULL
    AND skill LIKE '%SQL%';
    
SELECT domain, count(title)
FROM data_analyst_jobs
WHERE days_since_posting > 21
    AND domain IS NOT NULL
    AND skill LIKE '%SQL%'
    group by domain
    order by count(title) desc;

/*BONUS_Answer:
# of Jobs requiring SQL posted 3+ Weeks: 403
Top 4 Industries:
- Internet and Software: 62
- Banks and Financial Services: 61
- Consulting and Business Services: 57
- Healthcare: 52
*/


             
             
             
    