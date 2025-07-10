/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available in India
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options.
*/

SELECT 
    job_postings_fact.job_id,
    job_postings_fact.job_title,
    company_dim.name AS company_name,
    job_postings_fact.job_location,
    job_postings_fact.job_schedule_type,
    job_postings_fact.salary_year_avg,
    job_postings_fact.job_posted_date
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

/*
Here's the breakdown of the top data analyst jobs in 2023:
*  Wide Salary Range : Salaries span from  $111,175   to   $177,283   per year. This demonstrates that even within India, global companies are offering highly competitive compensation for data roles—especially at the senior and architectural levels.
*  Diverse Employers : The list includes a wide variety of companies such as   ServiceNow  ,   Bosch Group  ,   Srijan Technologies  ,   Eagle Genomics Ltd  ,   Addepar  ,   Truecaller  ,   Avaloq  , and   Razorpay  . This highlights that top-paying data roles are not limited to traditional tech companies but extend into   fintech  ,   biotech  , and   B2B SaaS   sectors.
*  Location Spread : The highest-paying jobs are located in major Indian tech hubs:
  *   Bengaluru   (Bosch, Truecaller, Razorpay)
  *   Hyderabad   (ServiceNow, Eagle Genomics)
  *   Pune   (Addepar, Avaloq)
  *   Gurugram   (Srijan Technologies)
  These cities remain hotspots for data careers due to their growing ecosystems and access to skilled talent.

[
  {
    "job_id": 1642893,
    "job_title": "Staff Applied Research Engineer",
    "company_name": "ServiceNow",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28 18:35:45"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20"
  },
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-06 20:30:35"
  },
  {
    "job_id": 781346,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-07-06 21:12:14"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39"
  },
  {
    "job_id": 1018545,
    "job_title": "Technical Data Analyst (India)",
    "company_name": "Addepar",
    "job_location": "Pune, Maharashtra, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-07-06 21:12:16"
  },
  {
    "job_id": 1025126,
    "job_title": "Data Analyst",
    "company_name": "Truecaller",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-15 21:30:03"
  },
  {
    "job_id": 943701,
    "job_title": "Data Analyst",
    "company_name": "Avaloq",
    "job_location": "Pune, Maharashtra, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-01-18 17:13:34"
  },
  {
    "job_id": 646083,
    "job_title": "Data Analyst (Contractual Role)",
    "company_name": "Razorpay",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-09-04 20:08:48"
  }
]

*/