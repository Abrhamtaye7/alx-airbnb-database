-- ====================================================================
-- ALX Airbnb Database Module
-- Task 3: Implement Indexes for Optimization
-- File: database_index.sql
-- ====================================================================
-- Description:
-- This script identifies performance-critical columns and creates
-- indexes to optimize queries in MySQL.
-- ====================================================================


-- ==============================================================
-- 3.1 Identify High-Usage Columns
-- Based on frequent joins, filters, and sorts, we will index:
users.email                (fast login/user lookup)
bookings.user_id           (join/filter by user)
bookings.property_id       (join/filter by property)
bookings.start_date        (filter by date ranges)
properties.host_id         (join/filter by host)
properties.location        (search optimization)
-- ==============================================================


-- ==============================================================
-- 3.2 Create Indexes
-- ==============================================================

-- Index on users.email for fast lookup (unique)
CREATE UNIQUE INDEX idx_users_email
ON users (email);

-- Index on bookings.user_id for frequent joins
CREATE INDEX idx_bookings_user_id
ON bookings (user_id);

-- Index on bookings.property_id for joins
CREATE INDEX idx_bookings_property_id
ON bookings (property_id);

-- Index on bookings.start_date for date-based queries
CREATE INDEX idx_bookings_start_date
ON bookings (start_date);

-- Index on properties.host_id for host-related lookups
CREATE INDEX idx_properties_host_id
ON properties (host_id);

-- Index on properties.location for search performance
CREATE INDEX idx_properties_location
ON properties (location);


-- ==============================================================
-- 3.3 Verify Indexes
-- ==============================================================

-- List all indexes for verification
SHOW INDEX FROM users;
SHOW INDEX FROM bookings;
SHOW INDEX FROM properties;


-- ==============================================================
-- 3.4 Performance Comparison Example
-- ==============================================================

-- Before adding indexes, run:
EXPLAIN SELECT * FROM bookings WHERE user_id = 5;

-- After adding indexes, run again:
EXPLAIN SELECT * FROM bookings WHERE user_id = 5;

-- Compare key usage, rows examined, and execution time.


-- ====================================================================
-- END OF FILE
-- ====================================================================
