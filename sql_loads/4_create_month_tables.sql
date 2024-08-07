-- Create table for January job postings
DROP TABLE IF EXISTS jan_jobs_posts;
CREATE TABLE jan_jobs_posts AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- Create table for February job postings
DROP TABLE IF EXISTS feb_jobs_posts;
CREATE TABLE feb_jobs_posts AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- Create table for March job postings
DROP TABLE IF EXISTS mar_jobs_posts;
CREATE TABLE mar_jobs_posts AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;
