import pandas as pd 
import pyodbc 

conn_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=localhost;"           
    "DATABASE=local-retail-dwh;"          
    "Trusted_Connection=yes;"
)

conn = pyodbc.connect(conn_str)
cursor = conn.cursor()

base_path = "../data/"
tables = {
    "dim_product": "products.csv",
    "dim_customer": "customers.csv",
    "dim_time": "time.csv",
    "fact_sales": "sales.csv"
}

for table, csv_file in tables.items():
    print(f"Inserting into {table}...")
    df = pd.read_csv(base_path + csv_file)

    for _, row in df.iterrows():
        placeholders = ','.join('?'*len(row))
        sql = f"Insert into {table} values ({placeholders})"
        cursor.execute(sql, tuple(row))

    conn.commit()

print("Data loaded successfully.")
cursor.close()
conn.close()