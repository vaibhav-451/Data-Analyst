/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on Indian positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

-- Identifies skills in high demand for Data Analyst roles
-- Using Query #3
WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location LIKE '%, India%' AND
        salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
),

-- Skills with high average salaries for Data Analyst roles
-- Using Query #4
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
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
        skills_job_dim.skill_id
)
-- Return high demand and high salaries for 10 skills 
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY 
    average_salary DESC,
    demand_count DESC

-- rewriting this same query more concisely
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location LIKE '%, India%' 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC

/*

Here’s a breakdown of the most optimal skills for Data Analysts in 2023 in India:
1. Strong demand meets competitive pay: SQL, Excel, and Python are the most in-demand skills with demand counts of 37, 31, and 30 respectively. While their average salaries are slightly lower (ranging from around 89,000 to 99,000 dollars), they remain foundational for most data analyst roles.
2. High-paying, high-potential tools: Spark stands out as a skill with both solid demand (11 postings) and a high average salary of 118,332 dollars, making it an optimal choice for analysts looking to upskill into big data processing.
3. Visualization and cloud tools on the rise: Power BI and Tableau have demand counts of 16 and 17 respectively, showing strong market interest. Cloud platforms like Azure and AWS are also increasingly valued, combining decent demand with average salaries above 95,000 dollars—highlighting the growing need for cloud-native data analysis.

[
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "11",
    "avg_salary": "118332"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "16",
    "avg_salary": "109313"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "30",
    "avg_salary": "99683"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "17",
    "avg_salary": "98750"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "14",
    "avg_salary": "97172"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "12",
    "avg_salary": "95333"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "37",
    "avg_salary": "94829"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "31",
    "avg_salary": "89591"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "15",
    "avg_salary": "88598"
  }
]

*/