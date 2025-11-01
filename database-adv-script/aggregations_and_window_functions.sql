-- ====================================================================
-- ALX Airbnb Database Module
-- Task 2: Apply Aggregations and Window Functions
-- File: aggregations_and_window_functions.sql
-- ====================================================================
-- Description:
-- This script uses MySQL aggregation and window functions to
-- analyze Airbnb booking and property data.
-- ====================================================================


-- ==============================================================
-- 2.1 Aggregation Query
-- Objective:
-- Find the total number of bookings made by each user.
-- ==============================================================

SELECT
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    COUNT(b.booking_id) AS total_bookings
FROM users AS u
LEFT JOIN bookings AS b
    ON u.user_id = b.user_id
GROUP BY u.user_id, full_name
ORDER BY total_bookings DESC;


-- ==============================================================
-- 2.2 Window Function Query
-- Objective:
-- Rank properties based on the total number of bookings received.
-- ==============================================================

-- Step 1: Count total bookings per property
-- Step 2: Use RANK() to order properties by booking count

SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM properties AS p
LEFT JOIN bookings AS b
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY total_bookings DESC;


-- ==============================================================
-- 2.3 Bonus Example (Optional)
-- Objective:
-- Use ROW_NUMBER() to assign a unique sequence to each property
-- by booking count (no ties).
-- ==============================================================

SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_row_number
FROM properties AS p
LEFT JOIN bookings AS b
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_row_number;


SELECT
  p.property_id, p.name AS property_name,
  COUNT(b.booking_id) AS total_bookings,
  RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM properties AS p
LEFT JOIN bookings AS b
  ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;
ORDER BY booking_rank;

SELECT
  p.property_id, p.name,
  ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_row_number
FROM properties AS p
LEFT JOIN bookings AS b
  ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;



-- ====================================================================
-- END OF FILE
-- ====================================================================