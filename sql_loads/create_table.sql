CREATE TABLE job_applied (
     job_id INT,
     applocation_sent_date DATE,
     custom_resume BOOLEAN,
     resume_file_name VARCHAR(255),
     cover_letter_sent BOOLEAN,
     cover_letter_file_name VARCHAR(255),
     status VARCHAR(50)
 );

INSERT INTO job_applied (job_id, applocation_sent_date, custom_resume, resume_file_name, cover_letter_sent, cover_letter_file_name, status) VALUES
(1, '2024-01-15', TRUE, 'resume_1.pdf', FALSE, NULL, 'Pending'),
(2, '2024-01-17', FALSE, 'resume_2.pdf', TRUE, 'cover_letter_2.pdf', 'Rejected'),
(3, '2024-01-20', TRUE, 'resume_3.pdf', TRUE, 'cover_letter_3.pdf', 'Accepted'),
(4, '2024-02-01', FALSE, 'resume_4.pdf', FALSE, NULL, 'Under Review'),
(5, '2024-02-05', TRUE, 'resume_5.pdf', TRUE, 'cover_letter_5.pdf', 'Pending'),
(6, '2024-02-10', FALSE, 'resume_6.pdf', FALSE, NULL, 'Interview Scheduled'),
(7, '2024-02-12', TRUE, 'resume_7.pdf', TRUE, 'cover_letter_7.pdf', 'Rejected'),
(8, '2024-02-15', FALSE, 'resume_8.pdf', TRUE, 'cover_letter_8.pdf', 'Pending'),
(9, '2024-02-18', TRUE, 'resume_9.pdf', FALSE, NULL, 'Accepted'),
(10, '2024-02-20', FALSE, 'resume_10.pdf', TRUE, 'cover_letter_10.pdf', 'Under Review'),
(11, '2024-02-25', TRUE, 'resume_11.pdf', FALSE, NULL, 'Interview Scheduled'),
(12, '2024-03-01', FALSE, 'resume_12.pdf', TRUE, 'cover_letter_12.pdf', 'Rejected'),
(13, '2024-03-05', TRUE, 'resume_13.pdf', FALSE, NULL, 'Pending'),
(14, '2024-03-10', FALSE, 'resume_14.pdf', TRUE, 'cover_letter_14.pdf', 'Accepted'),
(15, '2024-03-15', TRUE, 'resume_15.pdf', FALSE, NULL, 'Under Review'),
(16, '2024-03-20', FALSE, 'resume_16.pdf', TRUE, 'cover_letter_16.pdf', 'Interview Scheduled'),
(17, '2024-03-25', TRUE, 'resume_17.pdf', FALSE, NULL, 'Rejected'),
(18, '2024-03-30', FALSE, 'resume_18.pdf', TRUE, 'cover_letter_18.pdf', 'Pending'),
(19, '2024-04-01', TRUE, 'resume_19.pdf', FALSE, NULL, 'Accepted'),
(20, '2024-04-05', FALSE, 'resume_20.pdf', TRUE, 'cover_letter_20.pdf', 'Under Review');

SELECT *
FROM job_applied;

--- Add a column
ALTER TABLE job_applied
ADD contact VARCHAR(50);

-- Update the column values
UPDATE job_applied
SET contact = 'Amy Shanks'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'Ola'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Olarenwaju'
WHERE job_id = 3;

-- Renaming a column
ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

-- Changing data type of column
ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

-- Delete Columns
ALTER TABLE job_applied
DROP COLUMN contact_name;

-- DELETE TABLE
DROP TABLE job_applied_;