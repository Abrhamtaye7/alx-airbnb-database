**Entities and Their Attributes:
User

user_id (PK, UUID, Indexed)

first_name (VARCHAR, NOT NULL)

last_name (VARCHAR, NOT NULL)

email (VARCHAR, UNIQUE, NOT NULL, Indexed)

password_hash (VARCHAR, NOT NULL)

phone_number (VARCHAR, NULL)

role (ENUM: guest, host, admin, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

Property

property_id (PK, UUID, Indexed)

host_id (FK, references User(user_id))

name (VARCHAR, NOT NULL)

description (TEXT, NOT NULL)

location (VARCHAR, NOT NULL)

price_per_night (DECIMAL, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

Booking

booking_id (PK, UUID, Indexed)

property_id (FK, references Property(property_id), Indexed)

user_id (FK, references User(user_id))

start_date (DATE, NOT NULL)

end_date (DATE, NOT NULL)

total_price (DECIMAL, NOT NULL)

status (ENUM: pending, confirmed, canceled, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

Payment

payment_id (PK, UUID, Indexed)

booking_id (FK, references Booking(booking_id), Indexed)

amount (DECIMAL, NOT NULL)

payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)

Review

review_id (PK, UUID, Indexed)

property_id (FK, references Property(property_id))

user_id (FK, references User(user_id))

rating (INTEGER, CHECK: 1-5, NOT NULL)

comment (TEXT, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

Message

message_id (PK, UUID, Indexed)

sender_id (FK, references User(user_id))

recipient_id (FK, references User(user_id))

message_body (TEXT, NOT NULL)

sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

Relationships Between Entities:
Here's how the entities relate to each other, including their cardinality:

User to Property (Host Role):

A User can host zero, one, or many Properties.

A Property is hosted by exactly one User.

Relationship: One-to-Many (1:N)

Connection: Property.host_id -> User.user_id

User to Booking (Guest Role):

A User can make zero, one, or many Bookings.

A Booking is made by exactly one User.

Relationship: One-to-Many (1:N)

Connection: Booking.user_id -> User.user_id

Property to Booking:

A Property can have zero, one, or many Bookings.

A Booking is for exactly one Property.

Relationship: One-to-Many (1:N)

Connection: Booking.property_id -> Property.property_id

Booking to Payment:

A Booking can have zero or one Payment. (Assuming one payment per booking for simplicity, though a more complex system might allow multiple payments for a single booking, e.g., partial payments).

A Payment is for exactly one Booking.

Relationship: One-to-One (1:1) or One-to-Zero-or-One (1:0..1)

Connection: Payment.booking_id -> Booking.booking_id

User to Review:

A User can write zero, one, or many Reviews.

A Review is written by exactly one User.

Relationship: One-to-Many (1:N)

Connection: Review.user_id -> User.user_id

Property to Review:

A Property can receive zero, one, or many Reviews.

A Review is about exactly one Property.

Relationship: One-to-Many (1:N)

Connection: Review.property_id -> Property.property_id

User to Message (Sender):

A User can send zero, one, or many Messages.

A Message is sent by exactly one User.

Relationship: One-to-Many (1:N)

Connection: Message.sender_id -> User.user_id

User to Message (Recipient):

A User can receive zero, one, or many Messages.

A Message is received by exactly one User.

Relationship: One-to-Many (1:N)

Connection: Message.recipient_id -> User.user_id**
