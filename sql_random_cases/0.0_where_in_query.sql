/*
Find job postings from the first quarter that have a salary greater than $70K
- Combine job posting table from the first quarter of 2023 (Jan-Mar)
- Gets job opsting with an average yearly salary > $70,000
*/

SELECT *
FROM
        job_postings_fact
WHERE
        EXTRACT(MONTH FROM job_posted_date) IN (1,2,3)
        AND
        salary_year_avg > 70_000
        AND
        job_title_short = 'Data Analyst'
