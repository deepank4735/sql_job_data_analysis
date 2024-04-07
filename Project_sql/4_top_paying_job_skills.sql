/*
What are the top skills based on salary ?
= Look at the avg salry associated with each skill
- Focus on rols specified salarues, regardless of your job location
Why - it reveals how different skills impact salry levels for data analyst 
and helps identify the most financially rewarding skill to acquire 
or improve

*/

    Select skills,
           Round(AVG(salary_year_avg),0) AS average_salary
    From   job_postings_fact
    INNER JOIN  skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim ON  skills_job_dim.skill_id=skills_dim.skill_id
    Where  job_title_short ='Data Analyst'
           And salary_year_avg IS NOT NULL
    -- and job_work_from_home= TRUE
    group by skills
    ORDER BY average_salary DESC
    Limit 25

/*
Here is the breakkdwon of the above query result set:

The top paying skills based on average salary are "svn", "solidity", and "couchbase", with average salaries of $400,000, $179,000, and $160,515 respectively.
These skills appear to be in high demand and command higher salaries due to their specialized nature or scarcity of professionals with expertise in these areas.
Programming Languages and Tools:

Skills such as "golang", "perl", "scala", "tensorflow", "pytorch", "keras", "ansible", "puppet", and "terraform" are all programming languages or tools commonly used in data analysis and machine learning.
These skills have average salaries ranging from $115,480 to $147,633, indicating that proficiency in these programming languages and tools is valued in the data analyst role.
Machine Learning Frameworks:

Frameworks such as "mxnet", "tensorflow", "pytorch", and "keras" are widely used in machine learning and deep learning projects.
Despite being essential for data analysis and machine learning tasks, the average salaries for these skills range from $125,226 to $149,000, which is lower compared to some other skills like "svn" and "solidity".
DevOps and Infrastructure Skills:

Skills such as "terraform", "ansible", "puppet", "gitlab", "atlassian", "bitbucket", and "airflow" are related to DevOps practices, infrastructure automation, and version control.
These skills are also in demand for data analysis projects, with average salaries ranging from $116,387 to $147,633.
Specialized Technologies:

Some skills like "hugging face", "cassandra", "kafka", "notion", and "twilio" are more specialized and may be required for specific data analysis projects.
Despite their specialization, the average salaries for these skills range from $118,092 to $138,500, indicating that expertise in these areas can also lead to lucrative opportunities.
Overall, the trends suggest that a combination of programming languages, machine learning frameworks, DevOps practices, and specialized technologies are essential for a data analyst role. Additionally, skills that are more specialized or in high demand may command higher average salaries in the job market.
/*


