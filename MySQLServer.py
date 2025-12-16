import mysql.connector
import os
from dotenv import load_dotenv
import subprocess

load_dotenv()


def createDB():
    conn = None

    try:
        conn = mysql.connector.connect(
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD"),
            unix_socket="/tmp/mysql.sock",
        )

        if conn.is_connected:
            cursor = conn.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")
            conn.close()
    except mysql.connector.Error as err:
        print(f"Error while while connecting database: {err}")

    finally:
        if conn is not None and conn.is_connected():
            conn.close()


if __name__ == "__main__":
    createDB()
