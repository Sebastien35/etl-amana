import sqlalchemy

DB_CREDS = {
    "host": "localhost",
    "user": "user",
    "password": "password",
    "dbname": "mydatabase",
    "port": 5432,
}


class DBConnector:
    def __init__(self, db_creds=DB_CREDS):
        self.db_creds = db_creds
        self.connection = None

    
    def connect(self):
        """Establishes or reuses the PostgreSQL connection."""
        if not self.connection:
            engine = sqlalchemy.create_engine(
                f"postgresql+psycopg://{self.db_creds['user']}:{self.db_creds['password']}@{self.db_creds['host']}:{self.db_creds['port']}/{self.db_creds['dbname']}"
            )
            self.connection = engine.raw_connection()
        return self.connection


    def execute_query(self, query: str, params: tuple = None, fetch: str = "all"):
        """
        Exécute une requête SQL et renvoie les résultats.
        fetch peut être :
            - "all"  → fetchall()
            - "one"  → fetchone()
            - None   → pas de fetch (pour INSERT/UPDATE/DELETE)
        """
        conn = self.connect()
        try:
            with conn.cursor() as cursor:
                cursor.execute(query, params)
                if fetch == "all":
                    result = cursor.fetchall()
                elif fetch == "one":
                    result = cursor.fetchone()
                else:
                    result = None
            conn.commit()
            return result
        except Exception as e:
            conn.rollback()
            raise e

    def close(self):
        if self.connection:
            self.connection.close()
            self.connection = None

    def __enter__(self):
        self.connect()
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        self.close()


# def test():
#     db_connector = DBConnector()
#     with db_connector:
#         result = db_connector.execute_query("SELECT NOW();", fetch="one")
#         print("Current Time from DB:", result)


# test()
