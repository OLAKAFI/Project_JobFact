--- Top paying Data Analyst Jobs
--- Focus on job posting with specified salaries (Remove Nulls)
--- Indetify top 10 highest paying Data Analyst Roles available remotely
--- This is to highlight top-paying opportunities for Data Analyst

SELECT company_dim.name as company, job_title_short, job_country, job_schedule_type, salary_year_avg,job_health_insurance, job_posted_date
FROM job_postings_fact
LEFT JOIN company_dim
ON job_postings_fact.company_id = company_dim.company_id
WHERE salary_year_avg IS NOT NULL AND job_title_short = 'Data Analyst' AND job_work_from_home = TRUE
ORDER BY salary_year_avg DESC
LIMIT 10;




