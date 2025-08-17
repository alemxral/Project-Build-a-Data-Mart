# Airbnb Database Management System

## Project Overview
This project implements a complete relational database for an Airbnb-style booking platform using MySQL. The system supports user management, property listings, reservations, payments, reviews, amenities, support, referral programs, and administrative functions.

---

## File Structure

- `create_table.sql` — Creates all tables and relationships for the database.
- `data.sql` — Inserts sample data (at least 20 records per table).
- `test.sql` — Integrity and join tests for the database.
- `cleandata.sql` — Truncates all tables (removes all data, keeps the structure).
- `deletetables.sql` — Drops all tables (removes structure and data).

---

## Installation Instructions

### Prerequisites
- **Database**: MySQL 8.0 or higher
- **Tools**: MySQL Workbench, DBeaver, or command-line MySQL client

### Steps

1. **Create Database**
   - Open MySQL Workbench or the terminal.
   - Run:
     ```sql
     CREATE DATABASE airbnb;
     USE airbnb;
     ```

2. **Create Tables**
   - Execute `create_table.sql` to create all tables in the correct order.
   - This script also drops existing tables if they exist.

3. **Insert Sample Data**
   - Execute `data.sql` to populate tables with at least 20 sample rows per table.

4. **Run Integrity Tests**
   - Execute `test.sql` to check data integrity, foreign keys, joins, and constraints.
   - Review test outputs for "OK" messages confirming successful checks.

---

## Usage Instructions

- **Reset Data (but keep tables):**
  - Run `cleandata.sql` to truncate all tables and remove data.

- **Delete All Tables:**
  - Run `deletetables.sql` to drop all tables from the database.

- **Reinstall:**
  - After running `deletetables.sql`, repeat steps 2 and 3 above to recreate and repopulate tables.

---

## Testing

The `test.sql` file validates:
- That all tables have at least 20 rows.
- That key joins between tables work correctly.
- That foreign key constraints and check constraints are enforced.

You can also run custom queries to explore the schema and data, such as:
```sql
SELECT * FROM reservations LIMIT 10;
SELECT property_listings.title, hosts.host_rating
  FROM property_listings
  JOIN hosts ON property_listings.host_id = hosts.host_id
  LIMIT 5;
```

---

## System Metadata

- **Total Tables:** 22
- **Sample Records:** ≥ 20 per table (440+ rows total)
- **Sample Data:** Provided in `data.sql`

---

## Troubleshooting

- If you encounter foreign key errors, make sure to run scripts in the recommended order.
- If needed, disable foreign key checks with:
  ```sql
  SET FOREIGN_KEY_CHECKS = 0;
  ```
  ...and re-enable with:
  ```sql
  SET FOREIGN_KEY_CHECKS = 1;
  ```
- If the database already exists, you can safely rerun the scripts; tables will be dropped and recreated.

---

## Contact

For questions, please contact:  
[alejandro.moralaranda@iu-study.org]

---

**GitHub Repository:**  
https://github.com/alemxral/Project-Build-a-Data-Mart
