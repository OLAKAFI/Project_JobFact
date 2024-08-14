
#   Introduction
Dive into the data jobs market! Focusing on data analyst roles, this project explores top-paying jobs, in demand skills, and where optimal skills (high demand skills and high paying jobs) in data analytics.

SQL queries? Check them out here: [project_queries](/project_queries/)


#   Background
This project is driven by a quest to navigate the data analyst job market more effectively, this project was inspired by the desire to highlight top-paid and in-demand skills streamlining others work ro find optimal jobs.

The source of the data utilized is from [SQL Course](https://lukebarouuse.com/sql). It contains insights on the job titles, average anual salaries, job locations, essential skills, among other relavant datas such as heath insurance avaialability, option to WFH, ect.

### The questions I want to answer through my SQL queries are listed as below:

1. What are the top-paying data analyst jobs?
2.  What skills are required for these htop-paying jobs?
3.  Which skills are most in demand for data analysts?
4.  Which skills are associated with higher salaries?
5.  What ate the most optimal skills to learn, skills that are both  in high demand and high paying?


#   Tools I used
For my deep dice into the data analyst job market, I utilized the power of several key tools:

- **SQL:** This is the foundation on which my analysis is based.   SQL allows me to query the database and delineate critical insights.
- **PostgreSQL:** This is the chosen database management system for this project.
-**Visual Studio Code:** This is the code editor used to write the queries and also organize this [README FILE](/README.md). Visual Studio Code build a connection to the PostgreSQL system to access the database for this project.
- **Git and Github:** This is used to sharing and hosting the project for easy collaboration and project monitoring/tracking.


#   The Analysis
Each query for this project aimed at ivestigating specific aspects of the data analyst job market. The approach to each questions are detailed below by individually addressing some the questions highlighted above in the Background Section:

### 1.  Top Paying Data Analyst Jobs
To identify the highest-paying roles, Data analyst role is filtered by average anual salary and location, focusing on only remote jobs. This query highlights the high paying opportunities in the field.


```sql
SELECT company_dim.name as company, job_title_short, job_country, job_schedule_type, salary_year_avg,job_health_insurance, job_posted_date
FROM job_postings_fact
LEFT JOIN company_dim
ON job_postings_fact.company_id = company_dim.company_id
WHERE salary_year_avg IS NOT NULL AND job_title_short = 'Data Analyst' AND job_work_from_home = TRUE
ORDER BY salary_year_avg DESC
LIMIT 10;
```

Above is the breakdown of the top data analyst jobs in 2023 according to the data:

### Some Insights
-**Wide Salary Rnage:** Top 10 paying data analyst roles span from $184,000 to $650,000. This signifies the salary potential of these role.

- **Diverse Employers:** It can also be deduced that companies like SmartAsset, Meta, and AT&T are among those that offers high salaries. Another insight that can deduced is the industry diversity of these top paying companies.
- **Job Title Variety:** High diversity in job title is discovered in these set ranging from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.


### 2.  Top Paying Data Analyst Skills
To identify the highest-paying roles, Data analyst role is filtered by average anual salary and location, focusing on only remote jobs. This query highlights the high paying opportunities in the field.


```sql
WITH top_pay_DA AS (
    SELECT job_id, company_dim.name as company, job_title, salary_year_avg
    FROM job_postings_fact
    LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
    WHERE salary_year_avg IS NOT NULL AND job_title_short = 'Data Analyst' AND job_work_from_home = TRUE
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT top_pay_DA.*, skills_dim.skills 
FROM top_pay_DA
INNER JOIN skills_job_dim
ON top_pay_DA.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;
```

Above is the breakdown of the top data analyst jobs in 2023 according to the data:

### Some Insights
-**Wide Salary Rnage:** Top 10 paying data analyst roles span from $184,000 to $650,000. This signifies the salary potential of these role.

- **Diverse Employers:** It can also be deduced that companies like SmartAsset, Meta, and AT&T are among those that offers high salaries. Another insight that can deduced is the industry diversity of these top paying companies.
- **Job Title Variety:** High diversity in job title is discovered in these set ranging from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.


### 3.  Top In Demand Skills for Data Analysts
To identify the highest-paying roles, Data analyst role is filtered by average anual salary and location, focusing on only remote jobs. This query highlights the high paying opportunities in the field.


```sql
SELECT skills_job_dim.skill_id,skills, count(*) as skill_demand
FROM skills_job_dim
INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY skills_job_dim.skill_id, skills
ORDER BY skill_demand DESC
LIMIT 5
;
```

Above is the breakdown of the top data analyst jobs in 2023 according to the data:

### Some Insights
-**Wide Salary Rnage:** Top 10 paying data analyst roles span from $184,000 to $650,000. This signifies the salary potential of these role.

- **Diverse Employers:** It can also be deduced that companies like SmartAsset, Meta, and AT&T are among those that offers high salaries. Another insight that can deduced is the industry diversity of these top paying companies.
- **Job Title Variety:** High diversity in job title is discovered in these set ranging from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.


### 4.  Top Skills for Data Analysts Based on Salary
To identify the highest-paying roles, Data analyst role is filtered by average anual salary and location, focusing on only remote jobs. This query highlights the high paying opportunities in the field.


```sql
SELECT skills, ROUND(AVG(salary_year_avg)) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND  salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25
;
```

Above is the breakdown of the top data analyst jobs in 2023 according to the data:

### Some Insights
-**Wide Salary Rnage:** Top 10 paying data analyst roles span from $184,000 to $650,000. This signifies the salary potential of these role.

- **Diverse Employers:** It can also be deduced that companies like SmartAsset, Meta, and AT&T are among those that offers high salaries. Another insight that can deduced is the industry diversity of these top paying companies.
- **Job Title Variety:** High diversity in job title is discovered in these set ranging from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.


### 5.  Optimal Skills for Data Analysts (Both High Demand and High Paying)
To identify the highest-paying roles, Data analyst role is filtered by average anual salary and location, focusing on only remote jobs. This query highlights the high paying opportunities in the field.


```sql
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
```

Above is the breakdown of the top data analyst jobs in 2023 according to the data:

### Some Insights
-**Wide Salary Rnage:** Top 10 paying data analyst roles span from $184,000 to $650,000. This signifies the salary potential of these role.

- **Diverse Employers:** It can also be deduced that companies like SmartAsset, Meta, and AT&T are among those that offers high salaries. Another insight that can deduced is the industry diversity of these top paying companies.
- **Job Title Variety:** High diversity in job title is discovered in these set ranging from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.



#   What I Learned
Throughout this project, i have moved from writing simple queries into advanced queries:

- **Complex Queries Crafting:** Mastered the art of advanced SQL, merging tables like a pro and utilizing CTES and Temp tables effectively. I have also learn that there are several methods/ways of writing the same queries and the ability to choose the most effective method for readability.

- **Data Aggregration:** Aggregration is one of the useful syntax functions that i have learned in this project as it help to easily get insight from query results.

- **Analytical Skills:** From this project i have improved my analytical skills by crafting the relevant questions that addresses the problem i set out to solve and also converting this questions into actionable and insighful SQL queries.

#   Conclusion

### Insights
include some insights from the 5 analysis

### Closing Thoughts
This project enhanced my SQL skills and provided valuable insights into the data analyst job market in the data utilized. The discoveries from the critical analyst serve as a guide to prioritizing skills development and job search efforts. Aspiring Data Analysts can better position themselves in a competitive job market by focusing on Optimal Skills (high-demand, high-salary skills) in this role. Furthermore, this exploraion highlights the importance of continous learning and adaptation to emerging trends in the field of Data Analysis.



