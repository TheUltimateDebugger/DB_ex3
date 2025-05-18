import psycopg2

# --- CONFIGURE YOUR DATABASE CONNECTION HERE ---
DB_NAME = "knesset_db"
USER = "postgres"
PASSWORD = "ronron123123"
HOST = "localhost"
SQL_FILE = "create.sql"  # <-- change to any .sql file you want

# --- CONNECT AND RUN SQL FILE ---
try:
    with psycopg2.connect(dbname=DB_NAME, user=USER, password=PASSWORD, host=HOST) as conn:
        with conn.cursor() as cur:
            with open(SQL_FILE, 'r') as f:
                sql = f.read()
                cur.execute(sql)
                print(f"Successfully ran {SQL_FILE}")
except Exception as e:
    print("Error running SQL file:", e)
