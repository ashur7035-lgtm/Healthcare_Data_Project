-- Assuming a table named patients with columns: patient_id, age, gender, bmi, blood_pressure, glucose, insulin, outcome

-- 1) Count disease frequency
SELECT outcome, COUNT(*) AS count
FROM patients
GROUP BY outcome
ORDER BY count DESC;

-- 2) Average BMI by outcome
SELECT outcome, ROUND(AVG(bmi),2) AS avg_bmi
FROM patients
GROUP BY outcome;

-- 3) Age distribution buckets
SELECT
  CASE
    WHEN age BETWEEN 18 AND 30 THEN '18-30'
    WHEN age BETWEEN 31 AND 45 THEN '31-45'
    WHEN age BETWEEN 46 AND 60 THEN '46-60'
    ELSE '61+'
  END AS age_group,
  COUNT(*) AS patient_count,
  SUM(CASE WHEN outcome=1 THEN 1 ELSE 0 END) AS positives
FROM patients
GROUP BY age_group
ORDER BY patient_count DESC;
