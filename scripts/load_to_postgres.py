import os
from dotenv import load_dotenv
import pandas as pd
from pathlib import Path
from sqlalchemy import create_engine

BASE_DIR = Path(__file__).resolve().parent
DATA_PATH = BASE_DIR.parent / "data" / "healthcare_dataset_processed.csv"

df = pd.read_csv(DATA_PATH)

# Rebuild Age Range with clinical brackets
bins = [12, 17, 35, 55, 65, 89]
labels = ['Adolescent (12 - 17)', 'Young Adult (18 - 35)', 'Adult (36 - 55)', 'Middle-Aged (56 - 65)', 'Senior (66+)']
df['Age Range'] = pd.cut(df['Age'], bins=bins, labels=labels, right=True)

load_dotenv() #load enviromental files into variables

db_user = os.getenv("DB_USER")
db_host = os.getenv("DB_HOST")
db_port = os.getenv("DB_PORT")
db_name = os.getenv("DB_NAME")

# Connect to postgres sql
engine = create_engine(f'postgresql://{db_user}@{db_host}:{db_port}/{db_name}')

# write the dataframe to a new table
df.to_sql('healthcare_dataset', engine, if_exists='replace', index=False)

print("Done — 'healthcare_dataset' table created with updated Age Range") 

result = pd.read_sql('SELECT * FROM healthcare_dataset LIMIT 5', engine)
print(result)


