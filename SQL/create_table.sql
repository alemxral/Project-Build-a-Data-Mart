-- Create the database if it doesn't exist and switch to it
CREATE DATABASE IF NOT EXISTS `airbnb`
  /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `airbnb`;

-- Disable foreign key checks for drops and creates
SET FOREIGN_KEY_CHECKS = 0;

-- Drop existing tables (in any order)
DROP TABLE IF EXISTS referral_rewards;
DROP TABLE IF EXISTS dispute_resolution;
DROP TABLE IF EXISTS referral_programs;
DROP TABLE IF EXISTS user_activity_logs;
DROP TABLE IF EXISTS support_tickets;
DROP TABLE IF EXISTS cancellation_policies;
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS pricing_history;
DROP TABLE IF EXISTS calendar_availability;
DROP TABLE IF EXISTS listing_amenities;
DROP TABLE IF EXISTS amenities;
DROP TABLE IF EXISTS property_rules;
DROP TABLE IF EXISTS property_images;
DROP TABLE IF EXISTS host_reviews;
DROP TABLE IF EXISTS property_reviews;
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS property_listings;
DROP TABLE IF EXISTS admin_users;
DROP TABLE IF EXISTS guests;
DROP TABLE IF EXISTS hosts;
DROP TABLE IF EXISTS user_profiles;

-- Create tables in dependency order

-- 1. user_profiles
CREATE TABLE user_profiles (
    user_id     INT           PRIMARY KEY,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    email       VARCHAR(100)  UNIQUE,
    phone       VARCHAR(20),
    created_at  DATETIME,
    user_role   VARCHAR(20)   DEFAULT 'guest'
);

-- 2. hosts
CREATE TABLE hosts (
    host_id             INT  PRIMARY KEY,
    user_id             INT,
    host_rating         DECIMAL(5,2),
    verification_status BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES user_profiles(user_id)
);

-- 3. guests
CREATE TABLE guests (
    guest_id INT PRIMARY KEY,
    user_id  INT,
    FOREIGN KEY (user_id) REFERENCES user_profiles(user_id)
);

-- 4. admin_users
CREATE TABLE admin_users (
    admin_id     INT PRIMARY KEY,
    user_id      INT,
    admin_level  INT,
    privileges   TEXT,
    reports_to   INT,
    FOREIGN KEY (user_id)    REFERENCES user_profiles(user_id),
    FOREIGN KEY (reports_to) REFERENCES admin_users(admin_id)
);

-- 5. property_listings
CREATE TABLE property_listings (
    property_id  INT PRIMARY KEY,
    host_id      INT,
    title        VARCHAR(150),
    description  TEXT,
    property_type VARCHAR(50),
    room_type    VARCHAR(50),
    address      VARCHAR(255),
    city         VARCHAR(50),
    state        VARCHAR(50),
    country      VARCHAR(50),
    zipcode      VARCHAR(10),
    created_at   DATETIME,
    FOREIGN KEY (host_id) REFERENCES hosts(host_id)
);

-- 6. reservations
CREATE TABLE reservations (
    reservation_id INT PRIMARY KEY,
    property_id    INT,
    guest_id       INT,
    check_in       DATE,
    check_out      DATE,
    status         VARCHAR(20),
    booked_at      DATETIME,
    FOREIGN KEY (property_id) REFERENCES property_listings(property_id),
    FOREIGN KEY (guest_id)    REFERENCES guests(guest_id)
);

-- 7. property_reviews
CREATE TABLE property_reviews (
    review_id   INT PRIMARY KEY,
    property_id INT,
    guest_id    INT,
    rating      INT CHECK (rating BETWEEN 1 AND 5),
    comment     TEXT,
    review_date DATE,
    FOREIGN KEY (property_id) REFERENCES property_listings(property_id),
    FOREIGN KEY (guest_id)    REFERENCES guests(guest_id)
);

-- 8. host_reviews
CREATE TABLE host_reviews (
    review_id   INT PRIMARY KEY,
    host_id     INT,
    guest_id    INT,
    rating      INT CHECK (rating BETWEEN 1 AND 5),
    comment     TEXT,
    review_date DATE,
    FOREIGN KEY (host_id) REFERENCES hosts(host_id),
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id)
);

-- 9. property_images
CREATE TABLE property_images (
    image_id    INT PRIMARY KEY,
    property_id INT,
    image_url   VARCHAR(255),
    caption     VARCHAR(150),
    uploaded_at DATETIME,
    FOREIGN KEY (property_id) REFERENCES property_listings(property_id)
);

-- 10. amenities
CREATE TABLE amenities (
    amenity_id   INT PRIMARY KEY,
    amenity_name VARCHAR(50) UNIQUE,
    description  TEXT
);

-- 11. listing_amenities
CREATE TABLE listing_amenities (
    property_id INT,
    amenity_id  INT,
    PRIMARY KEY (property_id, amenity_id),
    FOREIGN KEY (property_id) REFERENCES property_listings(property_id),
    FOREIGN KEY (amenity_id)  REFERENCES amenities(amenity_id)
);

-- 12. calendar_availability
CREATE TABLE calendar_availability (
    property_id    INT,
    available_date DATE,
    is_available   BOOLEAN,
    price          DECIMAL(8,2),
    PRIMARY KEY (property_id, available_date),
    FOREIGN KEY (property_id) REFERENCES property_listings(property_id)
);

-- 13. pricing_history
CREATE TABLE pricing_history (
    pricing_id  INT PRIMARY KEY,
    property_id INT,
    price       DECIMAL(8,2),
    start_date  DATE,
    end_date    DATE,
    FOREIGN KEY (property_id) REFERENCES property_listings(property_id)
);

-- 14. transactions
CREATE TABLE transactions (
    transaction_id   INT PRIMARY KEY,
    reservation_id   INT,
    transaction_date DATETIME,
    amount           DECIMAL(10,2),
    payment_method   VARCHAR(50),
    status           VARCHAR(20),
    FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id)
);

-- 15. messages
CREATE TABLE messages (
    message_id    INT PRIMARY KEY,
    reservation_id INT,
    sender_id     INT,
    receiver_id   INT,
    content       TEXT,
    sent_at       DATETIME,
    FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id),
    FOREIGN KEY (sender_id)      REFERENCES user_profiles(user_id),
    FOREIGN KEY (receiver_id)    REFERENCES user_profiles(user_id)
);

-- 16. property_rules
CREATE TABLE property_rules (
    rule_id          INT PRIMARY KEY,
    property_id      INT,
    rule_description TEXT,
    FOREIGN KEY (property_id) REFERENCES property_listings(property_id)
);

-- 17. cancellation_policies
CREATE TABLE cancellation_policies (
    policy_id         INT PRIMARY KEY,
    policy_name       VARCHAR(50),
    description       TEXT,
    refund_percentage DECIMAL(5,2)
);

-- 18. support_tickets
CREATE TABLE support_tickets (
    ticket_id   INT PRIMARY KEY,
    user_id     INT,
    subject     VARCHAR(150),
    description TEXT,
    status      VARCHAR(20),
    created_at  DATETIME,
    resolved_at DATETIME NULL,
    FOREIGN KEY (user_id) REFERENCES user_profiles(user_id)
);

-- 19. user_activity_logs
CREATE TABLE user_activity_logs (
    log_id            INT PRIMARY KEY,
    user_id           INT,
    activity_type     VARCHAR(50),
    activity_timestamp DATETIME,
    description       TEXT,
    FOREIGN KEY (user_id) REFERENCES user_profiles(user_id)
);

-- 20. referral_programs
CREATE TABLE referral_programs (
    referral_id       INT PRIMARY KEY,
    referrer_user_id  INT,
    referred_user_id  INT,
    referral_code     VARCHAR(50),
    created_at        DATETIME,
    status            VARCHAR(20),
    FOREIGN KEY (referrer_user_id) REFERENCES user_profiles(user_id),
    FOREIGN KEY (referred_user_id) REFERENCES user_profiles(user_id)
);

-- 21. dispute_resolution (ternary)
CREATE TABLE dispute_resolution (
    resolution_id     INT PRIMARY KEY,
    ticket_id         INT,
    admin_id          INT,
    reservation_id    INT,
    resolution_date   DATETIME,
    resolution_details TEXT,
    FOREIGN KEY (ticket_id)      REFERENCES support_tickets(ticket_id),
    FOREIGN KEY (admin_id)       REFERENCES admin_users(admin_id),
    FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id)
);

-- 22. referral_rewards (ternary)
CREATE TABLE referral_rewards (
    reward_id      INT PRIMARY KEY,
    referral_id    INT,
    transaction_id INT,
    admin_id       INT,
    reward_amount  DECIMAL(10,2),
    reward_date    DATETIME,
    FOREIGN KEY (referral_id)    REFERENCES referral_programs(referral_id),
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id),
    FOREIGN KEY (admin_id)       REFERENCES admin_users(admin_id)
);

-- Re-enable foreign key checks now that all tables exist
SET FOREIGN_KEY_CHECKS = 1;
