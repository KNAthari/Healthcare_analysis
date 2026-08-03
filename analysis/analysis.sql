--- Find the total number of patients ---
SELECT COUNT(*) AS patient_count
FROM healthcare_dataset

--- What are the leading medical conditions? At what age range do they occur? And how do they appear by gender? ---
SELECT "Age Range", "Gender", "Medical Condition", condition_count
FROM (
    SELECT 
        "Age Range",
        "Gender",
        "Medical Condition", 
        COUNT("Medical Condition") AS condition_count, 
        DENSE_RANK() OVER (PARTITION BY "Age Range", "Gender" ORDER BY COUNT(*) DESC) AS rc
    FROM healthcare_dataset
    GROUP BY "Age Range", "Gender", "Medical Condition"
) AS conditions_ranked_by_gender_and_age
WHERE rc = 1
ORDER BY "Age Range", "Gender"


