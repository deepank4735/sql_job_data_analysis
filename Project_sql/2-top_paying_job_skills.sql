/* what are the skills required gfor data analyst jobs ?
- use the top pay jobs as a data anlyst from the previous query and 
- add the specific skill required for those jobs 
- WHY? It provides a detailed look atthe highest paying jobs demanding which specific skills 
helping job seekers which skills to develop that alligns with the top salary
*/

WITH top_paying_jobs AS(
    SELECT job_id,
        job_title,
        salary_year_avg,
        Name As Company_Name
    FROM   job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id
    Where  job_title_short='Data Analyst' AND 
        salary_year_avg IS NOT NULL
    Order BY salary_year_avg DESC
    Limit 10
    )

    Select top_paying_jobs.*,skills
    From top_paying_jobs
    INNER JOIN  skills_job_dim ON top_paying_jobs.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim ON  skills_job_dim.skill_id=skills_dim.skill_id
     ORDER BY salary_year_avg DESC