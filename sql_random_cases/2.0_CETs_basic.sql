/* this CTE gives a temporary result set of job_postings_fact table 
   in which all values of the job_posted_date are in january*/

   
WITH january_job AS 
    ( -- CTE definition starts here
        SELECT *
        FROM
            job_postings_fact
        WHERE
            EXTRACT(MONTH FROM job_posted_date) = 1       
    ) -- CTE definition starts here
SELECT *
FROM january_job