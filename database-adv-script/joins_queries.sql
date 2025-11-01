-- ====================================================================
-- ALX Airbnb Database Module
-- Task 0: Write Complex Queries with Joins
-- File: joins_queries.sql
-- Author: <Your Name>
-- ====================================================================
-- Description:
-- This script demonstrates advanced SQL joins on a simulated Airbnb
-- database using MySQL. It includes INNER JOIN, LEFT JOIN, and a
-- MySQL-compatible FULL OUTER JOIN (via UNION ALL).
-- ====================================================================


-- ==============================================================
-- 0.1 INNER JOIN
-- Objective:
-- Retrieve all bookings and the respective users who made those bookings.
-- ==============================================================

SELECT
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM bookings AS b
INNER JOIN users AS u
    ON b.user_id = u.user_id
ORDER BY b.start_date DESC;



-- ==============================================================
-- 0.2 LEFT JOIN
-- Objective:
-- Retrieve all properties and their reviews, including properties
-- that have no reviews.
-- ==============================================================

SELECT
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.user_id AS reviewer_id,
    r.rating,
    r.comment,
    r.created_at AS review_date
FROM properties AS p
LEFT JOIN reviews AS r
    ON p.property_id = r.property_id
ORDER BY p.property_id, r.created_at DESC;



-- Optional aggregation example: average rating per property (including unrated)
-- Uncomment to test.
-- SELECT
--     p.property_id,
--     p.name AS property_name,
--     COALESCE(AVG(r.rating), 0) AS avg_rating,
--     COUNT(r.review_id) AS total_reviews
-- FROM properties AS p
-- LEFT JOIN reviews AS r
--     ON p.property_id = r.property_id
-- GROUP BY p.property_id, p.name
-- ORDER BY avg_rating DESC;



-- ==============================================================
-- 0.3 FULL OUTER JOIN (MySQL equivalent)
-- Objective:
-- Retrieve all users and all bookings, even if the user has no booking
-- or a booking is not linked to a user.
-- Note:
-- MySQL does not support FULL OUTER JOIN directly.
-- This version uses a UNION ALL of LEFT and RIGHT joins.
-- ==============================================================

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM users AS u
LEFT JOIN bookings AS b
    ON u.user_id = b.user_id

UNION ALL

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM bookings AS b
LEFT JOIN users AS u
    ON u.user_id = b.user_id
WHERE u.user_id IS NULL
ORDER BY COALESCE(u.user_id, b.user_id);

