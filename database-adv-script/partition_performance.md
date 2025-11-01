# Task 5 — Partitioning Large Tables (MySQL)

## 🎯 Objective
Implement **table partitioning** on the `bookings` table to enhance query performance for date-based queries.

---

## 🧾 1️⃣ Before Partitioning
### Example Query:
```sql
SELECT * FROM bookings
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
