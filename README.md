# Healthcare Dataset Analysis

## Overview
This project is a simple analysis of a healthcare dataset sourced from Kaggle. The objective is to find trends and patterns within the dataset, visualize and report our findings.   

## Dataset
This dataset was exported from Kaggle and consists of about 55,500 records and 15 attributes. The author used Python's Faker library to generate data that mirrors structures and attributes commonly found in healthcare databases. Each row represents a synthetic patient record and none of the data is from an actual healthcare database. Here is a brief explanation of each column:

`First Name`: This represents the first name of the patient associated with this healthcare record
`Last Name`: This represents the last name of the patient associated with the healthcare record
`Gender`: This is the gender of the patient, which can be either 'Male' or 'Female'.
`Age`: The age of the patient at the time of being admitted, expressed in years.
`Blood Type`: The patient's blood type, which can be one of the common types (e.g., "A+", "O-", etc.).
`Medical Condition`: The primary medical condition or diagnosis of the patient such as "Asthma", "Diabetes", "Obesity", etc.
`Date of Admission`: Date when the patient was admitted to the healthcare facility.
`Doctor`: The name of the doctor responsible for the care of the patient when admitted.
`Hospital`: Identifies the healthcare facility the patient was admitted to.
`Insurance Provider`: This column identifies the insurance provider of the patient.
`Billing Amount`: This is the amount billed for the patient's healthcare services. Originally, it was expressed as a floating point number before being converted to a numeric data type.
`Admission Type`: Specifies the type of admission, which can be "Emergency," "Elective," or "Urgent".
`Discharge Date`: Date when the patient was discharged from the healthcare facility.
`Medication`: Medication that was prescribed or administered during their stay in the healthcare facility.
`Age Range`: Clinical age brackets based on `Age` (Adolescent (13-17), Young Adult (18-35), Adult (36-55), Middle-Aged (56-65), and Senior (66+)).

## Project Structure
```
├── analysis/
│   └── analysis.sql
├── data/
│   ├── healthcare_dataset_processed.csv
│   └── healthcare_dataset.csv
├── notebooks/
│   └── explore.ipynb
├── scripts/
│   ├── dedup_healthcare.sql
│   └── load_to_postgres.py
├── visualizations/
├── .env.example
├── README.md
└── requirements.txt
```

## Data Cleaning
- [x] Split Name into First Name / Last Name (Honorifics were kept in)
- [x] Standardized Hospital column (trailing commas, dangling "and")
- [x] Changed Date of Admission and Discharge Date from text to date data type
- [x] Rounded Billing Amount to 2 decimal places
- [x] Removed Room Number and Test Results columns
- [x] Added primary key (patient_id)
- [x] Created Age Range column (clinical brackets)
- [x] Removed duplicate records
- [x] Filtered out 108 records with negative Billing Amount (likely a data-generation artifact) in the Q3 and Q4 billing analysis queries

## Pipeline / How to Reproduce
The processed dataset (`healthcare_dataset_processed.csv`) is already included, so you can skip to step 3
to reproduce the results. Steps 1 and 2 describe how it was originally cleaned.

1. Imported `healthcare_dataset` into Google Sheets and cleaned the data
2. Exported cleaned data as CSV
3. Ran `load_to_postgres.py` to finalize data transformation and load into Postgres
4. Ran `dedup_healthcare.sql` to add a primary key and remove duplicate records
5. Ran `analysis.sql` to answer the six analysis questions

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

## Exploratory Data Analysis
`notebooks/explore.ipynb` contains exploratory analysis of the cleaned dataset — column info, 
summary statistics, categorical distributions, null checks, and the length-of-stay calculation. 
This is supplementary and not required to reproduce the final analysis in `analysis/analysis.sql`. This notebook is also where the negative Billing Amount values (see Data Cleaning) were 
first identified via `df.describe()`.

## Analysis Questions
1. How many patients were enrolled in each hospital?
2. What is the most common medical condition for each combination of age range and gender? 
3. What is the average billing amount by medical condition, and does it have any correlation with the insurance provider?
4. How did the average billing amounts for admitted patients differ each year?
5. How has the average patient length of stay changed year over year?
6. What is the overall age profile of the hospitals' patient population?

## Key Findings
<!-- Fill in after Tableau is done - 3-5 bullet takeaways -->
-
-
-

## Dashboard
[View the interactive dashboard on Tableau Public](https://public.tableau.com/app/profile/kenyon.nyangai/viz/Healthcare_DatasetDashboard/Dashboard1)

## Tools Used
- PostgreSQL
- Python (pandas, SQLAlchemy)
- Google Sheets
- Tableau Public

## Author
Kenyon Nyangai
[GitHub](https://github.com/KNAthari) · [LinkedIn](https://www.linkedin.com/in/kenyon-nyangai/)
