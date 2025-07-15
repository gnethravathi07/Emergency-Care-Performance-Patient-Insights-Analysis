CREATE DATABASE Hospital ;
USE  Hospital ;

CREATE TABLE patients (
    patient_id VARCHAR(20) PRIMARY KEY,
    patient_admission_date DATETIME,
    patient_first_initial CHAR(1),
    patient_last_name VARCHAR(50),
    patient_gender CHAR(1),
    patient_age INT,
    patient_race VARCHAR(100),
    department_referral VARCHAR(100),
    patient_admission_flag BOOLEAN,
    patient_satisfaction_score INT,
    patient_waittime INT,
    patients_cm INT
);
drop table patients;
Select * from patients;
Select count(*) from patients;
select count(*) from hospital_er_data;
Rename table hospital_er_data to patients;


-- Total Number of Patients 

SELECT 
    DATE(STR_TO_DATE(patient_admission_date, '%d-%m-%Y %H:%i')) AS admission_day,
    COUNT(*) AS total_patients
FROM patients
GROUP BY admission_day
ORDER BY admission_day;

-- 2. Average Patient Wait Time (per day)
SELECT 
    DATE(STR_TO_DATE(patient_admission_date, '%d-%m-%Y %H:%i')) AS admission_day,
    ROUND(AVG(patient_waittime), 2) AS avg_wait_time
FROM patients
GROUP BY admission_day
ORDER BY admission_day;


SHOW COLUMNS FROM patients LIKE 'patient_satisfaction_score';

UPDATE patients
SET patient_satisfaction_score = NULL
WHERE patient_satisfaction_score = '';

-- 3. Average Satisfaction

SELECT 
    ROUND(AVG(patient_satisfaction_score), 2) AS avg_satisfaction_score
FROM patients
WHERE patient_satisfaction_score IS NOT NULL;

-- 4.Average Patient Wait Time

SELECT 
    ROUND(AVG(patient_waittime), 2) AS avg_wait_time
FROM patients
WHERE patient_waittime IS NOT NULL;

-- 5.Number of Patients Referred to Departments

SELECT 
    COUNT(*) AS total_referred_patients
FROM patients
WHERE department_referral IS NOT NULL 
  AND department_referral <> 'None';

-- Per Day
SELECT 
    DATE(STR_TO_DATE(patient_admission_date, '%d-%m-%Y %H:%i')) AS admission_day,
    COUNT(*) AS daily_referred_patients
FROM patients
WHERE department_referral IS NOT NULL 
  AND department_referral <> 'None'
GROUP BY admission_day
ORDER BY admission_day;

-- Referred Patients by Department

SELECT 
    department_referral,
    COUNT(*) AS total_patients
FROM patients
WHERE department_referral IS NOT NULL 
  AND department_referral <> 'None'
GROUP BY department_referral
ORDER BY total_patients DESC;

-- 6. Patient Admission Status (Admitted vs Not Admitted)

SELECT 
    CASE 
        WHEN LOWER(patient_admission_flag) = 'true' THEN 'Admitted'
        WHEN LOWER(patient_admission_flag) = 'false' THEN 'Not Admitted'
        ELSE 'Unknown'
    END AS admission_status,
    COUNT(*) AS total_patients
FROM patients
GROUP BY admission_status;


-- Admission Rate %

SELECT 
    ROUND(SUM(patient_admission_flag) * 100.0 / COUNT(*), 2) AS admission_rate_percent
FROM patients;

-- Admission Status by Day
SELECT 
    DATE(STR_TO_DATE(patient_admission_date, '%d-%m-%Y %H:%i')) AS admission_day,
    SUM(CASE WHEN patient_admission_flag = 1 THEN 1 ELSE 0 END) AS admitted,
    SUM(CASE WHEN patient_admission_flag = 0 THEN 1 ELSE 0 END) AS not_admitted
FROM patients
GROUP BY admission_day
ORDER BY admission_day;

-- 7.Patients Seen Within 30 Minutes

SELECT 
    COUNT(*) AS total_patients,
    SUM(CASE WHEN patient_waittime <= 30 THEN 1 ELSE 0 END) AS patients_seen_within_30,
    ROUND(SUM(CASE WHEN patient_waittime <= 30 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS percent_seen_within_30
FROM patients
WHERE patient_waittime IS NOT NULL;

-- 8. Patient Age Group Distribution

SELECT
    CASE 
        WHEN patient_age <= 10 THEN '0-10'
        WHEN patient_age BETWEEN 11 AND 20 THEN '11-20'
        WHEN patient_age BETWEEN 21 AND 30 THEN '21-30'
        WHEN patient_age BETWEEN 31 AND 40 THEN '31-40'
        WHEN patient_age BETWEEN 41 AND 50 THEN '41-50'
        WHEN patient_age BETWEEN 51 AND 60 THEN '51-60'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_patients
FROM patients
WHERE patient_age IS NOT NULL
GROUP BY age_group
ORDER BY age_group;

-- 9.Patient Gender Distribution

SELECT 
    patient_gender,
    COUNT(*) AS total_patients
FROM patients
WHERE patient_gender IS NOT NULL
GROUP BY patient_gender;

-- Daily Gender Trend

SELECT 
    DATE(STR_TO_DATE(patient_admission_date, '%d-%m-%Y %H:%i')) AS admission_day,
    patient_gender,
    COUNT(*) AS total_patients
FROM patients
WHERE patient_gender IS NOT NULL
GROUP BY admission_day, patient_gender
ORDER BY admission_day, patient_gender;

-- 10. Patient Race Distribution

SELECT 
    patient_race,
    COUNT(*) AS total_patients
FROM patients
WHERE patient_race IS NOT NULL
GROUP BY patient_race
ORDER BY total_patients DESC;

-- 11.  Patient Volume by Time (Day & Hour)

SELECT 
    DAYNAME(STR_TO_DATE(patient_admission_date, '%d-%m-%Y %H:%i')) AS day_of_week,
    HOUR(STR_TO_DATE(patient_admission_date, '%d-%m-%Y %H:%i')) AS hour_of_day,
    COUNT(*) AS patient_count
FROM patients
WHERE patient_admission_date IS NOT NULL
GROUP BY day_of_week, hour_of_day
ORDER BY 
    FIELD(day_of_week, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'),
    hour_of_day;
    
    -- Volume by Just Day
    
    SELECT 
    DAYNAME(STR_TO_DATE(patient_admission_date, '%d-%m-%Y %H:%i')) AS day_of_week,
    COUNT(*) AS total_patients
FROM patients
GROUP BY day_of_week
ORDER BY FIELD(day_of_week, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

-- volume by Just Hour

SELECT 
    HOUR(STR_TO_DATE(patient_admission_date, '%d-%m-%Y %H:%i')) AS hour_of_day,
    COUNT(*) AS total_patients
FROM patients
GROUP BY hour_of_day
ORDER BY hour_of_day;

