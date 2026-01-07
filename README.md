# ALX Book Store Database Schema

## Project Description
MySQL database schema for an online bookstore as required by ALX Introduction to Databases course.

## Schema Details
- **Database Name**: alx_book_store
- **Tables**: 5 (Authors, Books, Customers, Orders, Order_Details)
- **Foreign Keys**: 4 relationships
- **File**: alx_book_store.sql

## Validation
Run the validation script to verify the schema:
```bash
./validate_sql.sh
```

## Requirements Met
- ✅ Correct file name: alx_book_store.sql
- ✅ 5 tables with proper structure
- ✅ 4 foreign key constraints
- ✅ All SQL keywords in UPPERCASE
- ✅ Appropriate data types and constraints

## How to Use
1. Execute in MySQL:
   ```bash
   mysql -u root -p < alx_book_store.sql
   ```

2. Verify installation:
   ```sql
   SHOW DATABASES;
   USE alx_book_store;
   SHOW TABLES;
   ```

## Author
ALX Software Engineering Student

## License
Educational project for ALX Software Engineering Program
