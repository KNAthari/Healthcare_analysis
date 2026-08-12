# Healthcare Dataset Analysis

## Overview
<!-- 2-3 sentences: what is this project, what dataset, what was the goal -->
This project is a simple analysis of a healthcare dataset called `healthcare dataset`. This objective is to find trends and patterns within the dataset, visualize and report our findings.   

## Dataset
<!-- Source of the data, number of records, brief description of columns -->
This dataset was exported from kaggle and consists of about 55,500 records and 15 attributes. The author used python's faker library to generate data that mirrors structures and attributes commonly found in healthcare databases. Each row represents a synthetic patient record and none of the data is from an actual healthcare database. Here is a brief explanation of each column:

`First Name`: This represents the first name of the patient associated with this healthcare record
`Last Name`: This represents the last name of the patient associated with the healthcare record
`Gender`: This is the gender of the patient, they can be either 'Male' or 'Female'.
`Age`: The age of the patient at the time of being admitted, expressed in years.
`Blood Type`: The patient's blood type, which can be one of the common types (e.g., "A+", "O-", etc.).
`Medical Condition`: The primary medical condition or diagnosis of the patient such as "Asthama", "Diabetes", "Obsetity", etc.
`Date of Admission`: Date when the patient was admitted to the healthcare facility.
`Doctor`: The name of the doctor responsible for the care of the patient when admitted
`Hospital`: Identifies the healthcare facility the patient was admitted.
`Insurance Provider`: This column identifies the insurance provider of the patient.
`Billing Amount`: This is the amount billed for the patient's healthcare services. Originally, it was expressed as a floating point number before converting it to numeric.
`Admission Type`: Specifies the type of admission, which can be "Emergency," "Elective," or "Urgent".
`Discharge Date`: Date when the patient was discharged from the healthcare facility.
`Medication`: Medication that was prescribed or administered during their stay in the healthcare facility.
`Age Range`: Clinical age brackets based on `Age` (Adolescent (13-17), Young Adult (18-35), Adult (36-55), Middle-Aged (56-65), and Senior (66+)).

## Project Structure
```
├── data/
│   └── healthcare_dataset_processed.csv
├── notebooks/
│   └── explore.ipynb
├── scripts/
│   ├── load_to_postgres.py
│   └── dedup_patients.sql
├── analysis/
│   └── analysis.sql
├── visualizations/
├── .env.example
├── requirements.txt
└── README.md
```

## Data Cleaning
<!-- List your cleaning steps here, e.g.: -->
- [ ] Split Name into First Name / Last Name
- [ ] Standardized Hospital column (trailing commas, dangling "and")
- [ ] Formatted Insurance Provider (UnitedHealthcare)
- [ ] Removed Room Number and Test Results columns
- [ ] Added primary key (patient_id)
- [ ] Created Age Range column (clinical brackets)
- [ ] Rounded Billing Amount to 2 decimal places
- [ ] Removed duplicate records

## Pipeline / How to Reproduce
<!-- Step by step: Sheets cleanup -> CSV -> pandas -> Postgres -->
1.
2.
3.

### Setup
```bash
pip install -r requirements.txt
```
Copy `.env.example` to `.env` and fill in your database credentials.

### Run
```bash
python scripts/load_to_postgres.py
psql -d healthcare_db -f scripts/dedup_patients.sql
psql -d healthcare_db -f analysis/analysis.sql
```

## Analysis Questions
<!-- Your six questions, one line each -->
1. How many patients were enrolled in each hospital?
2. What are the leading medical conditions, and at what age range/gender do they occur?
3. What is the average billing amount by medical condition? Does it correlate with insurance provider?
4. Is average billing rising, falling, or flat year over year?
5. What is the average age of patients?
6. Has average length of stay changed over time?

## Key Findings
<!-- Fill in after Tableau is done - 3-5 bullet takeaways -->
-
-
-

## Dashboard
<!-- Link to Tableau Public once published -->
[View the interactive dashboard on Tableau Public](#)

## Tools Used
- PostgreSQL
- Python (pandas, SQLAlchemy)
- Google Sheets
- Tableau Public

## Author
<!-- Your name / contact / portfolio link -->
