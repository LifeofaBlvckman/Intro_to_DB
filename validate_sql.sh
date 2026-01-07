#!/bin/bash
echo "=== ALX Book Store Database Schema Validation ==="
echo

echo "1. File Check:"
if [ -f "alx_book_store.sql" ]; then
    echo "✅ File exists: alx_book_store.sql"
    echo "   Size: $(wc -l < alx_book_store.sql) lines"
else
    echo "❌ File missing!"
    exit 1
fi

echo
echo "2. Required Tables Check:"
echo "   Looking for 5 tables: Authors, Books, Customers, Orders, Order_Details"
TABLE_COUNT=$(grep -c "CREATE TABLE" alx_book_store.sql)
echo "   Found: $TABLE_COUNT CREATE TABLE statements"

if [ $TABLE_COUNT -eq 5 ]; then
    echo "   ✅ Correct number of tables"
else
    echo "   ❌ Expected 5 tables"
fi

echo
echo "3. Table Names:"
grep "CREATE TABLE" alx_book_store.sql | sed 's/CREATE TABLE //' | sed 's/ (//' | while read table; do
    echo "   - $table"
done

echo
echo "4. Foreign Key Constraints:"
FK_COUNT=$(grep -c "FOREIGN KEY" alx_book_store.sql)
echo "   Found: $FK_COUNT FOREIGN KEY constraints"

if [ $FK_COUNT -eq 4 ]; then
    echo "   ✅ Correct number of foreign keys"
else
    echo "   ❌ Expected 4 foreign keys"
fi

echo
echo "5. SQL Keywords Uppercase Check:"
LOWERCASE_KEYWORDS=$(grep -i "create table\|alter table\|drop table\|insert into\|select \|update \|delete from" alx_book_store.sql | grep -v "CREATE TABLE\|ALTER TABLE\|DROP TABLE\|INSERT INTO\|SELECT \|UPDATE \|DELETE FROM")
if [ -z "$LOWERCASE_KEYWORDS" ]; then
    echo "   ✅ All SQL keywords are uppercase"
else
    echo "   ❌ Found lowercase SQL keywords:"
    echo "$LOWERCASE_KEYWORDS"
fi

echo
echo "6. Primary Keys Check:"
PK_COUNT=$(grep -c "PRIMARY KEY" alx_book_store.sql)
echo "   Found: $PK_COUNT PRIMARY KEY constraints"

echo
echo "7. Data Types Check:"
echo "   Checking for required data types:"
grep -o "VARCHAR([0-9]*)\|INT\|DOUBLE\|DATE\|TEXT" alx_book_store.sql | sort | uniq -c | while read count type; do
    echo "   - $type: $count occurrences"
done

echo
echo "=== Summary ==="
if [ $TABLE_COUNT -eq 5 ] && [ $FK_COUNT -eq 4 ] && [ -z "$LOWERCASE_KEYWORDS" ]; then
    echo "✅ PASS: Schema meets all requirements!"
else
    echo "❌ FAIL: Issues found in schema"
fi
