import psycopg2
import csv
import os

conn = psycopg2.connect(
    dbname="knesset_db",
    user="postgres",
    password="ronron123123",
    host="localhost"
)
cur = conn.cursor()

base_path = r'C:\Users\TLP-299\PycharmProjects\DB_ex3'

with open(os.path.join(base_path, 'drop.sql'), 'r') as f:
    cur.execute(f.read())
with open(os.path.join(base_path, 'create.sql'), 'r') as f:
    cur.execute(f.read())

members_csv = os.path.join(base_path, 'members.csv')
if os.path.exists(members_csv):
    with open(members_csv, 'r', encoding='utf-8') as f:
        reader = csv.reader(f)
        next(reader)  # Skip the header row
        for row in reader:
            uid, name, occupation, birthPlace, gender, educatedAt, language, birthYear = row
            cur.execute(
                "INSERT INTO members (uid, name, occupation, birthPlace, gender, educatedAt, language, birthYear) "
                "VALUES (%s, %s, %s, %s, %s, %s, %s, %s)",
                (uid, name, occupation, birthPlace, gender, educatedAt, language, birthYear)
            )
else:
    print(f"Error: File '{members_csv}' not found.")

membersInKnesset_csv = os.path.join(base_path, 'memberInKnesset.csv')
if os.path.exists(membersInKnesset_csv):
    with open(membersInKnesset_csv, 'r', encoding='utf-8') as f:
        reader = csv.reader(f)
        next(reader)  # Skip the header row
        for row in reader:
            uid, number, party = row
            cur.execute(
                "INSERT INTO memberInKnesset (uid, number, party) VALUES (%s, %s, %s)",
                (uid, number, party)
            )
else:
    print(f"Error: File '{membersInKnesset_csv}' not found.")

knessets_csv = os.path.join(base_path, 'knessets.csv')
if os.path.exists(knessets_csv):
    with open(knessets_csv, 'r', encoding='utf-8') as f:
        reader = csv.reader(f)
        next(reader)  # Skip the header row
        for row in reader:
            number, startYear, endYear = row
            cur.execute(
                "INSERT INTO knessets (number, startYear, endYear) VALUES (%s, %s, %s)",
                (number, startYear, endYear)
            )
else:
    print(f"Error: File '{knessets_csv}' not found.")

conn.commit()
cur.close()
conn.close()