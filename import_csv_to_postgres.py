import pandas as pd
from sqlalchemy import create_engine

def import_csv_to_postgres():
    username = "std_data"
    password = "P@ssw0rd2025"
    host = "localhost"
    port = "5432"
    database = "STUDENTDW"

    engine = create_engine(f"postgresql://{username}:{password}@{host}:{port}/{database}")

    csv_file = "books_data.csv"
    df = pd.read_csv(csv_file)

    table_name = "books"
    df.to_sql(table_name, engine, if_exists='replace', index=False)

    print("Data imported successfully!")

if __name__ == "__main__":
    import_csv_to_postgres()
