/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location LIKE '%, India%' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/* 
Here’s a breakdown of the results for top paying skills for Data Analysts in India:
1. Highest paying skills: Skills like gitlab, linux, mysql, pyspark, and postgresql lead the list with an average annual salary of 165,000 dollars. These tools are commonly associated with data engineering and backend data infrastructure.
2. Specialized technologies: Niche or advanced tools such as neo4j and gdpr also command high salaries (over 163,000 dollars), indicating that domain-specific expertise, such as graph databases and data privacy compliance, is highly valued.
3. Visualization and scripting tools: While widely used tools like pandas, spark, snowflake, matplotlib, and bash appear frequently in job postings, their average salaries range from around 111,000 to 122,000 dollars, reflecting solid demand but less premium pay compared to more infrastructure-focused or regulatory skill sets.

[
  {
    "skills": "gitlab",
    "avg_salary": "165000"
  },
  {
    "skills": "linux",
    "avg_salary": "165000"
  },
  {
    "skills": "mysql",
    "avg_salary": "165000"
  },
  {
    "skills": "pyspark",
    "avg_salary": "165000"
  },
  {
    "skills": "postgresql",
    "avg_salary": "165000"
  },
  {
    "skills": "neo4j",
    "avg_salary": "163782"
  },
  {
    "skills": "gdpr",
    "avg_salary": "163782"
  },
  {
    "skills": "airflow",
    "avg_salary": "138088"
  },
  {
    "skills": "mongodb",
    "avg_salary": "135994"
  },
  {
    "skills": "scala",
    "avg_salary": "135994"
  },
  {
    "skills": "databricks",
    "avg_salary": "135994"
  },
  {
    "skills": "pandas",
    "avg_salary": "122463"
  },
  {
    "skills": "kafka",
    "avg_salary": "122100"
  },
  {
    "skills": "shell",
    "avg_salary": "118500"
  },
  {
    "skills": "unix",
    "avg_salary": "118500"
  },
  {
    "skills": "spark",
    "avg_salary": "118332"
  },
  {
    "skills": "no-sql",
    "avg_salary": "114291"
  },
  {
    "skills": "hadoop",
    "avg_salary": "113276"
  },
  {
    "skills": "snowflake",
    "avg_salary": "111213"
  },
  {
    "skills": "jira",
    "avg_salary": "111175"
  },
  {
    "skills": "dax",
    "avg_salary": "111175"
  },
  {
    "skills": "bash",
    "avg_salary": "111175"
  },
  {
    "skills": "matplotlib",
    "avg_salary": "111175"
  },
  {
    "skills": "outlook",
    "avg_salary": "111175"
  },
  {
    "skills": "electron",
    "avg_salary": "111175"
  }
]

*/