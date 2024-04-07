/*
What are the in-demand skills for data analyst
WHy- Retieves the top 5 skills with the highest demand in the 
job market,providing insights insights into the most demanded skills 
for job seekers 
-join job postings to inner join table similar to query 2 
-identify the top 5 in-demand skills for data analyst 
-Focus on all job postings 
*/



    Select skills,count(skills) AS demand_count
    From job_postings_fact
    INNER JOIN  skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim ON  skills_job_dim.skill_id=skills_dim.skill_id
    Where job_title_short ='Data Analyst' and job_work_from_home= TRUE
    group by skills
    ORDER BY demand_count DESC
    Limit 5

    /* RESULT:
    Top paying skills in demand for data analyst role specifically for WFH employees are 
    sql 
    excel
    python
    tableau
    Powerbi in the specific order also we can observe the similar trend even if we dont apply the filter
    for work from home employees */
    