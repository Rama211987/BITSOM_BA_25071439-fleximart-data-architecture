import pandas as pd
from sqlalchemy import create_engine

#Read csv File
df = pd.read_csv("customers_clean.csv")
print(df)

# Create DB connection
from sqlalchemy import create_engine
engine = create_engine(
    "mysql+pymysql://root:1234@localhost:3306/fleximart"
)


# Load data
df.to_sql(
    "dim_customers",
    engine,
    if_exists="replace",   # replaces table if exists
    index=False
)
print("✅ Data loaded into MySQL successfully")


import pandas as pd
from sqlalchemy import create_engine

#Read csv File
df = pd.read_csv("products_clean.csv")
print(df)

# Create DB connection
from sqlalchemy import create_engine
engine = create_engine(
    "mysql+pymysql://root:1234@localhost:3306/fleximart"
)


# Load data
df.to_sql(
    "dim_customers",
    engine,
    if_exists="replace",   # replaces table if exists
    index=False
)
print("✅ Data loaded into MySQL successfully")


import pandas as pd
from sqlalchemy import create_engine

#Read csv File
df = pd.read_csv("sales_clean.csv")
print(df)

# Create DB connection
from sqlalchemy import create_engine
engine = create_engine(
    "mysql+pymysql://root:1234@localhost:3306/fleximart"
)


# Load data
df.to_sql(
    "dim_customers",
    engine,
    if_exists="replace",   # replaces table if exists
    index=False
)
print("✅ Data loaded into MySQL successfully")


# ---------- WRITE REPORT ----------
import pandas as pd

report_lines = []
report_lines.append("DATA QUALITY REPORT")
report_lines.append("===================\n")

def process_file(raw_file, clean_file):
    raw_df = pd.read_csv(raw_file)
    clean_df = pd.read_csv(clean_file)

    records_processed = len(raw_df)
    records_loaded = len(clean_df)

    duplicates_removed = records_processed - len(raw_df.drop_duplicates())

    missing_values_handled = raw_df.isnull().sum().sum() - clean_df.isnull().sum().sum()

    return (
        records_processed,
        duplicates_removed,
        missing_values_handled,
        records_loaded
    )

# ---------- CUSTOMERS ----------
c_processed, c_dup, c_missing, c_loaded = process_file(
    "customers_raw.csv",
    "customers_clean.csv"
)

report_lines.extend([
    "File: customers",
    f"Records processed: {c_processed}",
    f"Duplicates removed: {c_dup}",
    f"Missing values handled: {c_missing}",
    f"Records loaded successfully: {c_loaded}\n"
])

# ---------- PRODUCTS ----------
p_processed, p_dup, p_missing, p_loaded = process_file(
    "products_raw.csv",
    "products_clean.csv"
)

report_lines.extend([
    "File: products",
    f"Records processed: {p_processed}",
    f"Duplicates removed: {p_dup}",
    f"Missing values handled: {p_missing}",
    f"Records loaded successfully: {p_loaded}\n"
])

# ---------- SALES ----------
s_processed, s_dup, s_missing, s_loaded = process_file(
    "sales_raw.csv",
    "sales_clean.csv"
)

report_lines.extend([
    "File: sales",
    f"Records processed: {s_processed}",
    f"Duplicates removed: {s_dup}",
    f"Missing values handled: {s_missing}",
    f"Records loaded successfully: {s_loaded}\n"
])

# ---------- WRITE REPORT ----------
with open("data_quality_report.txt", "w") as f:
    f.write("\n".join(report_lines))

print("✅ data_quality_report.txt generated successfully")