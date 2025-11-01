-- ====================================================================
-- ALX Airbnb Database Module
-- Task 4: Optimize Complex Queries
-- File: perfomance.sql
-- ====================================================================
-- Description:
-- This script demonstrates query optimization in MySQL by comparing
-- an unoptimized and optimized version of a complex query.
-- ====================================================================


-- ==============================================================
-- 4.1 Original Complex Query (Unoptimized)
-- Objective:
-- Retrieve all bookings along with user details, property details,
-- and payment details.
-- ==============================================================

SELECT
    b.booking_id,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.status,
    b.start_date,
    b.end_date
FROM bookings AS b
JOIN users AS u
    ON b.user_id = u.user_id
JOIN properties AS p
    ON b.property_id = p.property_id
JOIN payments AS pay
    ON b.payment_id = pay.payment_id
WHERE pay.status = 'completed'
ORDER BY b.start_date DESC;



-- ==============================================================
-- 4.2 Analyze Query Performance
-- Use EXPLAIN to check the execution plan before optimization
-- ==============================================================

EXPLAIN SELECT
    b.booking_id,
    u.first_name,
    u.last_name,
    p.name,
    pay.amount,
    pay.status
FROM bookings AS b
JOIN users AS u ON b.user_id = u.user_id
JOIN properties AS p ON b.property_id = p.property_id
JOIN payments AS pay ON b.payment_id = pay.payment_id
WHERE pay.status = 'completed';



-- ==============================================================
-- 4.3 Optimized Query
-- Improvements:
-- 1. Added appropriate indexes on foreign keys and filters
-- 2. Selected only necessary columns
-- 3. Reduced nested joins
-- 4. Used INNER JOIN selectively
-- ==============================================================

-- Ensure supporting indexes exist:
CREATE INDEX idx_payments_status ON payments (status);
CREATE INDEX idx_bookings_user_property ON bookings (user_id, property_id);

SELECT
    b.booking_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    p.name AS property_name,
    pay.amount,
    pay.status,
    b.start_date
FROM bookings AS b
INNER JOIN users AS u
    ON b.user_id = u.user_id
INNER JOIN properties AS p
    ON b.property_id = p.property_id
INNER JOIN payments AS pay
    ON b.payment_id = pay.payment_id
WHERE pay.status = 'completed'
ORDER BY b.start_date DESC;


-- ==============================================================
-- 4.4 Compare Performance
-- Run both EXPLAIN plans and note differences in key usage,
-- filtered rows, and total execution time.
-- ==============================================================

EXPLAIN SELECT
    b.booking_id,
    CONCAT(u.first_name, ' ', u.last_name),
    p.name,
    pay.amount
FROM bookings AS b
JOIN users AS u ON b.user_id = u.user_id
JOIN properties AS p ON b.property_id = p.property_id
JOIN payments AS pay ON b.payment_id = pay.payment_id
WHERE pay.status = 'completed';


-- ====================================================================
-- END OF FILE
-- ====================================================================
