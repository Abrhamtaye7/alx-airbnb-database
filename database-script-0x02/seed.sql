-- database-script-0x02/seed.sql

-- WARNING: These UUIDs are fixed for demonstration purposes.
-- In a real application, you should use a function (e.g., gen_random_uuid() or UUID_TO_BIN(UUID()))
-- to generate unique IDs upon insertion.

----------------------------------------------------
-- 1. USER TABLE SEED DATA
----------------------------------------------------

-- Host Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, role) VALUES
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Elara', 'Vance', 'elara.host@example.com', 'hashed_pass_host1', 'host'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Kai', 'Sterling', 'kai.host@example.com', 'hashed_pass_host2', 'host'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Admin', 'Root', 'admin@example.com', 'hashed_pass_admin', 'admin');

-- Guest Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, role) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380b11', 'Lia', 'Chen', 'lia.guest@example.com', 'hashed_pass_guest1', 'guest'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380b12', 'Marcus', 'Hayes', 'marcus.guest@example.com', 'hashed_pass_guest2', 'guest');


----------------------------------------------------
-- 2. PROPERTY TABLE SEED DATA
----------------------------------------------------

-- Property 1: Hosted by Elara Vance
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380c11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Sunset Loft', 'A bright loft overlooking the city.', 'Downtown Metropolis', 150.00);

-- Property 2: Hosted by Kai Sterling
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380c12', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Seaside Cottage', 'Cozy cottage with direct beach access.', 'Coastal Town', 220.50);


----------------------------------------------------
-- 3. BOOKING TABLE SEED DATA
----------------------------------------------------

-- Booking 1: Lia Chen books Sunset Loft (Confirmed, 3 nights)
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380d11', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380c11', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380b11', '2025-12-01', '2025-12-04', 450.00, 'confirmed');

-- Booking 2: Marcus Hayes books Seaside Cottage (Pending, 5 nights)
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380d12', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380c12', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380b12', '2026-01-15', '2026-01-20', 1102.50, 'pending');

-- Booking 3: Lia Chen books Seaside Cottage (Canceled)
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380d13', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380c12', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380b11', '2025-11-01', '2025-11-02', 220.50, 'canceled');


----------------------------------------------------
-- 4. PAYMENT TABLE SEED DATA
----------------------------------------------------

-- Payment for Booking 1 (Confirmed)
INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380e11', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380d11', 450.00, 'credit_card');


----------------------------------------------------
-- 5. REVIEW TABLE SEED DATA
----------------------------------------------------

-- Review 1: Lia Chen reviews Sunset Loft
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380f11', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380c11', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380b11', 5, 'Absolutely stunning views and a perfect location!');

-- Review 2: Marcus Hayes reviews Sunset Loft (different user reviews the same property)
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380f12', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380c11', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380b12', 4, 'Great place, but the check-in process was a bit slow.');


----------------------------------------------------
-- 6. MESSAGE TABLE SEED DATA
----------------------------------------------------

-- Message 1: Lia (Guest) asks Elara (Host) a question about Property 1
INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
('g0eebc99-9c0b-4ef8-bb6d-6bb9bd380g11', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380b11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Hi Elara, is the kitchen fully stocked with cooking supplies?');

-- Message 2: Elara (Host) replies
INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
('g0eebc99-9c0b-4ef8-bb6d-6bb9bd380g12', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380b11', 'Yes, Lia! Everything you need is there.');
