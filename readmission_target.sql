SELECT *
FROM patient_readmission;

SELECT COUNT(*) AS total_patients
FROM patient_readmission;

SELECT COUNT(*) AS readmitted_patients
FROM patient_readmission
WHERE readmitted = 'Yes';

SELECT
    COUNT(*) AS total_patients,
    SUM(CASE WHEN readmitted = 'Yes' THEN 1 ELSE 0 END)
        AS readmitted_patients,
    ROUND(
        100.0 * SUM(CASE WHEN readmitted = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS readmission_rate
FROM patient_readmission;


SELECT
    gender,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN readmitted = 'Yes' THEN 1 ELSE 0 END)
        AS readmitted_patients
FROM patient_readmission
GROUP BY gender;

SELECT
   primary_diagnosis,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN readmitted = 'Yes' THEN 1 ELSE 0 END)
        AS readmitted_patients
FROM patient_readmission
GROUP BY primary_diagnosis
ORDER BY readmitted_patients DESC;

SELECT
    AVG(age) AS average_age
FROM patient_readmission
WHERE readmitted = 'Yes';

SELECT
    readmitted,
    AVG(days_in_hospital) AS avg_days_in_hospital
FROM patient_readmission
GROUP BY readmitted;

SELECT
    patient_id,
    age,
    primary_diagnosis,
    comorbidity_score,
    days_in_hospital,
    num_procedures,
    readmitted
FROM patient_readmission
WHERE readmitted >= 2
  AND days_in_hospital >= 7;
  
  SELECT
    patient_id,
    age,
    gender,
    primary_diagnosis,
    days_in_hospital,
    readmitted,
    num_procedures,
    comorbidity_score,

    CASE
        WHEN readmitted = 'Yes' THEN 1
        ELSE 0
    END AS readmission_target

FROM patient_readmission;