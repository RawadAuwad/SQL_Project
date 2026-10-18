-- January
CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;
 -- DROP TABLE january_jobs;

-- February
CREATE TABLE February_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;
 -- DROP TABLE February_jobs;


-- March
CREATE TABLE March_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;
 -- DROP TABLE March_jobs;


SELECT job_posted_date
FROM March_jobs