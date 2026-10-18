/*
    Find the count of the number of remote job postings per skill
     - Display the top 5 skills by their demand in remote jobs
     - include skill ID, name, and count of postings requiring the skill
*/    

-- solving this query by using subquery
SELECT
    skills_job_dim.skill_id,
    COUNT(*) AS number_of_jobs,
    skills_dim.skills AS skill_name
FROM
    skills_job_dim
    LEFT JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_id IN   ( -- subquery starts here   
                    SELECT
                            job_id
                    FROM
                            job_postings_fact
                    WHERE
                    --job_location = 'Anywhere'
                    job_work_from_home = true 
                ) -- subquery ends here    
GROUP BY
    skills_job_dim.skill_id,
    skills_dim.skills /* 
                        **WHY!**: Every column appears in SELECT, which has no aggregation
                        such as SUM or COUNT..etc., must be in GROUP BY.
                      */
ORDER BY
    number_of_jobs DESC
LIMIT 5                         