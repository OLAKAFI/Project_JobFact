-- What are the top optimal skills
-- High paying and high demand Skills

-- Method 1
SELECT skills,  COUNT(skills_job_dim.skill_id) AS skills_demand, ROUND(AVG(salary_year_avg)) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND  salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY skills_demand DESC, avg_salary DESC
LIMIT 25
;

--- Method 2 Using CTEs
WITH skill_demand_CTE AS (
    SELECT skills_job_dim.skill_id,skills, count(*) as skill_demand
    FROM skills_job_dim
    INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' AND  salary_year_avg IS NOT NULL
    GROUP BY skills_job_dim.skill_id, skills
), salary_demand_CTE AS(

    SELECT skills_job_dim.skill_id, skills, ROUND(AVG(salary_year_avg)) as avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' AND  salary_year_avg IS NOT NULL
    GROUP BY skills_job_dim.skill_id, skills
)

SELECT skill_demand_CTE.skills, skill_demand_CTE.skill_demand, salary_demand_CTE.avg_salary
FROM skill_demand_CTE
INNER JOIN salary_demand_CTE
ON skill_demand_CTE.skill_id = salary_demand_CTE.skill_id
ORDER BY skill_demand DESC, avg_salary DESC
LIMIT 25;
