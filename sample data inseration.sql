-- Sample Data for User Table
INSERT INTO `airbnb_db`.`user` (Name, Email, PhoneNumber, ReferredByUserID, LocationID) VALUES
('John Doe', 'johndoe@example.com', '1234567890', NULL, 1),
('Jane Smith', 'janesmith@example.com', '0987654321', NULL, 2),
('Alice Johnson', 'alicej@example.com', '2345678901', 1, 3),
('Bob Brown', 'bobbrown@example.com', '3456789012', 2, 4),
('Chris Green', 'chrisgreen@example.com', '4567890123', 1, 5),
('Diana White', 'dianawhite@example.com', '5678901234', NULL, 6),
('Evan Black', 'evanblack@example.com', '6789012345', 3, 7),
('Fiona Gray', 'fionagray@example.com', '7890123456', NULL, 8),
('George Blue', 'georgeblue@example.com', '8901234567', 4, 9),
('Holly Yellow', 'hollyyellow@example.com', '9012345678', NULL, 10),
('Ivy Red', 'ivyred@example.com', '1230987654', 5, 11),
('Jake Violet', 'jakeviolet@example.com', '2345678091', NULL, 12),
('Kelly Orange', 'kellyorange@example.com', '3456780129', 3, 13),
('Liam Pink', 'liampink@example.com', '4567890231', NULL, 14),
('Mona Purple', 'monapurple@example.com', '5678902314', 2, 15),
('Nina Brown', 'ninabrown@example.com', '6789012346', NULL, 16),
('Oscar Gray', 'oscargray@example.com', '7890123459', 1, 17),
('Paul Silver', 'paulsilver@example.com', '8901234561', NULL, 18),
('Quinn Gold', 'quinngold@example.com', '9012345672', 10, 19),
('Rachel Bronze', 'rachelbronze@example.com', '1123456789', 12, 20);

-- Sample Data for HostProfile Table
INSERT INTO `airbnb_db`.`hostprofile` (HostID, UserID, Rating, VerificationStatus) VALUES
(1, 1, 4.5, 'Verified'),
(2, 2, 4.2, 'Pending'),
(3, 3, 4.8, 'Verified'),
(4, 4, 3.9, 'Unverified'),
(5, 5, 4.1, 'Verified'),
(6, 6, 4.3, 'Verified'),
(7, 7, 4.0, 'Pending'),
(8, 8, 4.7, 'Verified'),
(9, 9, 3.5, 'Unverified'),
(10, 10, 4.6, 'Verified'),
(11, 11, 4.2, 'Pending'),
(12, 12, 4.8, 'Verified'),
(13, 13, 3.9, 'Verified'),
(14, 14, 4.3, 'Pending'),
(15, 15, 4.5, 'Unverified'),
(16, 16, 4.1, 'Verified'),
(17, 17, 4.4, 'Verified'),
(18, 18, 4.2, 'Pending'),
(19, 19, 4.9, 'Verified'),
(20, 20, 3.8, 'Unverified');

-- Sample Data for Location Table
INSERT INTO `airbnb_db`.`location` (City, Country, PostalCode) VALUES
('New York', 'USA', '10001'),
('Los Angeles', 'USA', '90001'),
('Chicago', 'USA', '60601'),
('Houston', 'USA', '77001'),
('Phoenix', 'USA', '85001'),
('Philadelphia', 'USA', '19101'),
('San Antonio', 'USA', '78201'),
('San Diego', 'USA', '92101'),
('Dallas', 'USA', '75201'),
('San Jose', 'USA', '95101'),
('Austin', 'USA', '73301'),
('Jacksonville', 'USA', '32099'),
('Fort Worth', 'USA', '76101'),
('Columbus', 'USA', '43085'),
('Charlotte', 'USA', '28201'),
('San Francisco', 'USA', '94101'),
('Indianapolis', 'USA', '46201'),
('Seattle', 'USA', '98101'),
('Denver', 'USA', '80201'),
('Washington', 'USA', '20001');

-- Sample Data for Accommodation Table
INSERT INTO `airbnb_db`.`accommodation` (HostID, LocationID, Description, PricePerNight, ParentAccommodationID) VALUES
(1, 1, 'Cozy studio in the heart of New York', 120.00, NULL),
(2, 2, 'Modern apartment with a sea view in Los Angeles', 150.00, NULL),
(3, 3, 'Spacious loft in downtown Chicago', 130.00, NULL),
(4, 4, 'Luxury villa in Houston', 200.00, NULL),
(5, 5, 'Charming home in Phoenix with a private pool', 140.00, NULL),
(6, 6, 'Historic townhouse in Philadelphia', 110.00, NULL),
(7, 7, 'Riverside apartment in San Antonio', 115.00, NULL),
(8, 8, 'Beachfront condo in San Diego', 175.00, NULL),
(9, 9, 'High-rise apartment in Dallas with city views', 160.00, NULL),
(10, 10, 'Elegant guesthouse in San Jose', 135.00, NULL),
(11, 11, 'Stylish flat in Austin', 125.00, NULL),
(12, 12, 'Quaint bungalow in Jacksonville', 105.00, NULL),
(13, 13, 'Suburban home in Fort Worth', 95.00, NULL),
(14, 14, 'Modern duplex in Columbus', 100.00, NULL),
(15, 15, 'Family-friendly house in Charlotte', 110.00, NULL),
(16, 16, 'Penthouse in San Francisco', 250.00, NULL),
(17, 17, 'Downtown apartment in Indianapolis', 120.00, NULL),
(18, 18, 'Studio in Seattle with mountain views', 130.00, NULL),
(19, 19, 'Eco-friendly cabin in Denver', 145.00, NULL),
(20, 20, 'Classic row house in Washington, D.C.', 155.00, NULL);

-- Sample Data for Amenities Table
INSERT INTO `airbnb_db`.`amenities` (AmenityName) VALUES
('WiFi'),
('Air Conditioning'),
('Heating'),
('TV'),
('Kitchen'),
('Washer'),
('Dryer'),
('Free Parking'),
('Gym'),
('Pool'),
('Hot Tub'),
('Breakfast Included'),
('Pets Allowed'),
('Smoking Allowed'),
('Essentials'),
('Fireplace'),
('Laptop-friendly Workspace'),
('Private Entrance'),
('Beach Access'),
('Hair Dryer');

-- Sample Data for AccommodationAmenities Table
INSERT INTO `airbnb_db`.`accommodationamenities` (AccommodationID, AmenityID) VALUES
(1, 1),  -- Accommodation 1 has WiFi
(1, 2),  -- Accommodation 1 has Air Conditioning
(1, 5),  -- Accommodation 1 has Kitchen
(2, 1),  -- Accommodation 2 has WiFi
(2, 3),  -- Accommodation 2 has Heating
(2, 6),  -- Accommodation 2 has Washer
(3, 4),  -- Accommodation 3 has TV
(3, 5),  -- Accommodation 3 has Kitchen
(3, 7),  -- Accommodation 3 has Dryer
(4, 1),  -- Accommodation 4 has WiFi
(4, 9),  -- Accommodation 4 has Gym
(5, 1),  -- Accommodation 5 has WiFi
(5, 10), -- Accommodation 5 has Pool
(6, 11), -- Accommodation 6 has Hot Tub
(7, 1),  -- Accommodation 7 has WiFi
(7, 13), -- Accommodation 7 allows Pets
(8, 14), -- Accommodation 8 allows Smoking
(9, 1),  -- Accommodation 9 has WiFi
(9, 12), -- Accommodation 9 includes Breakfast
(10, 1); -- Accommodation 10 has WiFi

-- Sample Data for Admin Table
INSERT INTO `airbnb_db`.`admin` (AdminID, UserID, RoleDescription) VALUES
(1, 1, 'System Administrator'),
(2, 2, 'Moderator'),
(3, 3, 'Content Manager'),
(4, 4, 'User Support Specialist'),
(5, 5, 'Security Administrator'),
(6, 6, 'Data Analyst'),
(7, 7, 'Operations Manager'),
(8, 8, 'Quality Assurance'),
(9, 9, 'Marketing Specialist'),
(10, 10, 'Financial Controller'),
(11, 11, 'Product Manager'),
(12, 12, 'Compliance Officer'),
(13, 13, 'Account Manager'),
(14, 14, 'Community Manager'),
(15, 15, 'Technical Support Lead'),
(16, 16, 'Customer Success Manager'),
(17, 17, 'Database Administrator'),
(18, 18, 'Training Coordinator'),
(19, 19, 'User Experience Designer'),
(20, 20, 'Research and Development');

-- Sample Data for Availability Table
INSERT INTO `airbnb_db`.`availability` (AccommodationID, AvailableDate, IsAvailable) VALUES
(1, '2024-12-01', 1),
(1, '2024-12-02', 0),
(2, '2024-12-01', 1),
(2, '2024-12-03', 1),
(3, '2024-12-01', 1),
(3, '2024-12-04', 0),
(4, '2024-12-01', 1),
(4, '2024-12-05', 1),
(5, '2024-12-01', 1),
(5, '2024-12-06', 0),
(6, '2024-12-01', 1),
(6, '2024-12-07', 1),
(7, '2024-12-01', 1),
(7, '2024-12-08', 1),
(8, '2024-12-01', 0),
(8, '2024-12-09', 1),
(9, '2024-12-01', 1),
(9, '2024-12-10', 0),
(10, '2024-12-01', 1),
(10, '2024-12-11', 1),
(11, '2024-12-01', 1),
(11, '2024-12-12', 1),
(12, '2024-12-01', 0),
(12, '2024-12-13', 1);

-- Sample Data for GuestProfile Table
INSERT INTO `airbnb_db`.`guestprofile` (GuestID, UserID, Preferences) VALUES
(1, 21, 'Prefers non-smoking accommodations'),
(2, 22, 'Pet-friendly places only'),
(3, 23, 'Requires kitchen access'),
(4, 24, 'Near public transportation'),
(5, 25, 'Private bathroom required'),
(6, 26, 'High-speed internet essential'),
(7, 27, 'Close to city center'),
(8, 28, 'Near beach'),
(9, 29, 'No stairs'),
(10, 30, 'Wants parking available'),
(11, 31, 'Looking for quiet area'),
(12, 32, 'Nearby hiking trails preferred'),
(13, 33, 'Long-term stay friendly'),
(14, 34, 'Single bed'),
(15, 35, 'Requires workspace'),
(16, 36, 'Pet-free accommodations'),
(17, 37, 'Accessible accommodations only'),
(18, 38, 'Looking for a family-friendly space'),
(19, 39, 'Walking distance to restaurants'),
(20, 40, 'Prefers a balcony or terrace');

-- Sample Data for Booking Table
INSERT INTO `airbnb_db`.`booking` (BookingID, GuestID, AccommodationID, BookedByUserID, BookingDate, CheckInDate, CheckOutDate, TotalCost) VALUES
(1, 1, 1, 1, '2024-11-01', '2024-12-01', '2024-12-05', 600.00),
(2, 2, 2, 2, '2024-11-02', '2024-12-03', '2024-12-07', 750.00),
(3, 3, 3, 3, '2024-11-03', '2024-12-08', '2024-12-12', 520.00),
(4, 4, 4, 4, '2024-11-04', '2024-12-10', '2024-12-15', 1000.00),
(5, 5, 5, 5, '2024-11-05', '2024-12-12', '2024-12-14', 280.00),
(6, 6, 6, 6, '2024-11-06', '2024-12-14', '2024-12-18', 460.00),
(7, 7, 7, 7, '2024-11-07', '2024-12-20', '2024-12-23', 345.00),
(8, 8, 8, 8, '2024-11-08', '2024-12-25', '2024-12-28', 525.00),
(9, 9, 9, 9, '2024-11-09', '2024-12-28', '2024-12-30', 320.00),
(10, 10, 10, 10, '2024-11-10', '2024-12-01', '2024-12-03', 270.00),
(11, 11, 11, 11, '2024-11-11', '2024-12-05', '2024-12-07', 250.00),
(12, 12, 12, 12, '2024-11-12', '2024-12-08', '2024-12-11', 315.00),
(13, 13, 13, 13, '2024-11-13', '2024-12-13', '2024-12-15', 200.00),
(14, 14, 14, 14, '2024-11-14', '2024-12-18', '2024-12-22', 500.00),
(15, 15, 15, 15, '2024-11-15', '2024-12-23', '2024-12-26', 330.00),
(16, 16, 16, 16, '2024-11-16', '2024-12-27', '2024-12-30', 225.00),
(17, 17, 17, 17, '2024-11-17', '2024-12-29', '2024-12-31', 390.00),
(18, 18, 18, 18, '2024-11-18', '2025-01-02', '2025-01-06', 520.00),
(19, 19, 19, 19, '2024-11-19', '2025-01-07', '2025-01-10', 460.00),
(20, 20, 20, 20, '2024-11-20', '2025-01-12', '2025-01-15', 465.00);

-- Sample Data for Calendar Table
INSERT INTO `airbnb_db`.`calendar` (CalendarID, AccommodationID, Date, BookingStatus) VALUES
(1, 1, '2024-12-01', 'Available'),
(2, 1, '2024-12-02', 'Booked'),
(3, 2, '2024-12-01', 'Available'),
(4, 2, '2024-12-03', 'Available'),
(5, 3, '2024-12-01', 'Available'),
(6, 3, '2024-12-04', 'Unavailable'),
(7, 4, '2024-12-01', 'Available'),
(8, 4, '2024-12-05', 'Booked'),
(9, 5, '2024-12-01', 'Available'),
(10, 5, '2024-12-06', 'Unavailable'),
(11, 6, '2024-12-01', 'Available'),
(12, 6, '2024-12-07', 'Booked'),
(13, 7, '2024-12-01', 'Available'),
(14, 7, '2024-12-08', 'Available'),
(15, 8, '2024-12-01', 'Unavailable'),
(16, 8, '2024-12-09', 'Booked'),
(17, 9, '2024-12-01', 'Available'),
(18, 9, '2024-12-10', 'Unavailable'),
(19, 10, '2024-12-01', 'Available'),
(20, 10, '2024-12-11', 'Booked');

-- Sample Data for Commission Table
INSERT INTO `airbnb_db`.`commission` (CommissionID, BookingID, PlatformFee, HostFee) VALUES
(1, 1, 60.00, 540.00),
(2, 2, 75.00, 675.00),
(3, 3, 52.00, 468.00),
(4, 4, 100.00, 900.00),
(5, 5, 28.00, 252.00),
(6, 6, 46.00, 414.00),
(7, 7, 34.50, 310.50),
(8, 8, 52.50, 472.50),
(9, 9, 32.00, 288.00),
(10, 10, 27.00, 243.00),
(11, 11, 25.00, 225.00),
(12, 12, 31.50, 283.50),
(13, 13, 20.00, 180.00),
(14, 14, 50.00, 450.00),
(15, 15, 33.00, 297.00),
(16, 16, 22.50, 202.50),
(17, 17, 39.00, 351.00),
(18, 18, 52.00, 468.00),
(19, 19, 46.00, 414.00),
(20, 20, 46.50, 418.50);

-- Sample Data for Discount Table
INSERT INTO `airbnb_db`.`discount` (DiscountID, AccommodationID, DiscountPercentage, StartDate, EndDate) VALUES
(1, 1, 10.00, '2024-12-01', '2024-12-10'),
(2, 2, 15.00, '2024-12-05', '2024-12-15'),
(3, 3, 5.00, '2024-12-08', '2024-12-12'),
(4, 4, 20.00, '2024-12-10', '2024-12-20'),
(5, 5, 10.00, '2024-12-12', '2024-12-18'),
(6, 6, 25.00, '2024-12-14', '2024-12-22'),
(7, 7, 15.00, '2024-12-16', '2024-12-25'),
(8, 8, 5.00, '2024-12-18', '2024-12-23'),
(9, 9, 10.00, '2024-12-20', '2024-12-28'),
(10, 10, 12.00, '2024-12-22', '2024-12-31'),
(11, 11, 7.00, '2024-12-24', '2025-01-05'),
(12, 12, 15.00, '2024-12-26', '2025-01-10'),
(13, 13, 10.00, '2024-12-28', '2025-01-12'),
(14, 14, 20.00, '2024-12-30', '2025-01-15'),
(15, 15, 8.00, '2025-01-01', '2025-01-10'),
(16, 16, 18.00, '2025-01-05', '2025-01-15'),
(17, 17, 10.00, '2025-01-07', '2025-01-20'),
(18, 18, 12.00, '2025-01-10', '2025-01-25'),
(19, 19, 5.00, '2025-01-12', '2025-01-22'),
(20, 20, 15.00, '2025-01-15', '2025-01-30');

-- Sample Data for IncomeCalculator Table
INSERT INTO `airbnb_db`.`incomecalculator` (CalculatorID, HostID, EstimatedIncome) VALUES
(1, 1, 2000.00),
(2, 2, 2500.00),
(3, 3, 1500.00),
(4, 4, 3000.00),
(5, 5, 1800.00),
(6, 6, 2200.00),
(7, 7, 2700.00),
(8, 8, 2400.00),
(9, 9, 1600.00),
(10, 10, 2900.00),
(11, 11, 3100.00),
(12, 12, 2800.00),
(13, 13, 2300.00),
(14, 14, 2600.00),
(15, 15, 1900.00),
(16, 16, 3200.00),
(17, 17, 2100.00),
(18, 18, 2500.00),
(19, 19, 1700.00),
(20, 20, 3000.00);

-- Sample Data for InsurancePolicy Table
INSERT INTO `airbnb_db`.`insurancepolicy` (PolicyID, AccommodationID, CoverageAmount, Premium, ProviderName) VALUES
(1, 1, 50000.00, 200.00, 'InsureCo'),
(2, 2, 75000.00, 250.00, 'SafeGuard'),
(3, 3, 60000.00, 180.00, 'ProtectPlus'),
(4, 4, 100000.00, 300.00, 'ShieldSure'),
(5, 5, 85000.00, 220.00, 'InsureCo'),
(6, 6, 70000.00, 210.00, 'SafeGuard'),
(7, 7, 90000.00, 275.00, 'ProtectPlus'),
(8, 8, 65000.00, 190.00, 'ShieldSure'),
(9, 9, 80000.00, 240.00, 'InsureCo'),
(10, 10, 55000.00, 200.00, 'SafeGuard'),
(11, 11, 70000.00, 210.00, 'ProtectPlus'),
(12, 12, 75000.00, 250.00, 'ShieldSure'),
(13, 13, 50000.00, 200.00, 'InsureCo'),
(14, 14, 85000.00, 230.00, 'SafeGuard'),
(15, 15, 60000.00, 180.00, 'ProtectPlus'),
(16, 16, 95000.00, 280.00, 'ShieldSure'),
(17, 17, 72000.00, 215.00, 'InsureCo'),
(18, 18, 77000.00, 260.00, 'SafeGuard'),
(19, 19, 58000.00, 190.00, 'ProtectPlus'),
(20, 20, 85000.00, 230.00, 'ShieldSure');

-- Sample Data for ListingImage Table
INSERT INTO `airbnb_db`.`listingimage` (ImageID, AccommodationID, ImagePath) VALUES
(1, 1, '/images/accommodation1_img1.jpg'),
(2, 2, '/images/accommodation2_img1.jpg'),
(3, 3, '/images/accommodation3_img1.jpg'),
(4, 4, '/images/accommodation4_img1.jpg'),
(5, 5, '/images/accommodation5_img1.jpg'),
(6, 6, '/images/accommodation6_img1.jpg'),
(7, 7, '/images/accommodation7_img1.jpg'),
(8, 8, '/images/accommodation8_img1.jpg'),
(9, 9, '/images/accommodation9_img1.jpg'),
(10, 10, '/images/accommodation10_img1.jpg'),
(11, 11, '/images/accommodation11_img1.jpg'),
(12, 12, '/images/accommodation12_img1.jpg'),
(13, 13, '/images/accommodation13_img1.jpg'),
(14, 14, '/images/accommodation14_img1.jpg'),
(15, 15, '/images/accommodation15_img1.jpg'),
(16, 16, '/images/accommodation16_img1.jpg'),
(17, 17, '/images/accommodation17_img1.jpg'),
(18, 18, '/images/accommodation18_img1.jpg'),
(19, 19, '/images/accommodation19_img1.jpg'),
(20, 20, '/images/accommodation20_img1.jpg');

-- Sample Data for Message Table
INSERT INTO `airbnb_db`.`message` (MessageID, SenderUserID, ReceiverUserID, MessageContent, Timestamp) VALUES
(1, 1, 2, 'Hello, I am interested in your listing.', '2024-11-01 10:15:00'),
(2, 2, 1, 'Thank you for your interest! Let me know if you have any questions.', '2024-11-01 10:30:00'),
(3, 3, 4, 'Is the property available on the selected dates?', '2024-11-02 09:00:00'),
(4, 4, 3, 'Yes, it is available.', '2024-11-02 09:15:00'),
(5, 5, 6, 'Can I bring my pet?', '2024-11-03 14:45:00'),
(6, 6, 5, 'Yes, pets are allowed in the property.', '2024-11-03 15:00:00'),
(7, 7, 8, 'Do you have a WiFi connection?', '2024-11-04 16:20:00'),
(8, 8, 7, 'Yes, we offer high-speed WiFi.', '2024-11-04 16:30:00'),
(9, 9, 10, 'Is there free parking on-site?', '2024-11-05 11:10:00'),
(10, 10, 9, 'Yes, free parking is available.', '2024-11-05 11:25:00'),
(11, 11, 12, 'Can I check in early?', '2024-11-06 13:50:00'),
(12, 12, 11, 'Early check-in is possible upon request.', '2024-11-06 14:00:00'),
(13, 13, 14, 'Is the neighborhood safe?', '2024-11-07 18:30:00'),
(14, 14, 13, 'Yes, it is a very safe neighborhood.', '2024-11-07 18:45:00'),
(15, 15, 16, 'Are there restaurants nearby?', '2024-11-08 12:20:00'),
(16, 16, 15, 'Yes, there are several within walking distance.', '2024-11-08 12:35:00'),
(17, 17, 18, 'Can I extend my stay?', '2024-11-09 19:10:00'),
(18, 18, 17, 'Certainly, I will update the booking.', '2024-11-09 19:20:00'),
(19, 19, 20, 'Is there a pool on the property?', '2024-11-10 08:40:00'),
(20, 20, 19, 'Yes, the pool is available for guests.', '2024-11-10 08:55:00');

-- Sample Data for Payment Table
INSERT INTO `airbnb_db`.`payment` (BookingID, PaidByUserID, Amount, Status, PaymentDate) VALUES
(1, 1, 600.00, 'Completed', '2024-11-01'),
(2, 2, 750.00, 'Completed', '2024-11-02'),
(3, 3, 520.00, 'Pending', '2024-11-03'),
(4, 4, 1000.00, 'Completed', '2024-11-04'),
(5, 5, 280.00, 'Completed', '2024-11-05'),
(6, 6, 460.00, 'Completed', '2024-11-06'),
(7, 7, 345.00, 'Failed', '2024-11-07'),
(8, 8, 525.00, 'Completed', '2024-11-08'),
(9, 9, 320.00, 'Pending', '2024-11-09'),
(10, 10, 270.00, 'Completed', '2024-11-10'),
(11, 11, 250.00, 'Completed', '2024-11-11'),
(12, 12, 315.00, 'Completed', '2024-11-12'),
(13, 13, 200.00, 'Pending', '2024-11-13'),
(14, 14, 500.00, 'Completed', '2024-11-14'),
(15, 15, 330.00, 'Completed', '2024-11-15'),
(16, 16, 225.00, 'Completed', '2024-11-16'),
(17, 17, 390.00, 'Pending', '2024-11-17'),
(18, 18, 520.00, 'Completed', '2024-11-18'),
(19, 19, 460.00, 'Failed', '2024-11-19'),
(20, 20, 465.00, 'Completed', '2024-11-20');

-- Sample Data for PropertyPreference Table
INSERT INTO `airbnb_db`.`propertypreference` (PreferenceID, UserID, PreferenceType, PreferenceValue) VALUES
(1, 1, 'Smoking', 'Not Allowed'),
(2, 2, 'Pet-Friendly', 'Yes'),
(3, 3, 'WiFi', 'Required'),
(4, 4, 'Parking', 'Free'),
(5, 5, 'Breakfast', 'Included'),
(6, 6, 'Kitchen', 'Shared'),
(7, 7, 'Laundry', 'Available'),
(8, 8, 'Heating', 'Required'),
(9, 9, 'Air Conditioning', 'Preferred'),
(10, 10, 'Wheelchair Accessible', 'Yes'),
(11, 11, 'Pool', 'Not Required'),
(12, 12, 'Fireplace', 'Preferred'),
(13, 13, 'Workspace', 'Necessary'),
(14, 14, 'Gym', 'Not Important'),
(15, 15, 'Elevator', 'Preferred'),
(16, 16, 'Outdoor Space', 'Required'),
(17, 17, 'Long-term Stays', 'Yes'),
(18, 18, 'Events Allowed', 'No'),
(19, 19, 'Hot Tub', 'Optional'),
(20, 20, 'Child-Friendly', 'Yes');

-- Sample Data for Rating Table
INSERT INTO `airbnb_db`.`rating` (RatingID, AccommodationID, Score) VALUES
(1, 1, 4),
(2, 2, 5),
(3, 3, 3),
(4, 4, 5),
(5, 5, 4),
(6, 6, 4),
(7, 7, 3),
(8, 8, 5),
(9, 9, 2),
(10, 10, 4),
(11, 11, 5),
(12, 12, 3),
(13, 13, 4),
(14, 14, 5),
(15, 15, 3),
(16, 16, 4),
(17, 17, 5),
(18, 18, 2),
(19, 19, 4),
(20, 20, 5);

-- Sample Data for Review Table
INSERT INTO `airbnb_db`.`review` (ReviewID, AccommodationID, UserID, Rating, Comment, Date) VALUES
(1, 1, 1, 4, 'Great place, very cozy!', '2024-11-01'),
(2, 2, 2, 5, 'Amazing view and clean rooms.', '2024-11-02'),
(3, 3, 3, 3, 'Good location but noisy area.', '2024-11-03'),
(4, 4, 4, 5, 'Perfect stay, would recommend!', '2024-11-04'),
(5, 5, 5, 4, 'Nice amenities, comfortable bed.', '2024-11-05'),
(6, 6, 6, 4, 'Good value for money.', '2024-11-06'),
(7, 7, 7, 3, 'Average stay, a bit outdated.', '2024-11-07'),
(8, 8, 8, 5, 'Beautiful property by the beach!', '2024-11-08'),
(9, 9, 9, 2, 'Rooms were small and cramped.', '2024-11-09'),
(10, 10, 10, 4, 'Convenient location, friendly host.', '2024-11-10'),
(11, 11, 11, 5, 'Exceeded expectations, very clean.', '2024-11-11'),
(12, 12, 12, 3, 'Nice area, but a bit pricey.', '2024-11-12'),
(13, 13, 13, 4, 'Comfortable, felt like home.', '2024-11-13'),
(14, 14, 14, 5, 'Would stay again, amazing host!', '2024-11-14'),
(15, 15, 15, 3, 'Basic amenities, nothing special.', '2024-11-15'),
(16, 16, 16, 4, 'Spacious and well-kept.', '2024-11-16'),
(17, 17, 17, 5, 'Fantastic experience overall.', '2024-11-17'),
(18, 18, 18, 2, 'Disappointing, needs improvements.', '2024-11-18'),
(19, 19, 19, 4, 'Lovely decor, enjoyed my stay.', '2024-11-19'),
(20, 20, 20, 5, 'Perfect getaway spot!', '2024-11-20');

-- Sample Data for SocialMediaLink Table
INSERT INTO `airbnb_db`.`socialmedialink` (LinkID, UserID, PlatformName, ProfileLink) VALUES
(1, 1, 'Facebook', 'https://facebook.com/johndoe'),
(2, 2, 'Instagram', 'https://instagram.com/janesmith'),
(3, 3, 'Twitter', 'https://twitter.com/alicejohnson'),
(4, 4, 'LinkedIn', 'https://linkedin.com/in/bobbrown'),
(5, 5, 'Facebook', 'https://facebook.com/chrisgreen'),
(6, 6, 'Instagram', 'https://instagram.com/dianawhite'),
(7, 7, 'Twitter', 'https://twitter.com/evanblack'),
(8, 8, 'LinkedIn', 'https://linkedin.com/in/fionagray'),
(9, 9, 'Facebook', 'https://facebook.com/georgeblue'),
(10, 10, 'Instagram', 'https://instagram.com/hollyyellow'),
(11, 11, 'Twitter', 'https://twitter.com/ivyred'),
(12, 12, 'LinkedIn', 'https://linkedin.com/in/jakeviolet'),
(13, 13, 'Facebook', 'https://facebook.com/kellyorange'),
(14, 14, 'Instagram', 'https://instagram.com/liampink'),
(15, 15, 'Twitter', 'https://twitter.com/monapurple'),
(16, 16, 'LinkedIn', 'https://linkedin.com/in/ninabrown'),
(17, 17, 'Facebook', 'https://facebook.com/oscargray'),
(18, 18, 'Instagram', 'https://instagram.com/paulsilver'),
(19, 19, 'Twitter', 'https://twitter.com/quinngold'),
(20, 20, 'LinkedIn', 'https://linkedin.com/in/rachelbronze');

-- Sample Data for Transaction Table
INSERT INTO `airbnb_db`.`transaction` (TransactionID, PaymentID, TransactionDate, TransactionAmount) VALUES
(1, 1, '2024-11-01', 600.00),
(2, 2, '2024-11-02', 750.00),
(3, 3, '2024-11-03', 520.00),
(4, 4, '2024-11-04', 1000.00),
(5, 5, '2024-11-05', 280.00),
(6, 6, '2024-11-06', 460.00),
(7, 7, '2024-11-07', 345.00),
(8, 8, '2024-11-08', 525.00),
(9, 9, '2024-11-09', 320.00),
(10, 10, '2024-11-10', 270.00),
(11, 11, '2024-11-11', 250.00),
(12, 12, '2024-11-12', 315.00),
(13, 13, '2024-11-13', 200.00),
(14, 14, '2024-11-14', 500.00),
(15, 15, '2024-11-15', 330.00),
(16, 16, '2024-11-16', 225.00),
(17, 17, '2024-11-17', 390.00),
(18, 18, '2024-11-18', 520.00),
(19, 19, '2024-11-19', 460.00),
(20, 20, '2024-11-20', 465.00);

-- Sample Data for HouseRules Table
INSERT INTO `airbnb_db`.`houserules` (RuleDescription) VALUES
('No smoking inside the house.'),
('No pets allowed.'),
('Quiet hours are from 10 PM to 8 AM.'),
('Guests must clean up after themselves.'),
('No parties or events allowed.'),
('Turn off lights and appliances when not in use.'),
('Do not disturb neighbors.'),
('Maximum occupancy is 4 people.'),
('No shoes inside the house.'),
('Pets are allowed with prior approval.'),
('Guests must take out the trash daily.'),
('No loud music after 9 PM.'),
('Do not use appliances for purposes other than intended.'),
('Guests must provide valid ID at check-in.'),
('Do not rearrange furniture.'),
('Swimming pool hours are from 9 AM to 7 PM.'),
('Guests must follow parking guidelines.'),
('Report any damages immediately.'),
('Do not leave windows open when leaving the house.'),
('Do not flush non-biodegradable items down the toilet.');

-- Sample Data for Neighborhood Table
INSERT INTO `airbnb_db`.`neighborhood` (LocationID, Description) VALUES
(1, 'Vibrant area with shopping centers and cafes nearby.'),
(2, 'Quiet suburban area with family-friendly parks.'),
(3, 'Bustling downtown area close to major attractions.'),
(4, 'Residential neighborhood with a mix of modern and historic homes.'),
(5, 'Eco-friendly community with bike paths and green spaces.'),
(6, 'Close to the beach with stunning sea views.'),
(7, 'Mountain-side neighborhood with hiking trails nearby.'),
(8, 'Artistic community with galleries and live music events.'),
(9, 'Industrial area transitioning to a trendy hotspot.'),
(10, 'Luxurious area with high-end shops and restaurants.'),
(11, 'Countryside setting with open fields and fresh air.'),
(12, 'Historic district with cobblestone streets and landmarks.'),
(13, 'Lively student area with pubs and affordable eateries.'),
(14, 'Tech-focused area with modern buildings and coworking spaces.'),
(15, 'Close to the airport with excellent transport connections.'),
(16, 'Peaceful retirement community with quiet streets.'),
(17, 'Close-knit neighborhood with frequent community events.'),
(18, 'Riverfront area with scenic walking paths.'),
(19, 'Tourist hub with easy access to museums and theaters.'),
(20, 'Lakeside neighborhood with water sports and fishing opportunities.');

-- Sample Data for AccommodationHouseRules Table
INSERT INTO `airbnb_db`.`accommodation_houserules` (AccommodationID, RuleID) VALUES
(1, 1),    -- Cozy studio in New York: No smoking inside the house
(2, 2),    -- Modern apartment in LA: No pets allowed
(3, 3),    -- Spacious loft in Chicago: Quiet hours are from 10 PM to 8 AM
(4, 4),    -- Luxury villa in Houston: Guests must clean up after themselves
(5, 5),    -- Charming home in Phoenix: No parties or events allowed
(6, 6),    -- Historic townhouse in Philadelphia: Turn off lights and appliances when not in use
(7, 7),    -- Riverside apartment in San Antonio: Do not disturb neighbors
(8, 8),    -- Beachfront condo in San Diego: Maximum occupancy is 4 people
(9, 9),    -- High-rise apartment in Dallas: No shoes inside the house
(10, 10),  -- Elegant guesthouse in San Jose: Pets are allowed with prior approval
(11, 11),  -- Stylish flat in Austin: Guests must take out the trash daily
(12, 12),  -- Quaint bungalow in Jacksonville: No loud music after 9 PM
(13, 13),  -- Suburban home in Fort Worth: Do not use appliances for unintended purposes
(14, 14),  -- Modern duplex in Columbus: Guests must provide valid ID at check-in
(15, 15),  -- Family-friendly house in Charlotte: Do not rearrange furniture
(16, 16),  -- Penthouse in San Francisco: Swimming pool hours are from 9 AM to 7 PM
(17, 17),  -- Downtown apartment in Indianapolis: Guests must follow parking guidelines
(18, 18),  -- Studio in Seattle: Report any damages immediately
(19, 19),  -- Eco-friendly cabin in Denver: Do not leave windows open when leaving the house
(20, 20);  -- Classic row house in Washington, D.C.: Do not flush non-biodegradable items down the toilet

