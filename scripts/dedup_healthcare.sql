--- Confirm primary key in postgres ---

ALTER TABLE healthcare_dataset ADD PRIMARY KEY (patient_id)

--- Check for duplicates records in healthcare_dataset ---

SELECT
    "First Name", "Last Name", "Age", "Gender", "Blood Type",
    "Medical Condition", "Date of Admission", "Doctor", "Hospital",
    "Insurance Provider", "Billing Amount", "Admission Type",
    "Discharge Date", "Medication", "Age Range"
    COUNT(*) AS occurrences
FROM healthcare_dataset
GROUP BY
    "First Name", "Last Name", "Age", "Gender", "Blood Type",
    "Medical Condition", "Date of Admission", "Doctor", "Hospital",
    "Insurance Provider", "Billing Amount", "Admission Type",
    "Discharge Date", "Medication", "Age Range"
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;

--- Drop duplicate records ---

DELETE FROM healthcare_dataset a
USING healthcare_dataset b
WHERE a.patient_id > b.patient_id
  AND a."First Name" = b."First Name"
  AND a."Last Name" = b."Last Name"
  AND a."Age" = b."Age"
  AND a."Gender" = b."Gender"
  AND a."Blood Type" = b."Blood Type"
  AND a."Medical Condition" = b."Medical Condition"
  AND a."Date of Admission" = b."Date of Admission"
  AND a."Doctor" = b."Doctor"
  AND a."Hospital" = b."Hospital"
  AND a."Insurance Provider" = b."Insurance Provider"
  AND a."Billing Amount" = b."Billing Amount"
  AND a."Admission Type" = b."Admission Type"
  AND a."Discharge Date" = b."Discharge Date"
  AND a."Medication" = b."Medication"
  AND a."Age Range" = b."Age Range";

--- Confirm no duplicates exist ---

SELECT COUNT(*) AS total_rows FROM healthcare_dataset;
 
SELECT
    "First Name", "Last Name", "Age", "Date of Admission",
    COUNT(*) AS occurrences
FROM healthcare_dataset
GROUP BY "First Name", "Last Name", "Age", "Date of Admission"
HAVING COUNT(*) > 1;
-- ^ this should return 0 rows if dedup worked