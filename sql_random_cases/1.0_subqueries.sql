/*
this subquery gives the number of jobs in each day of january
for each job title and if january needed to be changed to 
february or other month then change the **number in line (12)**
to meet the month targeted
*/ 
  
SELECT  
        job_title_short,
        COUNT(job_id),
        job_posted_date::DATE AS date
FROM    (
        SELECT *
        FROM
                job_postings_fact
        WHERE
                EXTRACT(MONTH FROM job_posted_date) = 1
        ) AS january_job
/*WHERE job_title_short = 'Data Analyst' -- in case the search is for specified job title*/
GROUP BY
        
        january_job.job_posted_date::DATE, --the name of column must be as it was before adding alias(AS)
        january_job.job_title_short
ORDER BY
        date,
        count DESC