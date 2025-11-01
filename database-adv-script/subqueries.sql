-- ====================================================================
-- ALX Airbnb Database Module
-- Task 1: Practice Subqueries
-- File: subqueries.sql
-- ====================================================================
-- Description:
-- This script demonstrates the use of correlated and non-correlated
-- subqueries in MySQL to retrieve analytical insights from the
-- Airbnb database.
-- ====================================================================


-- ==============================================================
-- 1.1 Non-Correlated Subquery
-- Objective:
-- Find all properties where the average rating is greater than 4.0
-- ==============================================================

SELECT
    p.property_id,
    p.name AS property_name,
    p.location
FROM properties AS p
WHERE p.property_id IN (
    SELECT
        r.property_id
    FROM reviews AS r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
)
ORDER BY p.property_id;


-- ==============================================================
-- 1.2 Correlated Subquery
-- Objective:
-- Find all users who have made more than 3 bookings.
-- Explanation:
-- For each user in the outer query, the subquery counts their bookings.
-- ==============================================================

SELECT
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    (
        SELECT COUNT(b.booking_id)
        FROM bookings AS b
        WHERE b.user_id = u.user_id
    ) AS total_bookings
FROM users AS u
WHERE (
    SELECT COUNT(b.booking_id)
    FROM bookings AS b
    WHERE b.user_id = u.user_id
) > 3
ORDER BY total_bookings DESC;


-- ==============================================================
-- 1.3 Bonus Example (Optional)
-- Objective:
-- Find hosts whose properties have received an average rating above 4.5.
-- ==============================================================

SELECT
    u.user_id AS host_id,
    CONCAT(u.first_name, ' ', u.last_name) AS host_name
FROM users AS u
WHERE u.user_id IN (
    SELECT p.host_id
    FROM properties AS p
    JOIN reviews AS r
        ON p.property_id = r.property_id
    GROUP BY p.host_id
    HAVING AVG(r.rating) > 4.5
)
ORDER BY host_name;

--================================================================
--  2.0  Correlated Subquery — Active Users
-- Objective:
-- Find all users who have made more than 3 bookings.
-- ==============================================================

SELECT
  u.user_id,
  CONCAT(u.first_name, ' ', u.last_name) AS full_name
FROM users AS u
WHERE (
  SELECT COUNT(*)
  FROM bookings AS b
  WHERE b.user_id = u.user_id
) > 3;



-- ====================================================================
-- END OF FILE
-- ====================================================================
