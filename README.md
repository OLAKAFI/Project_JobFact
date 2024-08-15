
#   Introduction
Dive into the data jobs market! Focusing on data analyst roles, this project explores top-paying jobs, in demand skills, and where optimal skills (high demand skills and high paying jobs) in data analytics.

SQL queries? Check them out here: [project_queries](/project_queries/)


---
---


#   Background
This project is driven by a quest to navigate the data analyst job market more effectively, this project was inspired by the desire to highlight top-paid and in-demand skills streamlining others work ro find optimal jobs.

The source of the data utilized is from [SQL Course](https://lukebarouuse.com/sql). It contains insights on the job titles, average anual salaries, job locations, essential skills, among other relavant datas such as heath insurance avaialability, option to WFH, ect.

### The questions I want to answer through my SQL queries are listed as below:

1. What are the top-paying data analyst jobs?
2.  What skills are required for these htop-paying jobs?
3.  Which skills are most in demand for data analysts?
4.  Which skills are associated with higher salaries?
5.  What ate the most optimal skills to learn, skills that are both  in high demand and high paying?


---
---


#   Tools I used
For my deep dice into the data analyst job market, I utilized the power of several key tools:

- **SQL:** This is the foundation on which my analysis is based.   SQL allows me to query the database and delineate critical insights.
- **PostgreSQL:** This is the chosen database management system for this project.
-**Visual Studio Code:** This is the code editor used to write the queries and also organize this [README FILE](/README.md). Visual Studio Code build a connection to the PostgreSQL system to access the database for this project.
- **Git and Github:** This is used to sharing and hosting the project for easy collaboration and project monitoring/tracking.


---
---


#   The Analysis
Each query for this project aimed at ivestigating specific aspects of the data analyst job market. The approach to each questions are detailed below by individually addressing some the questions highlighted above in the Background Section:

---

## 1.  Top Paying Data Analyst Jobs
To identify the highest-paying roles, Data analyst role is filtered by average anual salary and location, focusing on only remote jobs. This query highlights the high paying opportunities in the field.


```sql
SELECT 
    company_dim.name as company, 
    job_title_short, job_country, 
    job_schedule_type, 
    salary_year_avg,
    job_health_insurance,
    job_posted_date
FROM 
    job_postings_fact
LEFT JOIN company_dim
ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    salary_year_avg IS NOT NULL AND job_title_short = 'Data Analyst' AND job_work_from_home = TRUE
ORDER BY 
    salary_year_avg DESC
LIMIT 10;
```



### Some Insights
- **Wide Salary Rnage:** Top 10 paying data analyst roles span from $184,000 to $650,000. This signifies the salary potential of these role.

- **Diverse Employers:** It can also be deduced that companies like SmartAsset, Meta, and AT&T are among those that offers high salaries. Another insight that can deduced is the industry diversity of these top paying companies.

- **Job Title Variety:** High diversity in job title is discovered in these set ranging from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.

### Insights on Companies and Salaries
**Top Paying Companies:** 
Mantys (India) offers the highest average annual salary at $650,000.
Meta (United States) offers a significantly high salary at $336,500, positioning it as a leader in the U.S. market.
AT&T (United States) and Pinterest are also among the top-paying companies in the U.S., with average salaries of $255,829.5 and $232,423, respectively.

**Salary Distribution:**
The average annual salaries for these top roles range from $184,000 to $650,000, reflecting the high compensation packages offered by leading companies.
Companies like SmartAsset appear twice in the list, with slightly different salary averages, indicating different roles or levels within the same company.

**Health Insurance Offerings:**
Notably, companies such as AT&T, SmartAsset, and Get it Recruit provide health insurance as part of their job benefits, which may contribute to their attractiveness despite slightly lower salaries compared to the top-paying companies. Wheraas, other companies, including Meta, Pinterest, and Mantys, do not offer health insurance, suggesting that these companies may prioritize higher salaries over other benefits.

**Geographical Insights:**
India is represented by Mantys with a competitive salary offering. However, the U.S. dominates the list, showcasing the country’s strong demand and lucrative compensation for data analysts. The salaries in the U.S. tend to be significantly higher compared to the role listed in India, reflecting differences in market rates and living costs.

**Summary:**
Meta and AT&T stand out for offering some of the highest salaries, but they differ in their approach to benefits, with AT&T providing health insurance.
The presence of companies like SmartAsset twice in the list suggests a robust demand for data analysts in certain firms, possibly indicating multiple openings or specialized roles. The lack of health insurance in some top-paying roles may reflect a trend where companies compensate with higher salaries instead of benefits.
These insights could help job seekers understand where the most lucrative opportunities are and what trade-offs might exist between salary and benefits.


---


## 2.  Top Paying Data Analyst Skills
To identify the highest-paying roles, Data analyst role is filtered by average anual salary and location, focusing on only remote jobs. This query highlights the high paying opportunities in the field.


```sql
WITH top_pay_DA AS (
    SELECT 
        job_id,
        company_dim.name as company,
        job_title, 
        salary_year_avg
    FROM 
        job_postings_fact
    LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        salary_year_avg IS NOT NULL AND job_title_short = 'Data Analyst' AND job_work_from_home = TRUE
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_pay_DA.*, 
    skills_dim.skills 
FROM 
    top_pay_DA
INNER JOIN skills_job_dim
ON top_pay_DA.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC;
```

## Some Insights
### Based on the analysis of the job postings for the top 10 data analyst roles, the following insights have been derived:

#### Most Commonly Required Skills:

- **SQL:** Required in 8 out of 10 job postings.

- **Python:** Required in 7 out of 10 job postings.

- **Tableau:** Required in 6 out of 10 job postings.

- **R:** Required in 4 out of 10 job postings.

- **Snowflake:** Required in 3 out of 10 job postings.

- **Pandas:** Required in 3 out of 10 job postings.

- **Excel:** Required in 3 out of 10 job postings.

- **Atlassian:** Required in 2 out of 10 job postings.

- **Oracle:** Required in 2 out of 10 job postings.

- **Power BI:** Required in 2 out of 10 job postings.


### The output includes job listings for various data analyst positions across different companies. Here are some insights based on the given information:

### 1. Top Companies and Roles
- **AT&T:** The "Associate Director- Data Insights" role at AT&T has an average salary of $255,829.5. This position requires a wide range of skills, including SQL, Python, R, Azure, Databricks, AWS, Pandas, PySpark, Jupyter, Excel, Tableau, Power BI, and PowerPoint.
- **Pinterest:** The "Data Analyst, Marketing" role at Pinterest offers an average salary of $232,423.0 and requires skills like SQL, Python, R, Hadoop, and Tableau.
- **Uclahealthcareers:** The "Data Analyst (Hybrid/Remote)" position at Uclahealthcareers has a salary of $217,000.0, and demands skills such as SQL, Crystal, Oracle, Tableau, and Flow.
- **SmartAsset:** This company appears twice, offering a "Principal Data Analyst (Remote)" role with a salary of $205,000.0, and another "Principal Data Analyst" role with a salary of $186,000.0. Required skills include SQL, Python, Go, Snowflake, Pandas, Numpy, Excel, Tableau, and GitLab.
- **Inclusively:** The "Director, Data Analyst - HYBRID" role offers an average salary of $189,309.0. Skills required are SQL, Python, Azure, AWS, Oracle, Snowflake, Tableau, Power BI, SAP, Jenkins, Bitbucket, Atlassian, Jira, and Confluence.
- **Motional:** The "Principal Data Analyst, AV Performance Analysis" role has an average salary of $189,000.0 and needs skills like SQL, Python, R, Git, Bitbucket, Atlassian, Jira, and Confluence.
-   **Get It Recruit - Information Technology:** The "ERM Data Analyst" role provides an average salary of $184,000.0. Required skills are SQL, Python, and R.

### 2. Skill Requirements
#### Commonly Required Skills:
- **SQL:** Appears in nearly all job listings, highlighting its importance across data analyst roles.
- **Python:** Also frequently mentioned, underscoring its critical role in data analysis.
- **R:** Required in several positions, especially those involving statistical analysis.
- **Tableau:** A popular tool for data visualization, essential in many of these roles.

#### Technical Skills:
Cloud platforms like AWS and Azure are required for roles focused on big data and cloud-based analytics.
Pandas and Numpy are key for data manipulation in Python.
Git, Bitbucket, and other version control tools are needed for roles that require collaboration in coding and data projects.
Tools like Power BI and Excel remain vital for reporting and data visualization.

### 3. Salary Insights
The average salary range in the dataset is from $184,000 to $255,829.5.
AT&T offers the highest average salary for the "Associate Director- Data Insights" role, reflecting a senior-level position with extensive skill requirements.
SmartAsset and Pinterest offer competitive salaries, especially for roles that require advanced data manipulation and visualization skills.
The salary levels suggest a strong demand for data analysts with a robust technical skill set, particularly in the U.S. market.

### 4. Geographical Considerations
While the dataset focuses on companies based in the United States, the salary data indicates that U.S. companies are willing to pay a premium for advanced data analysis skills, especially for remote or hybrid roles that may attract talent from across the country.

### Summary
This analysis highlights the competitive salaries offered by top companies like AT&T, Pinterest, and SmartAsset for data analyst roles, particularly those requiring a combination of technical skills in SQL, Python, Tableau, and cloud technologies. The roles mentioned reflect a high demand for data professionals capable of leveraging advanced tools and platforms to drive business insights.



---


### 3.  Top In Demand Skills for Data Analysts
To identify the highest-paying roles, Data analyst role is filtered by average anual salary and location, focusing on only remote jobs. This query highlights the high paying opportunities in the field.


```sql
SELECT 
    skills_job_dim.skill_id,skills,
    count(*) as skill_demand
FROM 
    skills_job_dim
INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY 
    skills_job_dim.skill_id, skills
ORDER BY 
    skill_demand DESC
LIMIT 5
;
```


### Some Insights
### 1. Ranking of Skills by Demand
| Skill ID | Skill      | Skill Demand |
|----------|------------|--------------|
| 0        | SQL        | 92,628       |
| 181      | Excel      | 67,031       |
| 1        | Python     | 57,326       |
| 182      | Tableau    | 46,554       |
| 183      | Power BI   | 39,468       |
| 5        | R          | 30,075       |
| 7        | SAS        | 14,034       |
| 186      | SAS        | 14,034       |
| 196      | PowerPoint | 13,848       |
| 188      | Word       | 13,591       |



### 2.  Descriptive Statistics of Skills Demand
Total Skills: Based on the top 10 indemand skills
Highest Demand Skill: SQL (92,628 job listings)
Lowest Demand Skill: Word (13,591 job listings)


### 3. Demand Distribution
Top 3 Skills (SQL, Excel, Python) together account for 59.43% of the total demand. While, the remaining 7 Skills account for 40.57% of the demand.

### Summary:
SQL is the most demanded skill, appearing in every job listing and having the highest skill demand of 92,628.
Excel and Python are also highly demanded, both in job listings and in the skill demand list.
The top-paying job is the Associate Director, Data Insights at AT&T, with an average salary of $255,829.5 and requiring a wide range of skills.
Tableau and Power BI are frequently required for data-related roles, reflecting their importance in data analysis and visualization.
This summary highlights the importance of certain skills in data-related roles, especially SQL, Python, and Tableau, which are commonly sought after across various positions and companies.




---



### 4.  Top Skills for Data Analysts Based on Salary
To identify the top skills for Data Analysts based on the average anual salary.


```sql
SELECT 
    skills,
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
    avg_salary DESC
LIMIT 25
;
```


### Some Insights

####  Top 25 Data Analysis skills based on the salary
The table below lists the top 25 data analysis skills along with their average salaries. Here’s a critical analysis of this data that could help inform your data analysis project

| Skill        | Average Salary (USD) |
|--------------|----------------------|
| SVN          | 400,000              |
| Solidity     | 179,000              |
| Couchbase    | 160,515              |
| DataRobot    | 155,486              |
| GoLang       | 155,000              |
| MXNet        | 149,000              |
| dplyr        | 147,633              |
| VMware       | 147,500              |
| Terraform    | 146,734              |
| Twilio       | 138,500              |
| GitLab       | 134,126              |
| Kafka        | 129,999              |
| Puppet       | 129,820              |
| Keras        | 127,013              |
| PyTorch      | 125,226              |
| Perl         | 124,686              |
| Ansible      | 124,370              |
| Hugging Face | 123,950              |
| TensorFlow   | 120,647              |
| Cassandra    | 118,407              |
| Notion       | 118,092              |
| Atlassian    | 117,966              |
| Bitbucket    | 116,712              |
| Airflow      | 116,387              |
| Scala        | 115,480              |


### Some Insights
- **Top Earner:**
SVN (Subversion) stands out with an average salary of $400,000. This figure is significantly higher than any other skill listed, indicating that SVN-related roles may be very niche or high-level positions within the industry.

#### **Programming and Tools:**
- **Programming Languages:** Skills like Golang ($155,000), Perl ($124,686), and Scala ($115,480) feature prominently. This suggests that strong programming skills in specific languages can command high salaries.

- **Data Frameworks and Libraries:** TensorFlow ($120,647), Keras ($127,013), and PyTorch ($125,226) are prominent. This indicates that expertise in modern machine learning frameworks is highly valued.

- **Infrastructure and Tools:** Skills related to infrastructure and deployment such as Terraform ($146,734), VMware ($147,500), and Ansible ($124,370) are also well-compensated. This suggests that expertise in managing and automating IT infrastructure is lucrative.

- **Database Technologies:** Couchbase ($160,515) and Cassandra ($118,407) show that specialized knowledge in certain database technologies can lead to higher salaries, reflecting their importance in handling large-scale data solutions.

- **Cloud and API Integration:** Skills in Twilio ($138,500) and Kafka ($129,999) highlight the value of knowledge in cloud communication platforms and data streaming technologies, respectively. These areas are crucial for building scalable data-driven applications.

- **DevOps and Version Control:** Tools like GitLab ($134,126) and Bitbucket ($116,712) are important for version control and CI/CD pipelines, with decent salary expectations. This underscores the importance of DevOps skills in the modern data landscape.

- **Emerging Technologies:** Solidity ($179,000), used for blockchain development, and Hugging Face ($123,950), known for natural language processing, reflect growing areas of high demand. This suggests that cutting-edge technologies in blockchain and NLP are becoming increasingly valuable.

- **Soft Skills and Miscellaneous:** Notion ($118,092) and Atlassian ($117,966) might indicate that proficiency in collaborative and project management tools can also command decent salaries, emphasizing the importance of organizational and workflow skills in data-related roles.

#### General Observations
- **High Variance in Salaries:** The range of salaries is quite broad, from $400,000 for SVN to $115,480 for Scala. This high variance suggests that niche skills or those in high-demand roles can command significantly higher salaries.

- **Technology Trends:** The prominence of modern machine learning frameworks and infrastructure tools highlights current trends in the industry. Keeping up-to-date with these technologies could be advantageous for career advancement.

- **Specialization Premium:** Skills in specialized technologies like blockchain or advanced databases often result in higher salaries, indicating a premium for deep expertise in these areas.

- **Market Demand:** The data implies that while core data analysis and programming skills are crucial, familiarity with emerging technologies and tools can greatly enhance earning potential.

### Summary
In summary, focusing on specialized, high-demand skills and keeping abreast of technological advancements could provide significant benefits in terms of salary and career opportunities.



---


### 5.  Optimal Skills for Data Analysts (Both High Demand and High Paying)
These query shows the Optimal Skills for Data Analysts (Both High Demand and High Paying)

```sql
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
        skills_job_dim.skill_id,skills, 
        count(*) as skill_demand
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
```


### Some Insights
The table lists the top 25 data analysis skills based on a combination of high skill demand and high salary. Here’s a detailed critical analysis of this data:

- **Top Skills by Demand and Salary:** SQL and Excel are the most demanded skills, with SQL leading in both demand (3083) and salary ($96,435). Excel follows with a strong demand (2143) and a slightly lower average salary ($86,419). This suggests that SQL remains a critical foundational skill in data analysis, while Excel, despite being a more traditional tool, is still widely used.

- **Programming Languages and Tools:** Python is notable for its high salary ($101,512) and significant demand (1840). This underscores its versatility and importance in data analysis and data science.Also, R commands a high salary ($98,708) and has strong demand (1073), indicating its continued relevance in statistical analysis and data visualization.

- **Visualization Tools:** Tableau and Power BI are key visualization tools with high salaries ($97,978 and $92,324 respectively) and substantial demand (1659 and 1044). Mastery of these tools is essential for creating impactful data visualizations and dashboards.

- **Database and Cloud Technologies:** SQL Server and Oracle are prominent with competitive salaries ($96,191 and $100,964) and moderate demand (336 and 332). Their strong performance in terms of salary and demand highlights the value of specialized database management skills. Azure and AWS also show high salaries ($105,400 and $106,440) with lower demand (319 and 291). This reflects the growing importance of cloud computing expertise.

- **Emerging and Specialized Skills:** Snowflake and Spark are notable for their high salaries ($111,578 and $113,002) and relatively lower demand (241 and 187). This suggests that while these technologies are less commonly required, they are highly valued for specialized roles. Furthermore, Go and Looker also feature strong salaries ($97,267 and $103,855) despite lower demand (288 and 260), indicating a premium on skills in these areas.

- **Software and Miscellaneous Tools:** VBA, SAP, and SharePoint have competitive salaries ($93,845, $92,446, and $89,027) but lower demand (185, 183, and 174). These skills are valuable but less frequently required compared to other top skills.

- **General Office Tools:** Word, PowerPoint, Outlook, and Sheets have lower salaries but still moderate demand. This indicates that while they are essential for general office productivity, they don't command high salaries compared to specialized data analysis skills.

### Trends and Recommendations
- **High Value of Programming and Advanced Tools:** Programming skills like Python and R, and advanced tools like Snowflake and Spark, are highly valued, suggesting that investing in these areas can lead to better job prospects and higher salaries.

- **Demand for Data Visualization Skills:** The high demand and salary for visualization tools like Tableau and Power BI indicate that expertise in these areas is crucial for career advancement in data analysis roles.

- **Emerging Technologies:** Cloud technologies and emerging tools like Snowflake and Spark are increasingly important. As data infrastructure continues to evolve, skills in these areas will likely become even more valuable.

- **Balancing Core and Specialized Skills:** While foundational skills like SQL and Excel are critical and widely applicable, specialized skills in cloud technologies and advanced analytics tools can provide a competitive edge and lead to higher salaries.

- **Investment in Continuous Learning:** Given the fast-paced nature of technology, continuous learning and staying updated with the latest tools and technologies is essential for maintaining and enhancing career prospects in data analysis.


### Summary
In summary, focusing on high-demand programming languages, visualization tools, and emerging technologies while maintaining core skills will likely lead to the best career outcomes and higher salaries in the field of data analysis.


---
---


#   What I Learned
Throughout this project, i have moved from writing simple queries into advanced queries:

- **Complex Queries Crafting:** Mastered the art of advanced SQL, merging tables like a pro and utilizing CTES and Temp tables effectively. I have also learn that there are several methods/ways of writing the same queries and the ability to choose the most effective method for readability.

- **Data Aggregration:** Aggregration is one of the useful syntax functions that i have learned in this project as it help to easily get insight from query results.

- **Analytical Skills:** From this project i have improved my analytical skills by crafting the relevant questions that addresses the problem i set out to solve and also converting this questions into actionable and insighful SQL queries.


---
---


#   Conclusion


---
---


### Insights
include some insights from the 5 analysis


---
---


### Closing Thoughts
This project enhanced my SQL skills and provided valuable insights into the data analyst job market in the data utilized. The discoveries from the critical analyst serve as a guide to prioritizing skills development and job search efforts. Aspiring Data Analysts can better position themselves in a competitive job market by focusing on Optimal Skills (high-demand, high-salary skills) in this role. Furthermore, this exploraion highlights the importance of continous learning and adaptation to emerging trends in the field of Data Analysis.


---
---
