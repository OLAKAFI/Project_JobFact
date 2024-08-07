--- Monthly Frequency of data analayst roles
SELECT
    COUNT(job_id) AS job_id_count,
    EXTRACT(MONTH FROM job_posted_date:: DATE) as month
FROM 
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    job_id_count DESC;


--- FIND AVERAGE SALARY YEARLY AND HOURLY
SELECT
    EXTRACT(YEAR FROM job_posted_date:: DATE) AS job_year,
    AVG(salary_year_avg) as job_average_salary
FROM 
    job_postings_fact
GROUP BY
    job_year;


SELECT
    EXTRACT(HOUR FROM job_posted_date) AS job_hour,
    AVG(salary_hour_avg) as job_average_salary
FROM 
    job_postings_fact
WHERE 
    job_posted_date > '2023-6-01'
GROUP BY
    job_hour
ORDER BY
    job_average_salary DESC;



--- Count Job posting for each month in 2023
SELECT
    COUNT(job_id) AS job_id_count,
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST') AS month
FROM 
    job_postings_fact
WHERE 
    EXTRACT(YEAR FROM job_posted_date) = 2023
GROUP BY
    month
ORDER BY
    month;


--- Find companies that have posted job offering health insurance
---- in the second quarter of 2023

SELECT distinct(company_dim.name), job_postings_fact.company_id
FROM job_postings_fact
JOIN company_dim
ON job_postings_fact.company_id = company_dim.company_id
WHERE (job_health_insurance = TRUE) AND (EXTRACT(YEAR FROM job_posted_date:: DATE) = 2023)
AND EXTRACT(MONTH FROM job_posted_date:: DATE) BETWEEN 3 AND 6
ORDER BY company_dim.name;


-- Classify the average_yearly_salary of Data Analysts.
SELECT count(job_id),
CASE
    WHEN salary_year_avg BETWEEN 80000 AND 100000 THEN 'High Paying'
    WHEN salary_year_avg BETWEEN 60000 AND 80000 THEN 'Medium Paying'
    WHEN salary_year_avg BETWEEN 30000 AND 50000 THEN 'Low Paying'
    WHEN salary_year_avg = NULL THEN 'Unknown'
    ELSE 'Unclassified'
END AS salary_class
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY salary_class
;


--- Find the most mentioned skills mentioned in the job postings
WITH popular_skills AS (
    SELECT skill_id, COUNT(skill_id) as skills_count
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY skillS_count DESC
)

SELECT popular_skills.skill_id, skills_dim.skills, popular_skills.skills_count
FROM popular_skills
LEFT JOIN skills_dim
ON popular_skills.skill_id = skills_dim.skill_id
ORDER BY skills_count DESC
LIMIT 5;


---Categorize companies into small, medium and large based on
--- job postings

WITH company_job_count AS 
(
    SELECT company_id, count(job_id) as total_jobs
    FROM job_postings_fact
    GROUP BY company_id
    ORDER BY total_jobs DESC
)

SELECT company_dim.name,company_job_count.total_jobs,
CASE
    WHEN total_jobs < 10 THEN 'Small'
    WHEN total_jobs BETWEEN 10 AND 50 THEN 'Medium'
    WHEN total_jobs > 50 THEN 'Large' 
END AS company_size_jobpost
FROM company_job_count
LEFT JOIN company_dim
ON company_dim.company_id = company_job_count.company_id
ORDER BY total_jobs DESC;


--- Find the number of TOP 5 skills per job post for data analyst roles
WITH required_skills AS (
    SELECT skills_job_dim.skill_id , count(*) as skills_count
    FROM skills_job_dim
    INNER JOIN job_postings_fact
    ON skills_job_dim.job_id = job_postings_fact.job_id
    WHERE job_work_from_home = true AND job_title_short = 'Data Analyst'
    GROUP BY skills_job_dim.skill_id
    ORDER BY skills_count DESC
)

SELECT required_skills.skill_id, skills_dim.skills, required_skills.skills_count
FROM required_skills
JOIN skills_dim
ON required_skills.skill_id = skills_dim.skill_id
ORDER BY skills_count DESC
LIMIT 5
;


--- Find job posting from the first quarter that have a salary > 70k
--- Combine job posting tables from the first quarter of 2023
---- Get job posting with an average yearly salary of >$70k

WITH first_quarter_posts AS (
    SELECT *
    FROM jan_jobs_posts

    UNION

    SELECT *
    FROM feb_jobs_posts

    UNION

    SELECT *
    FROM mar_jobs_posts
)

SELECT *
FROM first_quarter_posts
WHERE salary_year_avg > 70000
ORDER BY salary_year_avg DESC;