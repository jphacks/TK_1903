import os
import psycopg2


# https://qiita.com/hoto17296/items/0ca1569d6fa54c7c4732
def get_connection():
    dsn = os.environ.get('DATABASE_URL')
    return psycopg2.connect(dsn)


def run_query(query):
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute(query)


def get_rows(query):
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute(query)
            for row in cur:
                print(row)