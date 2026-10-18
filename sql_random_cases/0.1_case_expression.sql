SELECT
        COUNT(job_id),
        CASE
            WHEN job_location = 'Anywhere' THEN 'Remote'
            WHEN job_location = 'New York, NY' THEN 'Local'
            ELSE 'Onsite'
        END AS job_category
FROM
        job_postings_fact

/* by using WHERE the result may be more definied for
   example **WHERE EXTRACT(MONTH FROM job_posted_date) = 1**
   will result that this query will be for january
*/   
GROUP BY
        job_category                         