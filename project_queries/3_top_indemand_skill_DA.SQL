-- What are the top indemand skills for Data Analysts
SELECT skills_job_dim.skill_id,skills, count(*) as skill_demand
FROM skills_job_dim
INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY skills_job_dim.skill_id, skills
ORDER BY skill_demand DESC
LIMIT 5
;