/*
subquery between two tables where I query names of copmanies that
require no degree for jobs they offer
*/

SELECT
    company_id,
    name AS company_name
FROM
    company_dim
WHERE
    company_id IN ( -- subquery starts here   
                    SELECT
                            company_id
                    FROM
                            job_postings_fact
                    WHERE
                    job_no_degree_mention = true 
                  ) -- subquery ends here