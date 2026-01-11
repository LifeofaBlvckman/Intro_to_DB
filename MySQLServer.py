#!/usr/bin/python3
"""
MySQL Database Creation Script
Creates the alx_book_store database
"""

import mysql.connector
from mysql.connector import Error


def create_database():
    """
    Connect to MySQL server and create alx_book_store database
    Uses CREATE DATABASE IF NOT EXISTS to avoid failure if DB exists
    """
    connection = None
    
    try:
        # Connect to MySQL server (without specifying a database)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",      # Update with your MySQL username
            password=""       # Update with your MySQL password if needed
        )
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Create database if it doesn't exist
        # Using CREATE DATABASE IF NOT EXISTS as required
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        
        # Print success message
        print("Database 'alx_book_store' created successfully!")
        
    except Error as e:
        # Print error message if connection fails
        print(f"Error: Failed to connect to MySQL server - {e}")
        
    finally:
        # Close connection if it was established
        if connection and connection.is_connected():
            cursor.close()
            connection.close()


if __name__ == "__main__":
    # Execute the database creation function
    create_database()
