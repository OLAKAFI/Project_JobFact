-- What are the top optimal skills
-- High paying and high demand Skills

-- Method 1
SELECT 
    skills,  
    COUNT(skills_job_dim.skill_id) AS skills_demand,
    ROUND(AVG(salary_year_avg)) as avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND  salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY 
    skills_demand DESC, avg_salary DESC
LIMIT 25
;

--- Method 2 Using CTEs
WITH skill_demand_CTE AS (
    SELECT 
        skills_job_dim.skill_id,
        skills, count(*) as skill_demand
    FROM 
        skills_job_dim
    INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND  salary_year_avg IS NOT NULL
    GROUP BY 
        skills_job_dim.skill_id, skills
), salary_demand_CTE AS(
    SELECT 
        skills_job_dim.skill_id,
        skills, ROUND(AVG(salary_year_avg)) as avg_salary
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND  salary_year_avg IS NOT NULL
    GROUP BY 
        skills_job_dim.skill_id, skills
)


SELECT 
    skill_demand_CTE.skills, 
    skill_demand_CTE.skill_demand,
    salary_demand_CTE.avg_salary
FROM 
    skill_demand_CTE
INNER JOIN salary_demand_CTE
ON skill_demand_CTE.skill_id = salary_demand_CTE.skill_id
ORDER BY 
    skill_demand DESC, avg_salary DESC
LIMIT 25;



/**
-- Optimal Data Analysis Skills (High paying and High demand skills)
[
  {
    "skills": "sql",
    "skills_demand": "3083",
    "avg_salary": "96435"
  },
  {
    "skills": "excel",
    "skills_demand": "2143",
    "avg_salary": "86419"
  },
  {
    "skills": "python",
    "skills_demand": "1840",
    "avg_salary": "101512"
  },
  {
    "skills": "tableau",
    "skills_demand": "1659",
    "avg_salary": "97978"
  },
  {
    "skills": "r",
    "skills_demand": "1073",
    "avg_salary": "98708"
  },
  {
    "skills": "power bi",
    "skills_demand": "1044",
    "avg_salary": "92324"
  },
  {
    "skills": "sas",
    "skills_demand": "1000",
    "avg_salary": "93707"
  },
  {
    "skills": "word",
    "skills_demand": "527",
    "avg_salary": "82941"
  },
  {
    "skills": "powerpoint",
    "skills_demand": "524",
    "avg_salary": "88316"
  },
  {
    "skills": "sql server",
    "skills_demand": "336",
    "avg_salary": "96191"
  },
  {
    "skills": "oracle",
    "skills_demand": "332",
    "avg_salary": "100964"
  },
  {
    "skills": "azure",
    "skills_demand": "319",
    "avg_salary": "105400"
  },
  {
    "skills": "aws",
    "skills_demand": "291",
    "avg_salary": "106440"
  },
  {
    "skills": "go",
    "skills_demand": "288",
    "avg_salary": "97267"
  },
  {
    "skills": "flow",
    "skills_demand": "271",
    "avg_salary": "98020"
  },
  {
    "skills": "looker",
    "skills_demand": "260",
    "avg_salary": "103855"
  },
  {
    "skills": "snowflake",
    "skills_demand": "241",
    "avg_salary": "111578"
  },
  {
    "skills": "spss",
    "skills_demand": "212",
    "avg_salary": "85293"
  },
  {
    "skills": "spark",
    "skills_demand": "187",
    "avg_salary": "113002"
  },
  {
    "skills": "vba",
    "skills_demand": "185",
    "avg_salary": "93845"
  },
  {
    "skills": "sap",
    "skills_demand": "183",
    "avg_salary": "92446"
  },
  {
    "skills": "outlook",
    "skills_demand": "180",
    "avg_salary": "80680"
  },
  {
    "skills": "sharepoint",
    "skills_demand": "174",
    "avg_salary": "89027"
  },
  {
    "skills": "sheets",
    "skills_demand": "155",
    "avg_salary": "84130"
  },
  {
    "skills": "javascript",
    "skills_demand": "153",
    "avg_salary": "91805"
  }
]
**/