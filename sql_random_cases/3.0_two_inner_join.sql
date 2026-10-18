/*
    Find the count of the number of remote job postings per skill
     - Display the top 5 skills by their demand in remote jobs
     - include skill ID, name, and count of postings requiring the skill
*/  

SELECT
    skills_job_dim.skill_id,
    COUNT(*),
    skills_dim.skills
FROM
    skills_job_dim
    INNER JOIN job_postings_fact
    ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_work_from_home = TRUE AND
    job_title_short = 'Data Analyst'
GROUP BY
    skills_job_dim.skill_id,
    skills_dim.skills

ORDER BY
    count DESC
LIMIT 5                