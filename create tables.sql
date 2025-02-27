CREATE DATABASE  IF NOT EXISTS `airbnb_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `airbnb_db`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: airbnb_db
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accommodation`
--
-- -----------------------------------------------------
-- Table: Accommodation
-- Purpose: Stores accommodation details, including descriptions, prices, hosts, locations, and hierarchical relationships.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `accommodation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accommodation` (
  `AccommodationID` INT NOT NULL AUTO_INCREMENT,       -- Unique identifier for each accommodation, auto-incremented
  `HostID` INT NULL,                                   -- Foreign key linking to HostProfile, representing the host
  `LocationID` INT NULL,                               -- Foreign key linking to Location, representing the accommodation's location
  `Description` TEXT NOT NULL,                         -- Description of the accommodation
  `PricePerNight` DECIMAL(10,2) NOT NULL,              -- Price per night for the accommodation
  `ParentAccommodationID` INT(11) NULL DEFAULT NULL,   -- Optional self-reference for hierarchical accommodations
  PRIMARY KEY (`AccommodationID`),                     -- Sets AccommodationID as the primary key
  INDEX `ParentAccommodationID` (`ParentAccommodationID` ASC) VISIBLE, -- Index for self-referencing parent accommodation
  INDEX `accommodation_ibfk_1` (`HostID` ASC) VISIBLE,               -- Index for HostID foreign key
  INDEX `accommodation_ibfk_2` (`LocationID` ASC) VISIBLE,           -- Index for LocationID foreign key
  CONSTRAINT `accommodation_ibfk_1`                                  -- Defines the foreign key constraint for HostID
    FOREIGN KEY (`HostID`)
    REFERENCES `airbnb_db`.`hostprofile` (`HostID`)
    ON DELETE RESTRICT                                     -- Prevents deletion of host if accommodation exists
    ON UPDATE CASCADE,                                     -- Updates HostID in accommodations if it changes in HostProfile
  CONSTRAINT `accommodation_ibfk_2`                        -- Defines the foreign key constraint for LocationID
    FOREIGN KEY (`LocationID`)
    REFERENCES `airbnb_db`.`location` (`LocationID`)
    ON DELETE SET NULL                                     -- Sets LocationID to NULL if location is deleted
    ON UPDATE CASCADE,                                     -- Updates LocationID in accommodations if it changes in Location
  CONSTRAINT `accommodation_ibfk_3`                        -- Defines the foreign key constraint for ParentAccommodationID
    FOREIGN KEY (`ParentAccommodationID`)
    REFERENCES `airbnb_db`.`accommodation` (`AccommodationID`)
    ON DELETE SET NULL                                     -- Sets ParentAccommodationID to NULL if parent is deleted
    ON UPDATE CASCADE                                      -- Updates ParentAccommodationID if it changes in the parent accommodation
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accommodation_houserules`
--
-- -----------------------------------------------------
-- Table: AccommodationHouseRules
-- Purpose: Junction table linking accommodations with their house rules.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `accommodation_houserules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accommodation_houserules` (
  `AccommodationID` INT NOT NULL,                -- Foreign key linking to the Accommodation table
  `RuleID` INT NOT NULL,                         -- Foreign key linking to the HouseRules table
  PRIMARY KEY (`AccommodationID`, `RuleID`),     -- Composite primary key
  INDEX `RuleID` (`RuleID` ASC) VISIBLE,        -- Index for foreign key
  CONSTRAINT `accommodation_houserules_ibfk_1`   -- Defines the foreign key constraint for AccommodationID
    FOREIGN KEY (`AccommodationID`)
    REFERENCES `airbnb_db`.`accommodation` (`AccommodationID`)
    ON DELETE CASCADE                            -- Deletes rules if the accommodation is deleted
    ON UPDATE CASCADE,                           -- Updates rules if the accommodation ID changes
  CONSTRAINT `accommodation_houserules_ibfk_2`   -- Defines the foreign key constraint for RuleID
    FOREIGN KEY (`RuleID`)
    REFERENCES `airbnb_db`.`houserules` (`RuleID`)
    ON DELETE CASCADE                            -- Deletes rules if the rule is deleted
    ON UPDATE CASCADE                            -- Updates rules if the rule ID changes
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accommodationamenities`
--
-- -----------------------------------------------------
-- Table: AccommodationAmenities
-- Purpose: Links accommodations with their available amenities.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `accommodationamenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accommodationamenities` (
  `AccommodationID` INT NOT NULL,                  -- Foreign key linking to Accommodation, representing the accommodation
  `AmenityID` INT NOT NULL,                        -- Foreign key linking to Amenities, representing the amenity
  PRIMARY KEY (`AccommodationID`, `AmenityID`),    -- Composite primary key combining AccommodationID and AmenityID
  INDEX `accommodationamenities_ibfk_2` (`AmenityID` ASC) VISIBLE,
  CONSTRAINT `accommodationamenities_ibfk_1`       -- Defines the foreign key constraint for AccommodationID
    FOREIGN KEY (`AccommodationID`)
    REFERENCES `airbnb_db`.`accommodation` (`AccommodationID`)
    ON DELETE CASCADE                                -- Deletes entries if the related accommodation is deleted
    ON UPDATE CASCADE,                               -- Updates entries if the related accommodation ID changes
  CONSTRAINT `accommodationamenities_ibfk_2`         -- Defines the foreign key constraint for AmenityID
    FOREIGN KEY (`AmenityID`)
    REFERENCES `airbnb_db`.`amenities` (`AmenityID`)
    ON DELETE CASCADE                                -- Deletes entries if the related amenity is deleted
    ON UPDATE CASCADE                                -- Updates entries if the related amenity ID changes
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin`
--
-- -----------------------------------------------------
-- Table: Admin
-- Purpose: Stores administrative roles and related information for users with admin privileges.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `AdminID` int NOT NULL,
  `UserID` int NOT NULL,
  `RoleDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AdminID`),
  UNIQUE KEY `UserID` (`UserID`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `amenities`
--
-- -----------------------------------------------------
-- Table: Amenities
-- Purpose: Stores available amenities for accommodations (e.g., WiFi, parking).
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `AmenityID` INT NOT NULL AUTO_INCREMENT,             -- Unique identifier for each amenity, auto-incremented
  `AmenityName` VARCHAR(50) NOT NULL,                  -- Name of the amenity (e.g., WiFi, Pool, Parking)
  PRIMARY KEY (`AmenityID`),                           -- Sets AmenityID as the primary key
  UNIQUE INDEX `AmenityName` (`AmenityName` ASC) VISIBLE -- Ensures each amenity name is unique
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `availability`
--
-- -----------------------------------------------------
-- Table: Availability
-- Purpose: Tracks availability dates for each accommodation.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `availability` (
  `AvailabilityID` INT NOT NULL AUTO_INCREMENT,     -- Unique identifier for each availability record, auto-incremented
  `AccommodationID` INT NOT NULL,                   -- Foreign key linking to the Accommodation table
  `AvailableDate` DATE NOT NULL,                    -- Date on which the accommodation is available
  `IsAvailable` TINYINT(1) NOT NULL,                -- Availability status (1 for available, 0 for not available)
  PRIMARY KEY (`AvailabilityID`),                   -- Sets AvailabilityID as the primary key
  INDEX `availability_ibfk_1` (`AccommodationID` ASC) VISIBLE, -- Index for AccommodationID foreign key
  CONSTRAINT `availability_ibfk_1`                  -- Defines the foreign key constraint for AccommodationID
    FOREIGN KEY (`AccommodationID`)
    REFERENCES `airbnb_db`.`accommodation` (`AccommodationID`)
    ON DELETE CASCADE                               -- Deletes availability records if the related accommodation is deleted
    ON UPDATE CASCADE                               -- Updates availability records if the related accommodation ID changes
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `booking`
--
-- -----------------------------------------------------
-- Table: Booking
-- Purpose: Tracks guest bookings, including associated accommodations, booking dates, check-in/check-out periods, and total costs.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,       -- Unique identifier for each booking, auto-incremented
  `GuestID` INT NULL,                            -- Foreign key linking to the GuestProfile table
  `AccommodationID` INT NULL,                    -- Foreign key linking to the Accommodation table
  `BookedByUserID` INT NULL,                     -- Foreign key linking to the User table
  `BookingDate` DATE NOT NULL,                   -- Date on which the booking was made
  `CheckInDate` DATE NOT NULL,                   -- Check-in date for the booking
  `CheckOutDate` DATE NOT NULL,                  -- Check-out date for the booking
  `TotalCost` DECIMAL(10,2) NOT NULL,            -- Total cost of the booking
  PRIMARY KEY (`BookingID`),                     -- Sets BookingID as the primary key
  INDEX `AccommodationID` (`AccommodationID` ASC) VISIBLE, -- Index for AccommodationID foreign key
  INDEX `GuestID` (`GuestID` ASC) VISIBLE,       -- Index for GuestID foreign key
  INDEX `BookedByUserID` (`BookedByUserID` ASC) VISIBLE, -- Index for BookedByUserID foreign key
  CONSTRAINT `booking_ibfk_1`                    -- Defines the foreign key constraint for GuestID
    FOREIGN KEY (`GuestID`)
    REFERENCES `airbnb_db`.`guestprofile` (`GuestID`)
    ON DELETE SET NULL                           -- Allows guest profile deletion, sets GuestID to NULL
    ON UPDATE CASCADE,                           -- Updates GuestID in booking table when it changes in GuestProfile
  CONSTRAINT `booking_ibfk_2`                    -- Defines the foreign key constraint for AccommodationID
    FOREIGN KEY (`AccommodationID`)
    REFERENCES `airbnb_db`.`accommodation` (`AccommodationID`)
    ON DELETE SET NULL                           -- Allows accommodation deletion, sets AccommodationID to NULL
    ON UPDATE CASCADE,                           -- Updates AccommodationID in booking table when it changes in Accommodation
  CONSTRAINT `booking_ibfk_3`                    -- Defines the foreign key constraint for BookedByUserID
    FOREIGN KEY (`BookedByUserID`)
    REFERENCES `airbnb_db`.`user` (`UserID`)
    ON DELETE SET NULL                           -- Allows user deletion, sets BookedByUserID to NULL
    ON UPDATE CASCADE                            -- Updates BookedByUserID in booking table when it changes in User
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calendar`
--
-- -----------------------------------------------------
-- Table: Calendar
-- Purpose: Maintains calendar entries indicating booking statuses for accommodations.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar` (
  `CalendarID` INT NOT NULL AUTO_INCREMENT,         -- Unique identifier for each calendar entry, auto-incremented
  `AccommodationID` INT NOT NULL,                   -- Foreign key linking to the Accommodation table
  `Date` DATE NOT NULL,                             -- Date for the calendar entry
  `BookingStatus` ENUM('Available', 'Booked', 'Unavailable') NOT NULL, -- Status of the accommodation on the specified date
  PRIMARY KEY (`CalendarID`),                       -- Sets CalendarID as the primary key
  INDEX `calendar_ibfk_1` (`AccommodationID` ASC) VISIBLE, -- Index for AccommodationID foreign key
  CONSTRAINT `calendar_ibfk_1`                      -- Defines the foreign key constraint for AccommodationID
    FOREIGN KEY (`AccommodationID`)
    REFERENCES `airbnb_db`.`accommodation` (`AccommodationID`)
    ON DELETE CASCADE                               -- Deletes calendar entry if the related accommodation is deleted
    ON UPDATE CASCADE                               -- Updates calendar entry if the related accommodation ID changes
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commission`
--
-- -----------------------------------------------------
-- Table: Commission
-- Purpose: Tracks commission fees associated with bookings.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `commission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commission` (
  `CommissionID` INT NOT NULL AUTO_INCREMENT,       -- Unique identifier for each commission record, auto-incremented
  `BookingID` INT NOT NULL,                         -- Foreign key linking to the Booking table
  `PlatformFee` DECIMAL(10,2) NOT NULL,             -- Platform fee charged for the booking
  `HostFee` DECIMAL(10,2) NOT NULL,                 -- Fee paid to the host
  PRIMARY KEY (`CommissionID`),                     -- Sets CommissionID as the primary key
  INDEX `BookingID` (`BookingID` ASC) VISIBLE,      -- Index for BookingID foreign key
  CONSTRAINT `commission_ibfk_1`                    -- Defines the foreign key constraint for BookingID
    FOREIGN KEY (`BookingID`)
    REFERENCES `airbnb_db`.`booking` (`BookingID`)
    ON DELETE CASCADE                               -- Deletes commission record if the related booking is deleted
    ON UPDATE CASCADE                               -- Updates commission record if the related booking ID changes
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount`
--
-- -----------------------------------------------------
-- Table: Discount
-- Purpose: Manages discount rates and time periods for accommodations.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `DiscountID` INT NOT NULL AUTO_INCREMENT,         -- Unique identifier for each discount record, auto-incremented
  `AccommodationID` INT NULL DEFAULT NULL,          -- Foreign key linking to the Accommodation table
  `DiscountPercentage` DECIMAL(5,2) NOT NULL,       -- Percentage discount offered on the accommodation
  `StartDate` DATE NOT NULL,                        -- Start date of the discount period
  `EndDate` DATE NOT NULL,                          -- End date of the discount period
  PRIMARY KEY (`DiscountID`),                       -- Sets DiscountID as the primary key
  INDEX `AccommodationID` (`AccommodationID` ASC) VISIBLE, -- Index for AccommodationID foreign key
  CONSTRAINT `discount_ibfk_1`                      -- Defines the foreign key constraint for AccommodationID
    FOREIGN KEY (`AccommodationID`)
    REFERENCES `airbnb_db`.`accommodation` (`AccommodationID`)
    ON DELETE SET NULL                              -- Sets AccommodationID to NULL if the related accommodation is deleted
    ON UPDATE CASCADE                               -- Updates AccommodationID if the related accommodation ID changes
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guestprofile`
--
-- -----------------------------------------------------
-- Table: GuestProfile
-- Purpose: Stores profile information specific to guests, including their preferences.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `guestprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestprofile` (
  `GuestID` INT NOT NULL,                          -- Unique identifier for each guest profile
  `UserID` INT NOT NULL,                           -- Foreign key linking the guest profile to the User table
  `Preferences` TEXT NULL DEFAULT NULL,            -- Stores guest preferences (e.g., room type, amenities)
  PRIMARY KEY (`GuestID`),                         -- Sets GuestID as the primary key
  UNIQUE INDEX `UserID` (`UserID` ASC) VISIBLE,    -- Ensures each UserID is unique in GuestProfile
  CONSTRAINT `guestprofile_ibfk_1`                 -- Defines the foreign key constraint for UserID
    FOREIGN KEY (`UserID`)
    REFERENCES `airbnb_db`.`user` (`UserID`)
    ON DELETE CASCADE                              -- If user is deleted, delete associated guest profile
    ON UPDATE CASCADE                              -- If user ID is updated, update the reference in guest profile
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hostprofile`
--
-- -----------------------------------------------------
-- Table: HostProfile
-- Purpose: Stores profile information specific to hosts, including ratings and verification status.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hostprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostprofile` (
  `HostID` INT NOT NULL,                        -- Unique identifier for each host, linked to a user
  `UserID` INT NOT NULL,                        -- Foreign key linking the host to the User table
  `Rating` DECIMAL(3,2) NULL DEFAULT NULL,      -- Host rating, stored as a decimal with 2 decimal places
  `VerificationStatus` ENUM('Verified', 'Pending', 'Unverified') NULL DEFAULT 'Pending', -- Verification status for the host
  PRIMARY KEY (`HostID`),                       -- Sets HostID as the primary key
  UNIQUE INDEX `UserID` (`UserID` ASC) VISIBLE, -- Ensures each UserID is unique in HostProfile
  CONSTRAINT `hostprofile_ibfk_1`               -- Defines the foreign key constraint for UserID
    FOREIGN KEY (`UserID`)
    REFERENCES `airbnb_db`.`user` (`UserID`)
    ON DELETE CASCADE                           -- If user is deleted, delete associated host profile
    ON UPDATE CASCADE                           -- If user ID is updated, update the reference in host profile
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `houserules`
--
-- -----------------------------------------------------
-- Table: HouseRules
-- Purpose: Defines house rules that can be applied to multiple accommodations.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `houserules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `houserules` (
  `RuleID` INT NOT NULL AUTO_INCREMENT,          -- Unique identifier for each rule
  `RuleDescription` TEXT NOT NULL,               -- Description of the house rule
  PRIMARY KEY (`RuleID`)                         -- Sets RuleID as the primary key
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incomecalculator`
--
-- -----------------------------------------------------
-- Table: IncomeCalculator
-- Purpose: Contains estimated income calculations for hosts based on bookings.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `incomecalculator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incomecalculator` (
  `CalculatorID` INT NOT NULL AUTO_INCREMENT,       -- Unique identifier for each income calculator record, auto-incremented
  `HostID` INT NULL,                                -- Foreign key linking to the HostProfile table
  `EstimatedIncome` DECIMAL(10,2) NOT NULL,         -- Estimated income for the host
  PRIMARY KEY (`CalculatorID`),                     -- Sets CalculatorID as the primary key
  INDEX `incomecalculator_ibfk_1` (`HostID` ASC) VISIBLE, -- Index for HostID foreign key
  CONSTRAINT `incomecalculator_ibfk_1`              -- Defines the foreign key constraint for HostID
    FOREIGN KEY (`HostID`)
    REFERENCES `airbnb_db`.`hostprofile` (`HostID`)
    ON DELETE CASCADE                               -- Deletes income calculator record if the related host profile is deleted
    ON UPDATE CASCADE                               -- Updates income calculator record if the related host ID changes
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insurancepolicy`
--
-- -----------------------------------------------------
-- Table: InsurancePolicy
-- Purpose: Details insurance policies related to accommodations.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `insurancepolicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurancepolicy` (
  `PolicyID` INT NOT NULL AUTO_INCREMENT,           -- Unique identifier for each insurance policy, auto-incremented
  `AccommodationID` INT NULL DEFAULT NULL,          -- Foreign key linking to the Accommodation table
  `CoverageAmount` DECIMAL(10,2) NOT NULL,          -- Amount covered by the insurance policy
  `Premium` DECIMAL(10,2) NOT NULL,                 -- Premium amount for the insurance policy
  `ProviderName` VARCHAR(100) NOT NULL,             -- Name of the insurance provider
  PRIMARY KEY (`PolicyID`),                         -- Sets PolicyID as the primary key
  INDEX `AccommodationID` (`AccommodationID` ASC) VISIBLE, -- Index for AccommodationID foreign key
  CONSTRAINT `insurancepolicy_ibfk_1`               -- Defines the foreign key constraint for AccommodationID
    FOREIGN KEY (`AccommodationID`)
    REFERENCES `airbnb_db`.`accommodation` (`AccommodationID`)
    ON DELETE SET NULL                              -- Sets AccommodationID to NULL if the related accommodation is deleted
    ON UPDATE CASCADE                               -- Updates AccommodationID if the related accommodation ID changes
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `listingimage`
--
-- -----------------------------------------------------
-- Table: ListingImage
-- Purpose: Stores image paths for accommodation listings.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `listingimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listingimage` (
  `ImageID` INT NOT NULL AUTO_INCREMENT,              -- Unique identifier for each listing image, auto-incremented
  `AccommodationID` INT NOT NULL,                     -- Foreign key linking to the Accommodation table
  `ImagePath` VARCHAR(255) NOT NULL,                  -- File path or URL to the image
  PRIMARY KEY (`ImageID`),                            -- Sets ImageID as the primary key
  INDEX `listingimage_ibfk_1` (`AccommodationID` ASC) VISIBLE, -- Index for AccommodationID foreign key
  CONSTRAINT `listingimage_ibfk_1`                    -- Defines the foreign key constraint for AccommodationID
    FOREIGN KEY (`AccommodationID`)
    REFERENCES `airbnb_db`.`accommodation` (`AccommodationID`)
    ON DELETE CASCADE                                 -- Deletes image record if the related accommodation is deleted
    ON UPDATE CASCADE                                 -- Updates image record if the related accommodation ID changes
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--
-- -----------------------------------------------------
-- Table: Location
-- Purpose: Contains geographical location details, including city and country.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `LocationID` INT NOT NULL AUTO_INCREMENT,           -- Unique identifier for each location, auto-incremented
  `City` VARCHAR(100) NOT NULL,                       -- Name of the city
  `Country` VARCHAR(100) NOT NULL,                    -- Name of the country
  `PostalCode` VARCHAR(10) NULL DEFAULT NULL,         -- Postal code of the location, nullable
  PRIMARY KEY (`LocationID`)                          -- Sets LocationID as the primary key
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--
-- -----------------------------------------------------
-- Table: Message
-- Purpose: Contains messages exchanged between users.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `MessageID` INT NOT NULL AUTO_INCREMENT,           -- Unique identifier for each message, auto-incremented
  `SenderUserID` INT NOT NULL,                       -- Foreign key linking to the User table for the sender
  `ReceiverUserID` INT NOT NULL,                     -- Foreign key linking to the User table for the receiver
  `MessageContent` TEXT NOT NULL,                    -- Content of the message
  `Timestamp` DATETIME NOT NULL,                     -- Date and time the message was sent
  PRIMARY KEY (`MessageID`),                         -- Sets MessageID as the primary key
  INDEX `message_ibfk_1` (`SenderUserID` ASC) VISIBLE,  -- Index for SenderUserID foreign key
  INDEX `message_ibfk_2` (`ReceiverUserID` ASC) VISIBLE, -- Index for ReceiverUserID foreign key
  CONSTRAINT `message_ibfk_1`                        -- Defines the foreign key constraint for SenderUserID
    FOREIGN KEY (`SenderUserID`)
    REFERENCES `airbnb_db`.`user` (`UserID`)
    ON DELETE CASCADE                                -- Deletes message if the sender is deleted
    ON UPDATE CASCADE,                               -- Updates message if the sender ID changes
  CONSTRAINT `message_ibfk_2`                        -- Defines the foreign key constraint for ReceiverUserID
    FOREIGN KEY (`ReceiverUserID`)
    REFERENCES `airbnb_db`.`user` (`UserID`)
    ON DELETE CASCADE                                -- Deletes message if the receiver is deleted
    ON UPDATE CASCADE                                -- Updates message if the receiver ID changes
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neighborhood`
--
-- -----------------------------------------------------
-- Table: Neighborhood
-- Purpose: Stores details about neighborhoods connected to locations.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `neighborhood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neighborhood` (
  `NeighborhoodID` INT NOT NULL AUTO_INCREMENT,  -- Unique identifier for the neighborhood
  `LocationID` INT NOT NULL,                     -- Foreign key linking to the Location table
  `Description` TEXT NOT NULL,                   -- Description of the neighborhood
  PRIMARY KEY (`NeighborhoodID`),               -- Sets NeighborhoodID as the primary key
  INDEX `LocationID` (`LocationID` ASC) VISIBLE, -- Index for foreign key
  CONSTRAINT `neighborhood_ibfk_1`              -- Defines the foreign key constraint for LocationID
    FOREIGN KEY (`LocationID`)
    REFERENCES `airbnb_db`.`location` (`LocationID`)
    ON DELETE CASCADE                           -- Deletes neighborhood info if the location is deleted
    ON UPDATE CASCADE                           -- Updates neighborhood info if the location ID changes
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment`
--
-- -----------------------------------------------------
-- Table: Payment
-- Purpose: Stores payment details related to bookings, including amount, status, payment date and payer.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` INT NOT NULL AUTO_INCREMENT,           -- Unique identifier for each payment, auto-incremented
  `BookingID` INT NOT NULL,                          -- Foreign key linking to the Booking table
  `PaidByUserID` INT NOT NULL,                       -- Foreign key linking to the User table (who made the payment)
  `Amount` DECIMAL(10,2) NOT NULL,                   -- Amount paid
  `Status` ENUM('Pending', 'Completed', 'Failed') NOT NULL, -- Status of the payment
  `PaymentDate` DATE NOT NULL,                       -- Date of the payment
  PRIMARY KEY (`PaymentID`),                         -- Sets PaymentID as the primary key
  INDEX `BookingID` (`BookingID` ASC) VISIBLE,       -- Index for BookingID foreign key
  INDEX `PaidByUserID` (`PaidByUserID` ASC) VISIBLE, -- Index for PaidByUserID foreign key
  CONSTRAINT `payment_ibfk_1`                        -- Defines the foreign key constraint for BookingID
    FOREIGN KEY (`BookingID`)
    REFERENCES `airbnb_db`.`booking` (`BookingID`)
    ON DELETE CASCADE                                -- Deletes payment if the related booking is deleted
    ON UPDATE CASCADE,                               -- Updates payment record if the related BookingID changes
  CONSTRAINT `payment_ibfk_2`                        -- Defines the foreign key constraint for PaidByUserID
    FOREIGN KEY (`PaidByUserID`)
    REFERENCES `airbnb_db`.`user` (`UserID`)
    ON DELETE CASCADE                                -- Deletes payment if the related user is deleted
    ON UPDATE CASCADE                                -- Updates payment record if the related UserID changes
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `propertypreference`
--
-- -----------------------------------------------------
-- Table: PropertyPreference
-- Purpose: Contains user-specific preferences for property features.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `propertypreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertypreference` (
  `PreferenceID` INT NOT NULL AUTO_INCREMENT,         -- Unique identifier for each property preference, auto-incremented
  `UserID` INT NOT NULL,                              -- Foreign key linking to the User table
  `PreferenceType` VARCHAR(50) NOT NULL,              -- Type of preference (e.g., room type, amenities)
  `PreferenceValue` VARCHAR(50) NOT NULL,             -- Value for the specified preference type
  PRIMARY KEY (`PreferenceID`),                       -- Sets PreferenceID as the primary key
  INDEX `propertypreference_ibfk_1` (`UserID` ASC) VISIBLE, -- Index for UserID foreign key
  CONSTRAINT `propertypreference_ibfk_1`              -- Defines the foreign key constraint for UserID
    FOREIGN KEY (`UserID`)
    REFERENCES `airbnb_db`.`user` (`UserID`)
    ON DELETE CASCADE                                 -- Deletes property preference if the related user is deleted
    ON UPDATE CASCADE                                 -- Updates property preference if the related user ID changes
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rating`
--
-- -----------------------------------------------------
-- Table: Rating
-- Purpose: Stores rating scores for accommodations.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `RatingID` INT NOT NULL AUTO_INCREMENT,            -- Unique identifier for each rating, auto-incremented
  `AccommodationID` INT NOT NULL,                    -- Foreign key linking to the Accommodation table
  `Score` INT NOT NULL,                              -- Rating score given to the accommodation
  PRIMARY KEY (`RatingID`),                          -- Sets RatingID as the primary key
  INDEX `AccommodationID` (`AccommodationID` ASC) VISIBLE, -- Index for AccommodationID foreign key
  CONSTRAINT `rating_ibfk_1`                         -- Defines the foreign key constraint for AccommodationID
    FOREIGN KEY (`AccommodationID`)
    REFERENCES `airbnb_db`.`accommodation` (`AccommodationID`)
    ON DELETE CASCADE                                -- Deletes rating if the related accommodation is deleted
    ON UPDATE CASCADE                                -- Updates rating if the related accommodation ID changes
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review`
--
-- -----------------------------------------------------
-- Table: Review
-- Purpose: Stores reviews and ratings for accommodations provided by users.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `ReviewID` INT NOT NULL AUTO_INCREMENT,            -- Unique identifier for each review, auto-incremented
  `AccommodationID` INT NULL DEFAULT NULL,           -- Foreign key linking to the Accommodation table
  `UserID` INT NOT NULL,                             -- Foreign key linking to the User table
  `Rating` INT NOT NULL,                             -- Rating score given in the review
  `Comment` TEXT NULL DEFAULT NULL,                  -- Text comment provided in the review
  `Date` DATE NOT NULL,                              -- Date the review was written
  PRIMARY KEY (`ReviewID`),                          -- Sets ReviewID as the primary key
  INDEX `AccommodationID` (`AccommodationID` ASC) VISIBLE, -- Index for AccommodationID foreign key
  INDEX `review_ibfk_2` (`UserID` ASC) VISIBLE,      -- Index for UserID foreign key
  CONSTRAINT `review_ibfk_1`                         -- Defines the foreign key constraint for AccommodationID
    FOREIGN KEY (`AccommodationID`)
    REFERENCES `airbnb_db`.`accommodation` (`AccommodationID`)
    ON DELETE SET NULL                               -- Sets AccommodationID to NULL if the related accommodation is deleted
    ON UPDATE CASCADE,                               -- Updates AccommodationID in the review if it changes in the accommodation table
  CONSTRAINT `review_ibfk_2`                         -- Defines the foreign key constraint for UserID
    FOREIGN KEY (`UserID`)
    REFERENCES `airbnb_db`.`user` (`UserID`)
    ON DELETE CASCADE                               -- Deletes review if the related user is deleted
    ON UPDATE CASCADE                                -- Updates UserID in the review if it changes in the user table
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `socialmedialink`
--
-- -----------------------------------------------------
-- Table: SocialMediaLink
-- Purpose: Stores social media links associated with users.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `socialmedialink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialmedialink` (
  `LinkID` INT NOT NULL AUTO_INCREMENT,              -- Unique identifier for each social media link, auto-incremented
  `UserID` INT NOT NULL,                             -- Foreign key linking to the User table
  `PlatformName` VARCHAR(50) NOT NULL,               -- Name of the social media platform (e.g., Facebook, Twitter)
  `ProfileLink` VARCHAR(255) NOT NULL,               -- URL to the user's profile on the social media platform
  PRIMARY KEY (`LinkID`),                            -- Sets LinkID as the primary key
  INDEX `socialmedialink_ibfk_1` (`UserID` ASC) VISIBLE, -- Index for UserID foreign key
  CONSTRAINT `socialmedialink_ibfk_1`                -- Defines the foreign key constraint for UserID
    FOREIGN KEY (`UserID`)
    REFERENCES `airbnb_db`.`user` (`UserID`)
    ON DELETE CASCADE                                -- Deletes social media link if the related user is deleted
    ON UPDATE CASCADE                                -- Updates social media link if the related user ID changes
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction`
--
-- -----------------------------------------------------
-- Table: Transaction
-- Purpose: Tracks financial transactions associated with payments.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `TransactionID` INT NOT NULL AUTO_INCREMENT,       -- Unique identifier for each transaction, auto-incremented
  `PaymentID` INT NULL DEFAULT NULL,                 -- Foreign key linking to the Payment table
  `TransactionDate` DATE NOT NULL,                   -- Date of the transaction
  `TransactionAmount` DECIMAL(10,2) NOT NULL,        -- Amount of the transaction
  PRIMARY KEY (`TransactionID`),                     -- Sets TransactionID as the primary key
  INDEX `PaymentID` (`PaymentID` ASC) VISIBLE,       -- Index for PaymentID foreign key
  CONSTRAINT `transaction_ibfk_1`                    -- Defines the foreign key constraint for PaymentID
    FOREIGN KEY (`PaymentID`)
    REFERENCES `airbnb_db`.`payment` (`PaymentID`)
    ON DELETE SET NULL                               -- Sets PaymentID to NULL if the related payment is deleted
    ON UPDATE CASCADE                                -- Updates Transaction if the related PaymentID changes
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--
-- -----------------------------------------------------
-- Table: User
-- Purpose: Stores basic information about users, including their contact details, referral relationships, and location.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` INT NOT NULL AUTO_INCREMENT,        -- Unique identifier for each user, auto-incremented
  `Name` VARCHAR(100) NOT NULL,                -- Full name of the user
  `Email` VARCHAR(100) NOT NULL,               -- Unique email for user contact and login
  `PhoneNumber` VARCHAR(15) NOT NULL,          -- Unique phone number for user contact
  `ReferredByUserID` INT(11) NULL DEFAULT NULL, -- References another user who referred this user (nullable)
  `LocationID` INT NOT NULL,                   -- Foreign key linking to the Location table
  PRIMARY KEY (`UserID`),                      -- Sets UserID as the primary key
  UNIQUE INDEX `Email` (`Email` ASC) VISIBLE,  -- Ensures each email is unique
  UNIQUE INDEX `PhoneNumber` (`PhoneNumber` ASC) VISIBLE, -- Ensures each phone number is unique
  INDEX `ReferredByUserID` (`ReferredByUserID` ASC) VISIBLE, -- Index for foreign key reference
  INDEX `LocationID` (`LocationID` ASC) VISIBLE, -- Index for foreign key reference
  CONSTRAINT `user_ibfk_1`                      -- Defines the foreign key constraint for ReferredByUserID
    FOREIGN KEY (`ReferredByUserID`)
    REFERENCES `airbnb_db`.`user` (`UserID`)
    ON DELETE SET NULL                          -- If referred user is deleted, set ReferredByUserID to NULL
    ON UPDATE CASCADE,                          -- Updates ReferredByUserID if UserID changes
  CONSTRAINT `user_ibfk_2`                      -- Defines the foreign key constraint for LocationID
    FOREIGN KEY (`LocationID`)
    REFERENCES `airbnb_db`.`location` (`LocationID`)
    ON DELETE CASCADE                           -- Deletes user if the related location is deleted
    ON UPDATE CASCADE                           -- Updates LocationID in the User table if it changes in Location
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4                 -- Supports multi-language characters and emojis
COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-25  0:50:54
