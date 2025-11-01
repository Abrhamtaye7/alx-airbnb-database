# Task 6 — Monitor and Refine Database Performance (MySQL)

## 🎯 Objective
Continuously monitor query performance and refine database structure to ensure optimal speed and efficiency.

---

## 🧩 1️⃣ Tools Used
| Tool | Description |
|------|--------------|
| **EXPLAIN** | Displays execution plan for a query |
| **EXPLAIN ANALYZE** | Measures actual execution time for each step |
| **SHOW PROFILE** | Displays detailed breakdown of query resource usage |
| **SHOW STATUS** | Provides global statistics on MySQL server activity |

---

## 🧠 2️⃣ Identify Performance Bottlenecks
Example query:
```sql
SELECT
  b.booking_id,
  u.first_name,
  u.last_name,
  p.name AS property_name,
  pay.amount
FROM bookings AS b
JOIN users AS u ON b.user_id = u.user_id
JOIN properties AS p ON b.property_id = p.property_id
JOIN payments AS pay ON b.payment_id = pay.payment_id
WHERE pay.status = 'completed';
