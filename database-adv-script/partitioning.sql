-- ====================================================================
-- ALX Airbnb Database Module
-- Task 5: Partitioning Large Tables
-- File: partitioning.sql
-- ====================================================================
-- Description:
-- Demonstrates MySQL table partitioning for performance optimization
-- based on the start_date column of the bookings table.
-- ====================================================================


-- ==============================================================
-- 5.1 Check Existing Table Structure
-- ==============================================================

SHOW CREATE TABLE bookings;


-- ==============================================================
-- 5.2 Create a Partitioned Version of Bookings Table
-- Objective:
-- Partition by YEAR(start_date) to improve performance
-- for date-range queries.
-- ==============================================================

-- Step 1: Backup existing table (optional)
CREATE TABLE bookings_backup AS
SELECT * FROM bookings;

-- Step 2: Drop existing bookings table
DROP TABLE IF EXISTS bookings;

-- Step 3: Recreate bookings table with partitions
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2),
    INDEX idx_start_date (start_date),
    INDEX idx_user_id (user_id),
    INDEX idx_property_id (property_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);


-- ==============================================================
-- 5.3 Verify Partitioning
-- ==============================================================

-- View partition info
SELECT
    TABLE_NAME,
    PARTITION_NAME,
    TABLE_ROWS
FROM information_schema.PARTITIONS
WHERE TABLE_NAME = 'bookings';


-- ==============================================================
-- 5.4 Query Performance Test
-- ==============================================================

-- Example: Query by date range before and after partitioning
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';


-- ==============================================================
-- 5.5 Add Future Partition (Example)
-- ==============================================================

ALTER TABLE bookings
ADD PARTITION (
    PARTITION p2025 VALUES LESS THAN (2026)
);


-- ====================================================================
-- END OF FILE
-- ====================================================================
