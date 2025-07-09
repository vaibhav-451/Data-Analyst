/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT 
        job_postings_fact.job_id,
        job_postings_fact.job_title,
        company_dim.name AS company_name,
        job_postings_fact.job_location,
        job_postings_fact.salary_year_avg
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_location LIKE '%, India%' AND 
        job_title_short = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*
Here’s the breakdown of the most demanded skills for data analysts in 2023, based on job postings from the top 10 highest paying roles in India:

*  SQL  is leading with a bold count of  6 .
*  Oracle ,  Power BI , and  MongoDB  follow closely, each with a bold count of  4 .
*  AWS ,  Spark , and  Python  are also in demand, with a bold count of  3  each.
* Other skills like  Excel ,  Scala ,  Hadoop ,  Databricks ,  Airflow ,  Azure ,  GDPR , and  Go  show moderate demand, each with a bold count of  2 .
* Niche tools and technologies such as  No-SQL ,  SAP ,  Shell ,  Neo4j , and  Electron  appear with a bold count of  1 .

[
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "sql"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "nosql"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "scala"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "shell"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "databricks"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "aws"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "oracle"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "spark"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "pandas"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "airflow"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "kafka"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "unix"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "linux"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "power bi"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "jenkins"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "flow"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "sap"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "sql"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "mongo"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "mysql"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "postgresql"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "sql server"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "azure"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "aws"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "redshift"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "oracle"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "spark"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "skills": "power bi"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "sql"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "python"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "scala"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "go"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "mongodb"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "no-sql"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "neo4j"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "mongodb"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "azure"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "databricks"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "aws"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "oracle"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "spark"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "hadoop"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "gdpr"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "power bi"
  },
  {
    "job_id": 781346,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "skills": "gdpr"
  },
  {
    "job_id": 1751462,
    "job_title": "Recruitment Data Analyst",
    "company_name": "Framestore",
    "job_location": "Mumbai, Maharashtra, India",
    "salary_year_avg": "111175.0",
    "skills": "tableau"
  },
  {
    "job_id": 1751462,
    "job_title": "Recruitment Data Analyst",
    "company_name": "Framestore",
    "job_location": "Mumbai, Maharashtra, India",
    "salary_year_avg": "111175.0",
    "skills": "power bi"
  },
  {
    "job_id": 943701,
    "job_title": "Data Analyst",
    "company_name": "Avaloq",
    "job_location": "Pune, Maharashtra, India",
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "job_id": 943701,
    "job_title": "Data Analyst",
    "company_name": "Avaloq",
    "job_location": "Pune, Maharashtra, India",
    "salary_year_avg": "111175.0",
    "skills": "power bi"
  },
  {
    "job_id": 943701,
    "job_title": "Data Analyst",
    "company_name": "Avaloq",
    "job_location": "Pune, Maharashtra, India",
    "salary_year_avg": "111175.0",
    "skills": "dax"
  },
  {
    "job_id": 601909,
    "job_title": "Process and Data Analyst",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "job_id": 601909,
    "job_title": "Process and Data Analyst",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "111175.0",
    "skills": "python"
  },
  {
    "job_id": 601909,
    "job_title": "Process and Data Analyst",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "111175.0",
    "skills": "sap"
  },
  {
    "job_id": 494523,
    "job_title": "Methods and Data Analyst",
    "company_name": "NielsenIQ",
    "job_location": "Pune, Maharashtra, India",
    "salary_year_avg": "111175.0",
    "skills": "python"
  },
  {
    "job_id": 494523,
    "job_title": "Methods and Data Analyst",
    "company_name": "NielsenIQ",
    "job_location": "Pune, Maharashtra, India",
    "salary_year_avg": "111175.0",
    "skills": "r"
  },
  {
    "job_id": 494523,
    "job_title": "Methods and Data Analyst",
    "company_name": "NielsenIQ",
    "job_location": "Pune, Maharashtra, India",
    "salary_year_avg": "111175.0",
    "skills": "bash"
  },
  {
    "job_id": 494523,
    "job_title": "Methods and Data Analyst",
    "company_name": "NielsenIQ",
    "job_location": "Pune, Maharashtra, India",
    "salary_year_avg": "111175.0",
    "skills": "azure"
  },
  {
    "job_id": 494523,
    "job_title": "Methods and Data Analyst",
    "company_name": "NielsenIQ",
    "job_location": "Pune, Maharashtra, India",
    "salary_year_avg": "111175.0",
    "skills": "spark"
  },
  {
    "job_id": 494523,
    "job_title": "Methods and Data Analyst",
    "company_name": "NielsenIQ",
    "job_location": "Pune, Maharashtra, India",
    "salary_year_avg": "111175.0",
    "skills": "pandas"
  }
]

*/