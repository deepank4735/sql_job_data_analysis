/*questions: what are the top paying data anlyst jobs?
- identify the top 10 highest paid data analyst role that are available remotely.
- focus on the job posting that are specific salaries ( removing NULL values)
-why?higlight top paying job oppurtunity  for data analysis , offering insights */

SELECT job_id,
       job_title,
       salary_year_avg,
       Name As Company_Name
FROM   job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id
Where  job_title_short='Data Analyst' AND job_location='Anywhere' AND 
      salary_year_avg IS NOT NULL
Order BY salary_year_avg DESC
Limit 10;    

/*

  
Based on the provided data regarding job titles, average annual salaries, and company names for various positions related to data analysis, we can draw several insights:

Salary Disparities:

The salaries vary significantly across different job titles, with the highest average salary being $650,000 for the position of "Data Analyst" at "Mantys" and the lowest average salary being $184,000 for the position of "ERM Data Analyst" at "Get It Recruit - Information Technology".
This indicates that there is a wide range of compensation levels for data analyst roles depending on factors such as job responsibilities, experience, location, and industry.
Job Titles and Responsibilities:

Job titles such as "Data Analyst", "Director of Analytics", "Associate Director- Data Insights", "Principal Data Analyst", and "ERM Data Analyst" indicate a variety of roles within the field of data analysis.
The specific responsibilities and requirements associated with each job title may vary, ranging from entry-level data analysis tasks to managerial or specialized roles.
Company Names and Opportunities:

The data includes job postings from various companies such as "Meta", "AT&T", "Pinterest Job Advertisements", "Uclahealthcareers", "SmartAsset", "Inclusively", "Motional", and "Get It Recruit - Information Technology".
The presence of job postings from a diverse range of companies suggests that there are opportunities for data analysts across different industries, including tech companies, healthcare, finance, and recruitment firms.
Remote and Hybrid Opportunities:

Some job titles indicate remote or hybrid work arrangements, such as "Data Analyst (Hybrid/Remote)" and "Principal Data Analyst (Remote)". This suggests that remote work options are available in the field of data analysis, providing flexibility for professionals.
Demand for Data Analysts:

The existence of multiple job postings for data analyst positions across different companies indicates a demand for professionals with data analysis skills in the job market.
Companies across various industries rely on data analysts to analyze data, derive insights, and make informed business decisions, highlighting the importance of data analysis skills in today's business landscape.
Overall, the data provides insights into the diversity of roles, salary ranges, company opportunities, and work arrangements available to data analysts in the job market. This information can be valuable for individuals seeking career opportunities in the field of data analysis or for organizations looking to understand trends in hiring and compensation for data-related roles.



 Json code for the results: [
  {
    "job_id": 226942,
    "job_title": "Data Analyst",
    "salary_year_avg": "650000.0",
    "company_name": "Mantys"
  },
  {
    "job_id": 547382,
    "job_title": "Director of Analytics",
    "salary_year_avg": "336500.0",
    "company_name": "Meta"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology"
  }
]
*/ 
