/* 
What are the most optimal skills to learn (high demand and high paying skills)?
- Identify the high demand associated with high average salary for data analyst
-concentrate on remote postions with specified salaries
Why? Targets skills that offer job security (high demand)
and financial benefits (high salaries) offering strategic insights 
for career development in data analytics 
*/

 WITH skills_demand As (
    Select 
         skills_dim.skills,
         skills_dim.skill_id,
         count(skills_job_dim.job_id) AS demand_count
    From job_postings_fact
    INNER JOIN  skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim ON  skills_job_dim.skill_id=skills_dim.skill_id
    Where job_title_short ='Data Analyst' 
          And salary_year_avg IS NOT NULL
          AND job_work_from_home= TRUE
    group by skills_dim.skill_id
 ),average_salary As (
   Select 
           skills_job_dim.skill_id,
           Round(AVG(salary_year_avg),0) AS average_salary
    From   job_postings_fact
    INNER JOIN  skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim ON  skills_job_dim.skill_id=skills_dim.skill_id
    Where  job_title_short ='Data Analyst'
           And salary_year_avg IS NOT NULL
           AND job_work_from_home= TRUE
    group by skills_job_dim.skill_id
    
)
Select skills_demand.skill_id,
       skills_demand.skills,
       demand_count,
       average_salary
From skills_demand 
INNER JOIN average_salary ON
            skills_demand.skill_id=average_salary.skill_id 
WHERE demand_count>10
ORDER BY   average_salary DESC,   
           demand_count DESC
Limit 25

-- rewriting the same query more concisely 
Select skills_dim.skill_id,
        skills_dim.skills,
        count(skills_job_dim.job_id) AS demand_count,
        Round(AVG(job_postings_fact.salary_year_avg),0) as avg_salary
From job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE 
      job_title_short='Data Analyst'
      AND salary_year_avg IS NOT NULL
      AND job_work_from_home=True
group by skills_dim.skill_id
HAVING 
       count(skills_job_dim.job_id)>10
ORDER BY    
          avg_salary DESC,
          demand_count DESC
LIMIT 25;


/* 
Top Skills in Demand:

The skills with the highest demand counts are "Python" (236), "R" (148), "Looker" (49), "Oracle" (37), and "Snowflake" (37). This suggests that proficiency in these skills is highly sought after for Data Analyst roles.
Average Salaries:

The average salaries for Data Analyst roles vary across different skills. For instance, "Go" has the highest average salary at $115,320, followed by "Confluence" ($114,210) and "Hadoop" ($113,193). On the other hand, "JavaScript" has the lowest average salary at $97,587.
Popular Technologies:

Several popular technologies are in demand for Data Analyst roles, including "AWS" (Amazon Web Services), "Azure" (Microsoft Azure), "BigQuery" (Google BigQuery), "Snowflake," and "Redshift" (Amazon Redshift). This indicates the importance of cloud computing and data warehousing skills in the field.
Programming Languages:

Both "Python" and "R" are among the top skills in demand, highlighting the significance of programming skills, particularly in statistical analysis and data manipulation.
Visualization Tools:

"Tableau" and "Looker" are visualization tools that appear to be highly valued, with "Tableau" having a slightly higher demand count than "Looker." This suggests that proficiency in data visualization tools is essential for Data Analyst roles.
Database Technologies:

Skills related to database technologies such as "Oracle," "SQL Server," and "NoSQL" are also in demand, indicating the importance of data management and querying skills.
Overall, the insights suggest that a combination of programming, data visualization, cloud computing, and database management skills is crucial for Data Analyst roles, with varying levels of demand and average salaries associated with different skills.

*/