import sqlite3
from tabulate import tabulate

def run_queries(db_path, sql_file):
    with sqlite3.connect(db_path) as conn, open(sql_file, "r") as f:
        queries = f.read().split(";")
        for query in queries:
            query = query.strip()
            if query:
                print(f"Query aan het uitvoeren:\n{query}\n")
                cursor = conn.execute(query)
                rows = cursor.fetchall()

                # If the query returns columns (e.g. a SELECT), format them
                if cursor.description: 
                    headers = [desc[0] for desc in cursor.description]
                    print(tabulate(rows, headers=headers, tablefmt="psql"))
                else:
                    print("Geen Select Statement.")

                print("----\n")

if __name__ == "__main__":
    DB_PATH = "music.db"        # Path to your database
    SQL_FILE = "queries.sql"  # Path to the SQL file

    run_queries(DB_PATH, SQL_FILE)
