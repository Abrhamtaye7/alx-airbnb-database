## 💾 database-script-0x02: Database Seeding Script

This directory contains the SQL script responsible for populating the empty database schema with representative sample data. This is crucial for initial development, testing the application logic, and verifying the relationships and constraints defined in the schema.

### ⚙️ Contents

| File Name | Description |
| :--- | :--- |
| **`seed.sql`** | Contains a series of `INSERT INTO` statements to populate all six tables (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`) with sample records. |

### ✨ Seeding Strategy

The sample data is designed to demonstrate key real-world scenarios:

* **User Roles:** Includes users with `host`, `guest`, and `admin` roles.
* **Relationships:** Ensures all Foreign Key relationships are valid (e.g., Bookings are linked to existing Users and Properties).
* **Constraints:**
    * Booking statuses include `confirmed`, `pending`, and a `canceled` example.
    * Review ratings fall within the valid `1-5` range.
    * Message data demonstrates user-to-user communication (e.g., guest asking host a question).
* **UUID Usage:** Uses fixed, dummy UUIDs to maintain consistent referential integrity between the tables in the script.

### ⚠️ Important Note on UUIDs

The `seed.sql` uses static UUIDs (e.g., `'a0eebc99-...'`) for demonstration simplicity. In a production environment or when writing dynamic application code, UUIDs should be generated programmatically to ensure true uniqueness (e.g., using functions like `gen_random_uuid()` in PostgreSQL or `UUID_TO_BIN(UUID())` in MySQL).

### 🚀 Execution Instructions

After successfully creating the database schema (using `schema.sql` from the previous directory), run this script to populate the tables:

1.  **Ensure** your database is running and the schema is created.
2.  **Execute** the seeding script against your database:

```bash
# Example for PostgreSQL:
psql -d airbnb_db -f seed.sql

# Example for MySQL:
mysql -u root -p airbnb_db < seed.sql
