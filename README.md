# Local Retail Data Warehouse

## Project Overview

This project demonstrates the design and implementation of a simple local data warehouse for retail sales analysis using SQL Server and Python.  
It includes data modeling, ETL (Extract, Transform, Load) processes, and reporting visualizations.

---

## Features

- **Star Schema Data Model:**  
  Fact table (`fact_sales`) with dimension tables (`dim_product`, `dim_customer`, `dim_time`).

- **ETL Pipeline:**  
  Python scripts load sample CSV data into SQL Server tables.

- **Reporting Views:**  
  SQL views simplify common business queries (e.g., sales by product, customer segment, time).

- **Analysis & Visualization:**  
  Jupyter Notebook with pandas and seaborn to analyze and visualize sales data.

---

## Technologies Used

- **SQL Server** — for relational data storage and querying  
- **Python** — for ETL and analysis (`pandas`, `sqlalchemy`, `pyodbc`, `seaborn`, `matplotlib`)  
- **Jupyter Notebook** — interactive data analysis and visualization  
- **CSV Files** — sample data sources
  
---

## Getting Started

### Prerequisites

- SQL Server installed locally or accessible remotely  
- Python 3.x installed  
- Required Python packages (see requirements.txt)

### Setup Instructions

1. **Create Database & Tables:**  
   Run the SQL script `sql/create_tables.sql` in SQL Server Management Studio or your preferred tool.

2. **Prepare CSV Data:**  
   Place the sample CSV files in the `/data` directory:
   - `products.csv`
   - `customers.csv`
   - `time.csv`
   - `sales.csv`

3. **Load Data with ETL Script:**  
   Run the Python ETL script to load CSV data into the database:
   ```bash
   python etl/load_data.py
