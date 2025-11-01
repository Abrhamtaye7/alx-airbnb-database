# Task 0 — Write Complex Queries with Joins  
**Module:** ALX Airbnb Database Project  
**Database:** MySQL  

---

## 🎯 Objective
Practice writing complex SQL joins to retrieve and combine related data from multiple tables in the Airbnb database schema.  
This task covers **INNER JOIN**, **LEFT JOIN**, and **FULL OUTER JOIN (MySQL equivalent)**.

---

## 🧩 Schema Assumptions
The queries assume these main tables:

| Table | Key Columns | Description |
|-------|--------------|--------------|
| `users` | `user_id` (PK) | Guests or hosts |
| `properties` | `property_id` (PK), `host_id` (FK → users.user_id) | Airbnb listings |
| `bookings` | `booking_id` (PK), `user_id` (FK → users.user_id), `property_id` (FK → properties.property_id) | Booking records |
| `reviews` | `review_id` (PK), `property_id` (FK → properties.property_id) | User reviews of properties |

---

## 🧠 Tasks Implemented

### 1️⃣ INNER JOIN — Bookings and Users
Retrieves all bookings along with the user who made each booking.  
Only records that exist in **both** tables are returned.

SELECT
  b.booking_id, b.property_id, b.start_date, b.end_date, b.total_price,
  u.user_id, u.first_name, u.last_name, u.email
FROM bookings AS b
INNER JOIN users AS u
  ON b.user_id = u.user_id;


### 2️⃣ LEFT JOIN — Properties and Hosts
Retrieves all properties along with the host
SELECT
  p.property_id, p.name AS property_name, p.location,
  r.review_id, r.user_id AS reviewer_id, r.rating, r.comment
FROM properties AS p
LEFT JOIN reviews AS r
  ON p.property_id = r.property_id;


### 3️⃣ FULL OUTER JOIN Equivalent — Users and Bookings
SELECT
  u.user_id, u.first_name, u.last_name,
  b.booking_id, b.property_id, b.start_date, b.end_date
FROM users AS u
LEFT JOIN bookings AS b
  ON u.user_id = b.user_id

UNION ALL

SELECT
  u.user_id, u.first_name, u.last_name,
  b.booking_id, b.property_id, b.start_date, b.end_date
FROM bookings AS b
LEFT JOIN users AS u
  ON u.user_id = b.user_id
WHERE u.user_id IS NULL;
    who listed each property.

---

---

## 🔍 Task 1 — Practice Subqueries
**Goal:**  
Use subqueries (both non-correlated and correlated) to retrieve insights from multiple related tables.

### 1️⃣ Non-Correlated Subquery — Properties with High Ratings
Find properties that have an **average rating greater than 4.0**.

```sql
SELECT
  p.property_id, p.name, p.location
FROM properties AS p
WHERE p.property_id IN (
  SELECT property_id
  FROM reviews
  GROUP BY property_id
  HAVING AVG(rating) > 4.0
);


## 🧮 Task 2 — Apply Aggregations and Window Functions
**Goal:**  
Use MySQL’s aggregation and window functions to summarize and rank data efficiently.

### 1️⃣ Total Bookings by Each User
Count all bookings per user using `COUNT()` and `GROUP BY`.

```sql
SELECT
  u.user_id,
  CONCAT(u.first_name, ' ', u.last_name) AS full_name,
  COUNT(b.booking_id) AS total_bookings
FROM users AS u
LEFT JOIN bookings AS b
  ON u.user_id = b.user_id
GROUP BY u.user_id, full_name;


### How to Run the Script
mysql -u <username> -p airbnb_db < joins_queries.sql