--- Find the total number of patients ---
SELECT COUNT(*) AS patient_count
FROM healthcare_dataset;

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
ORDER BY "Age Range", "Gender"; 

--- What is the average billing amount by medical condition? And does it have any correlation with the insurance provider?

SELECT "Medical Condition", ROUND(AVG("Billing Amount")::numeric, 2) AS avg_billing
FROM healthcare_dataset
GROUP BY "Medical Condition"
ORDER BY avg_billing

WITH stats AS (
    SELECT
        "Insurance Provider",
        "Billing Amount",
        AVG("Billing Amount") OVER (PARTITION BY "Insurance Provider") AS group_avg,
        AVG("Billing Amount") OVER () AS grand_avg
    FROM healthcare_dataset
)

SELECT 
    ROUND(
        (SUM(POWER(group_avg - grand_avg, 2)) / SUM(POWER("Billing Amount" - grand_avg, 2)))::numeric, 
        4
    ) AS eta_squared
FROM stats; 

--- How did the average billing amounts for admitted patient differ each year? ---

SELECT 
year, 
avg_billing_amount,
COALESCE(avg_billing_amount - LAG(avg_billing_amount) OVER (ORDER BY year), 0) AS year_over_year_change
FROM (
    SELECT 
    EXTRACT(YEAR FROM "Date of Admission") AS year,
    ROUND(AVG("Billing Amount")::numeric, 2) AS avg_billing_amount
    FROM healthcare_dataset
    GROUP BY year
) AS calc_avg_billing
ORDER BY year ASC



