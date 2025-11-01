# Task 4 — Optimize Complex Queries (MySQL)

## 🎯 Objective
Refactor and optimize a complex SQL query to improve execution time and reduce resource usage.

---

## 🧾 1️⃣ Original Query
The initial query joined four tables (`bookings`, `users`, `properties`, and `payments`) without proper indexing or filtering optimization.

```sql
SELECT
  b.booking_id, u.first_name, u.last_name,
  p.name AS property_name, pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.payment_id = pay.payment_id
WHERE pay.status = 'completed';
