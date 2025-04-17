-- Temporarily disable foreign key checks to ease insertion order issues
SET FOREIGN_KEY_CHECKS = 0;

-- 1. Insert into location (no dependencies)
INSERT INTO location (City, Country, PostalCode) VALUES
('New York', 'USA', '10001'),
('Paris', 'France', '75001'),
('Tokyo', 'Japan', '100-0001');

-- 2. Insert into user
-- Insert users one by one so that self-referencing keys exist when needed.
-- For the self-referencing field ReferredByUserID, ensure the referred user exists.
INSERT INTO user (Name, Email, PhoneNumber, ReferredByUserID, LocationID)
VALUES ('Alice Johnson', 'alice@example.com', '1234567890', NULL, 1);

-- Now that Alice is inserted (assumed UserID=1), we can refer to her:
INSERT INTO user (Name, Email, PhoneNumber, ReferredByUserID, LocationID)
VALUES ('Bob Smith', 'bob@example.com', '2345678901', 1, 2);

-- Use Alice as the referral for the next user.
INSERT INTO user (Name, Email, PhoneNumber, ReferredByUserID, LocationID)
VALUES ('Charlie Davis', 'charlie@example.com', '3456789012', 1, 3);

-- 3. Insert into amenities (each name must be unique)
INSERT INTO amenities (AmenityName) VALUES
('WiFi'),
('Pool'),
('Parking');

-- 4. Insert into houserules
INSERT INTO houserules (RuleDescription) VALUES
('No smoking inside'),
('No pets allowed'),
('Quiet hours after 10 PM');

-- 5. Insert into guestprofile (depends on user)
-- Assuming the user for guest profile already exists.
INSERT INTO guestprofile (GuestID, UserID, Preferences) VALUES
(1, 1, 'Non-smoking, King Bed'),
(2, 2, 'Budget friendly, near public transit');

-- 6. Insert into hostprofile (depends on user)
-- Insert a host profile for an existing user (e.g. Charlie, UserID=3)
INSERT INTO hostprofile (HostID, UserID, Rating, VerificationStatus) VALUES
(1, 3, 4.5, 'Verified');

-- 7. Insert into accommodation (depends on hostprofile & location)
INSERT INTO accommodation (HostID, LocationID, Description, PricePerNight, ParentAccommodationID)
VALUES
(1, 1, 'Spacious apartment in downtown New York', 150.00, NULL),
(1, 2, 'Cozy studio in Paris', 120.00, NULL);

-- 8. Insert into accommodation_houserules (junction table)
-- Link accommodations with house rules (assume AccommodationID values from previous insert)
INSERT INTO accommodation_houserules (AccommodationID, RuleID) VALUES
(1, 1),
(1, 2),
(2, 1);

-- 9. Insert into accommodationamenities (junction table)
-- Link accommodations with amenities (assume AccommodationID values from previous insert)
INSERT INTO accommodationamenities (AccommodationID, AmenityID) VALUES
(1, 1),
(1, 3),
(2, 2);

-- 10. Insert into availability (depends on accommodation)
INSERT INTO availability (AccommodationID, AvailableDate, IsAvailable) VALUES
(1, '2025-02-01', 1),
(1, '2025-02-02', 1),
(2, '2025-02-01', 0);

-- 11. Insert into booking (depends on guestprofile, accommodation, user)
INSERT INTO booking (GuestID, AccommodationID, BookedByUserID, BookingDate, CheckInDate, CheckOutDate, TotalCost)
VALUES (1, 1, 1, '2025-01-25', '2025-02-01', '2025-02-05', 600.00);

-- 12. Insert into calendar (depends on accommodation)
INSERT INTO calendar (AccommodationID, Date, BookingStatus) VALUES
(1, '2025-02-01', 'Booked'),
(1, '2025-02-02', 'Booked');

-- 13. Insert into commission (depends on booking)
INSERT INTO commission (BookingID, PlatformFee, HostFee) VALUES
(1, 50.00, 550.00);

-- 14. Insert into discount (depends on accommodation)
INSERT INTO discount (AccommodationID, DiscountPercentage, StartDate, EndDate) VALUES
(1, 10.00, '2025-02-10', '2025-02-15');

-- 15. Insert into incomecalculator (depends on hostprofile)
INSERT INTO incomecalculator (HostID, EstimatedIncome) VALUES
(1, 2000.00);

-- 16. Insert into insurancepolicy (depends on accommodation)
INSERT INTO insurancepolicy (AccommodationID, CoverageAmount, Premium, ProviderName) VALUES
(1, 500000.00, 150.00, 'SafeStay Insurance');

-- 17. Insert into listingimage (depends on accommodation)
INSERT INTO listingimage (AccommodationID, ImagePath) VALUES
(1, '/images/ny_apartment.jpg'),
(2, '/images/paris_studio.jpg');

-- 18. Insert into message (depends on user)
INSERT INTO message (SenderUserID, ReceiverUserID, MessageContent, Timestamp) VALUES
(1, 2, 'Hello, I have a question about the apartment.', '2025-01-20 10:00:00'),
(2, 1, 'Sure, feel free to ask!', '2025-01-20 10:05:00');

-- 19. Insert into neighborhood (depends on location)
INSERT INTO neighborhood (LocationID, Description) VALUES
(1, 'Downtown area with easy access to transportation'),
(2, 'Historic district with cobblestone streets');

-- 20. Insert into payment (depends on booking, user)
INSERT INTO payment (BookingID, PaidByUserID, Amount, Status, PaymentDate) VALUES
(1, 1, 600.00, 'Completed', '2025-01-25');

-- 21. Insert into propertypreference (depends on user)
INSERT INTO propertypreference (UserID, PreferenceType, PreferenceValue) VALUES
(1, 'RoomType', 'Apartment'),
(2, 'Amenities', 'WiFi, Parking');

-- 22. Insert into rating (depends on accommodation)
INSERT INTO rating (AccommodationID, Score) VALUES
(1, 5),
(2, 4);

-- 23. Insert into review (depends on accommodation and user)
INSERT INTO review (AccommodationID, UserID, Rating, Comment, Date) VALUES
(1, 1, 5, 'Amazing place, highly recommended!', '2025-01-30'),
(2, 2, 4, 'Nice location, but a bit noisy.', '2025-01-31');

-- 24. Insert into socialmedialink (depends on user)
INSERT INTO socialmedialink (UserID, PlatformName, ProfileLink) VALUES
(1, 'Facebook', 'https://facebook.com/alice'),
(2, 'Twitter', 'https://twitter.com/bob');

-- 25. Insert into transaction (depends on payment)
INSERT INTO transaction (PaymentID, TransactionDate, TransactionAmount) VALUES
(1, '2025-01-25', 600.00);

-- 26. Insert into admin (depends on user)
INSERT INTO admin (AdminID, UserID, RoleDescription) VALUES
(1, 1, 'Super Admin');

-- Re-enable foreign key checks now that insertion is complete
SET FOREIGN_KEY_CHECKS = 1;
