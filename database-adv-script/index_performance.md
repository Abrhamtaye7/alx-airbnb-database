# Task 3 — Implement Indexes for Optimization (MySQL)

## 🎯 Objective
Optimize database performance by creating indexes on frequently queried columns and measuring improvements.

---

## ⚙️ Step 1: Identify High-Usage Columns
Based on common query patterns:
- `users.email` → often used for login or account retrieval  
- `bookings.user_id`, `bookings.property_id`, `bookings.start_date` → frequent filters and joins  
- `properties.host_id`, `properties.location` → used for property searches and host listings  

---

## 🧱 Step 2: Index Creation
Indexes created:
```sql
CREATE UNIQUE INDEX idx_users_email ON users (email);
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_bookings_start_date ON bookings (start_date);
CREATE INDEX idx_properties_host_id ON properties (host_id);
CREATE INDEX idx_properties_location ON properties (location);
