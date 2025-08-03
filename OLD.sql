-- Create the database if it doesn't exist and switch to it
CREATE DATABASE IF NOT EXISTS `airbnb_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `airbnb_db`;

-- Disable foreign key checks to allow dropping tables in any order
SET FOREIGN_KEY_CHECKS = 0;

-- Drop all tables if they exist (drop in reverse dependency order)
DROP TABLE IF EXISTS `transaction`;
DROP TABLE IF EXISTS `socialmedialink`;
DROP TABLE IF EXISTS `review`;
DROP TABLE IF EXISTS `rating`;
DROP TABLE IF EXISTS `propertypreference`;
DROP TABLE IF EXISTS `payment`;
DROP TABLE IF EXISTS `neighborhood`;
DROP TABLE IF EXISTS `message`;
DROP TABLE IF EXISTS `listingimage`;
DROP TABLE IF EXISTS `insurancepolicy`;
DROP TABLE IF EXISTS `incomecalculator`;
DROP TABLE IF EXISTS `booking`;
DROP TABLE IF EXISTS `calendar`;
DROP TABLE IF EXISTS `commission`;
DROP TABLE IF EXISTS `discount`;
DROP TABLE IF EXISTS `availability`;
DROP TABLE IF EXISTS `accommodationamenities`;
DROP TABLE IF EXISTS `accommodation_houserules`;
DROP TABLE IF EXISTS `accommodation`;
DROP TABLE IF EXISTS `guestprofile`;
DROP TABLE IF EXISTS `hostprofile`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `location`;
DROP TABLE IF EXISTS `amenities`;
DROP TABLE IF EXISTS `houserules`;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- ======================================================================
-- Create tables in dependency order
-- ======================================================================

-- 1. location (no dependencies)
CREATE TABLE `location` (
  `LocationID` INT NOT NULL AUTO_INCREMENT,
  `City` VARCHAR(100) NOT NULL,
  `Country` VARCHAR(100) NOT NULL,
  `PostalCode` VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 2. user (depends on location; self-reference allowed for referrals)
CREATE TABLE `user` (
  `UserID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `PhoneNumber` VARCHAR(15) NOT NULL,
  `ReferredByUserID` INT DEFAULT NULL,
  `LocationID` INT NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE INDEX `Email` (`Email` ASC),
  UNIQUE INDEX `PhoneNumber` (`PhoneNumber` ASC),
  INDEX `ReferredByUserID` (`ReferredByUserID` ASC),
  INDEX `LocationID` (`LocationID` ASC),
  CONSTRAINT `user_ibfk_1`
    FOREIGN KEY (`ReferredByUserID`) REFERENCES `user` (`UserID`) ON DELETE SET NULL,
  CONSTRAINT `user_ibfk_2`
    FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 3. amenities (independent)
CREATE TABLE `amenities` (
  `AmenityID` INT NOT NULL AUTO_INCREMENT,
  `AmenityName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`AmenityID`),
  UNIQUE INDEX `AmenityName` (`AmenityName` ASC)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 4. houserules (independent)
CREATE TABLE `houserules` (
  `RuleID` INT NOT NULL AUTO_INCREMENT,
  `RuleDescription` TEXT NOT NULL,
  PRIMARY KEY (`RuleID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 5. guestprofile (depends on user)
CREATE TABLE `guestprofile` (
  `GuestID` INT NOT NULL,
  `UserID` INT NOT NULL,
  `Preferences` TEXT DEFAULT NULL,
  PRIMARY KEY (`GuestID`),
  UNIQUE INDEX `UserID` (`UserID` ASC),
  CONSTRAINT `guestprofile_ibfk_1`
    FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 6. hostprofile (depends on user)
CREATE TABLE `hostprofile` (
  `HostID` INT NOT NULL,
  `UserID` INT NOT NULL,
  `Rating` DECIMAL(3,2) DEFAULT NULL,
  `VerificationStatus` ENUM('Verified', 'Pending', 'Unverified') DEFAULT 'Pending',
  PRIMARY KEY (`HostID`),
  UNIQUE INDEX `UserID` (`UserID` ASC),
  CONSTRAINT `hostprofile_ibfk_1`
    FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 7. accommodation (depends on hostprofile, location and self for parent accommodations)
CREATE TABLE `accommodation` (
  `AccommodationID` INT NOT NULL AUTO_INCREMENT,
  `HostID` INT DEFAULT NULL,
  `LocationID` INT DEFAULT NULL,
  `Description` TEXT NOT NULL,
  `PricePerNight` DECIMAL(10,2) NOT NULL,
  `ParentAccommodationID` INT DEFAULT NULL,
  PRIMARY KEY (`AccommodationID`),
  INDEX `ParentAccommodationID` (`ParentAccommodationID` ASC),
  INDEX `accommodation_ibfk_1` (`HostID` ASC),
  INDEX `accommodation_ibfk_2` (`LocationID` ASC),
  CONSTRAINT `accommodation_ibfk_1`
    FOREIGN KEY (`HostID`) REFERENCES `hostprofile` (`HostID`) ON DELETE RESTRICT,
  CONSTRAINT `accommodation_ibfk_2`
    FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`) ON DELETE SET NULL,
  CONSTRAINT `accommodation_ibfk_3`
    FOREIGN KEY (`ParentAccommodationID`) REFERENCES `accommodation` (`AccommodationID`) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 8. accommodation_houserules (junction table: depends on accommodation and houserules)
CREATE TABLE `accommodation_houserules` (
  `AccommodationID` INT NOT NULL,
  `RuleID` INT NOT NULL,
  PRIMARY KEY (`AccommodationID`, `RuleID`),
  INDEX `RuleID` (`RuleID` ASC),
  CONSTRAINT `accommodation_houserules_ibfk_1`
    FOREIGN KEY (`AccommodationID`) REFERENCES `accommodation` (`AccommodationID`),
  CONSTRAINT `accommodation_houserules_ibfk_2`
    FOREIGN KEY (`RuleID`) REFERENCES `houserules` (`RuleID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 9. accommodationamenities (junction table: depends on accommodation and amenities)
CREATE TABLE `accommodationamenities` (
  `AccommodationID` INT NOT NULL,
  `AmenityID` INT NOT NULL,
  PRIMARY KEY (`AccommodationID`, `AmenityID`),
  INDEX `accommodationamenities_ibfk_2` (`AmenityID` ASC),
  CONSTRAINT `accommodationamenities_ibfk_1`
    FOREIGN KEY (`AccommodationID`) REFERENCES `accommodation` (`AccommodationID`),
  CONSTRAINT `accommodationamenities_ibfk_2`
    FOREIGN KEY (`AmenityID`) REFERENCES `amenities` (`AmenityID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 10. availability (depends on accommodation)
CREATE TABLE `availability` (
  `AvailabilityID` INT NOT NULL AUTO_INCREMENT,
  `AccommodationID` INT NOT NULL,
  `AvailableDate` DATE NOT NULL,
  `IsAvailable` TINYINT(1) NOT NULL,
  PRIMARY KEY (`AvailabilityID`),
  INDEX `availability_ibfk_1` (`AccommodationID` ASC),
  CONSTRAINT `availability_ibfk_1`
    FOREIGN KEY (`AccommodationID`) REFERENCES `accommodation` (`AccommodationID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 11. booking (depends on guestprofile, accommodation and user)
CREATE TABLE `booking` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `GuestID` INT DEFAULT NULL,
  `AccommodationID` INT DEFAULT NULL,
  `BookedByUserID` INT DEFAULT NULL,
  `BookingDate` DATE NOT NULL,
  `CheckInDate` DATE NOT NULL,
  `CheckOutDate` DATE NOT NULL,
  `TotalCost` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `AccommodationID` (`AccommodationID` ASC),
  INDEX `GuestID` (`GuestID` ASC),
  INDEX `BookedByUserID` (`BookedByUserID` ASC),
  CONSTRAINT `booking_ibfk_1`
    FOREIGN KEY (`GuestID`) REFERENCES `guestprofile` (`GuestID`) ON DELETE SET NULL,
  CONSTRAINT `booking_ibfk_2`
    FOREIGN KEY (`AccommodationID`) REFERENCES `accommodation` (`AccommodationID`) ON DELETE SET NULL,
  CONSTRAINT `booking_ibfk_3`
    FOREIGN KEY (`BookedByUserID`) REFERENCES `user` (`UserID`) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 12. calendar (depends on accommodation)
CREATE TABLE `calendar` (
  `CalendarID` INT NOT NULL AUTO_INCREMENT,
  `AccommodationID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `BookingStatus` ENUM('Available', 'Booked', 'Unavailable') NOT NULL,
  PRIMARY KEY (`CalendarID`),
  INDEX `calendar_ibfk_1` (`AccommodationID` ASC),
  CONSTRAINT `calendar_ibfk_1`
    FOREIGN KEY (`AccommodationID`) REFERENCES `accommodation` (`AccommodationID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 13. commission (depends on booking)
CREATE TABLE `commission` (
  `CommissionID` INT NOT NULL AUTO_INCREMENT,
  `BookingID` INT NOT NULL,
  `PlatformFee` DECIMAL(10,2) NOT NULL,
  `HostFee` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`CommissionID`),
  INDEX `BookingID` (`BookingID` ASC),
  CONSTRAINT `commission_ibfk_1`
    FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 14. discount (depends on accommodation)
CREATE TABLE `discount` (
  `DiscountID` INT NOT NULL AUTO_INCREMENT,
  `AccommodationID` INT DEFAULT NULL,
  `DiscountPercentage` DECIMAL(5,2) NOT NULL,
  `StartDate` DATE NOT NULL,
  `EndDate` DATE NOT NULL,
  PRIMARY KEY (`DiscountID`),
  INDEX `AccommodationID` (`AccommodationID` ASC),
  CONSTRAINT `discount_ibfk_1`
    FOREIGN KEY (`AccommodationID`) REFERENCES `accommodation` (`AccommodationID`) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 15. incomecalculator (depends on hostprofile)
CREATE TABLE `incomecalculator` (
  `CalculatorID` INT NOT NULL AUTO_INCREMENT,
  `HostID` INT DEFAULT NULL,
  `EstimatedIncome` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`CalculatorID`),
  INDEX `incomecalculator_ibfk_1` (`HostID` ASC),
  CONSTRAINT `incomecalculator_ibfk_1`
    FOREIGN KEY (`HostID`) REFERENCES `hostprofile` (`HostID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 16. insurancepolicy (depends on accommodation)
CREATE TABLE `insurancepolicy` (
  `PolicyID` INT NOT NULL AUTO_INCREMENT,
  `AccommodationID` INT DEFAULT NULL,
  `CoverageAmount` DECIMAL(10,2) NOT NULL,
  `Premium` DECIMAL(10,2) NOT NULL,
  `ProviderName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`PolicyID`),
  INDEX `AccommodationID` (`AccommodationID` ASC),
  CONSTRAINT `insurancepolicy_ibfk_1`
    FOREIGN KEY (`AccommodationID`) REFERENCES `accommodation` (`AccommodationID`) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 17. listingimage (depends on accommodation)
CREATE TABLE `listingimage` (
  `ImageID` INT NOT NULL AUTO_INCREMENT,
  `AccommodationID` INT NOT NULL,
  `ImagePath` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ImageID`),
  INDEX `listingimage_ibfk_1` (`AccommodationID` ASC),
  CONSTRAINT `listingimage_ibfk_1`
    FOREIGN KEY (`AccommodationID`) REFERENCES `accommodation` (`AccommodationID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 18. message (depends on user)
CREATE TABLE `message` (
  `MessageID` INT NOT NULL AUTO_INCREMENT,
  `SenderUserID` INT NOT NULL,
  `ReceiverUserID` INT NOT NULL,
  `MessageContent` TEXT NOT NULL,
  `Timestamp` DATETIME NOT NULL,
  PRIMARY KEY (`MessageID`),
  INDEX `message_ibfk_1` (`SenderUserID` ASC),
  INDEX `message_ibfk_2` (`ReceiverUserID` ASC),
  CONSTRAINT `message_ibfk_1`
    FOREIGN KEY (`SenderUserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `message_ibfk_2`
    FOREIGN KEY (`ReceiverUserID`) REFERENCES `user` (`UserID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 19. neighborhood (depends on location)
CREATE TABLE `neighborhood` (
  `NeighborhoodID` INT NOT NULL AUTO_INCREMENT,
  `LocationID` INT NOT NULL,
  `Description` TEXT NOT NULL,
  PRIMARY KEY (`NeighborhoodID`),
  INDEX `LocationID` (`LocationID` ASC),
  CONSTRAINT `neighborhood_ibfk_1`
    FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 20. payment (depends on booking and user)
CREATE TABLE `payment` (
  `PaymentID` INT NOT NULL AUTO_INCREMENT,
  `BookingID` INT NOT NULL,
  `PaidByUserID` INT NOT NULL,
  `Amount` DECIMAL(10,2) NOT NULL,
  `Status` ENUM('Pending', 'Completed', 'Failed') NOT NULL,
  `PaymentDate` DATE NOT NULL,
  PRIMARY KEY (`PaymentID`),
  INDEX `BookingID` (`BookingID` ASC),
  INDEX `PaidByUserID` (`PaidByUserID` ASC),
  CONSTRAINT `payment_ibfk_1`
    FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`),
  CONSTRAINT `payment_ibfk_2`
    FOREIGN KEY (`PaidByUserID`) REFERENCES `user` (`UserID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 21. propertypreference (depends on user)
CREATE TABLE `propertypreference` (
  `PreferenceID` INT NOT NULL AUTO_INCREMENT,
  `UserID` INT NOT NULL,
  `PreferenceType` VARCHAR(50) NOT NULL,
  `PreferenceValue` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`PreferenceID`),
  INDEX `propertypreference_ibfk_1` (`UserID` ASC),
  CONSTRAINT `propertypreference_ibfk_1`
    FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 22. rating (depends on accommodation)
CREATE TABLE `rating` (
  `RatingID` INT NOT NULL AUTO_INCREMENT,
  `AccommodationID` INT NOT NULL,
  `Score` INT NOT NULL,
  PRIMARY KEY (`RatingID`),
  INDEX `AccommodationID` (`AccommodationID` ASC),
  CONSTRAINT `rating_ibfk_1`
    FOREIGN KEY (`AccommodationID`) REFERENCES `accommodation` (`AccommodationID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 23. review (depends on accommodation and user)
CREATE TABLE `review` (
  `ReviewID` INT NOT NULL AUTO_INCREMENT,
  `AccommodationID` INT DEFAULT NULL,
  `UserID` INT NOT NULL,
  `Rating` INT NOT NULL,
  `Comment` TEXT DEFAULT NULL,
  `Date` DATE NOT NULL,
  PRIMARY KEY (`ReviewID`),
  INDEX `AccommodationID` (`AccommodationID` ASC),
  INDEX `review_ibfk_2` (`UserID` ASC),
  CONSTRAINT `review_ibfk_1`
    FOREIGN KEY (`AccommodationID`) REFERENCES `accommodation` (`AccommodationID`) ON DELETE SET NULL,
  CONSTRAINT `review_ibfk_2`
    FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 24. socialmedialink (depends on user)
CREATE TABLE `socialmedialink` (
  `LinkID` INT NOT NULL AUTO_INCREMENT,
  `UserID` INT NOT NULL,
  `PlatformName` VARCHAR(50) NOT NULL,
  `ProfileLink` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`LinkID`),
  INDEX `socialmedialink_ibfk_1` (`UserID` ASC),
  CONSTRAINT `socialmedialink_ibfk_1`
    FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 25. transaction (depends on payment)
CREATE TABLE `transaction` (
  `TransactionID` INT NOT NULL AUTO_INCREMENT,
  `PaymentID` INT DEFAULT NULL,
  `TransactionDate` DATE NOT NULL,
  `TransactionAmount` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`TransactionID`),
  INDEX `PaymentID` (`PaymentID` ASC),
  CONSTRAINT `transaction_ibfk_1`
    FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 26. admin (depends on user)
CREATE TABLE `admin` (
  `AdminID` INT NOT NULL,
  `UserID` INT NOT NULL,
  `RoleDescription` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`AdminID`),
  UNIQUE INDEX `UserID` (`UserID` ASC),
  CONSTRAINT `admin_ibfk_1`
    FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
