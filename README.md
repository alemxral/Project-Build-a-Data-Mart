# Airbnb Database Management System

## Project Overview
The Airbnb Database Management System is a robust and scalable relational database designed to handle accommodation bookings and management. This system supports multi-role user management, booking processes, financial transactions, and more, through a highly normalized schema of 26 interconnected tables.

---

## Features
- **Multi-Role User Management**: Supports hosts, guests, and administrators.
- **Booking and Payment Processing**: Tracks bookings, payments, and transaction statuses.
- **Dynamic Data Tracking**: Handles availability, commissions, and reviews.
- **Comprehensive House Rules Management**: Implements flexible house rules linked to accommodations.
- **Data Integrity and Security**: Enforced through foreign key constraints and transaction safety.

---

## System Metadata
- **Total Tables**: 26
- **Total Records**: 520+
- **Database Size**: ~0.94 MB
- **Primary Tables**:
  - User Management: `User`, `HostProfile`, `GuestProfile`, `Admin`
  - Property Management: `Accommodation`, `Amenities`, `Location`
  - Transaction Management: `Booking`, `Payment`, `Commission`
  - Support Features: `Review`, `Rating`, `Message`, `HouseRules`

---

## Installation Instructions

### System Requirements
- **Database Management System**: MySQL 8.0 or higher
- **Operating System**: Windows/Linux/MacOS
- **Storage**: Minimum 100 MB free space
- **Tools**: MySQL Workbench (recommended for executing SQL scripts)

### Installation Steps
1. **Set Up the Database**
    - Create a new database named `airbnb_db` using MySQL Workbench or the MySQL CLI:
      ```sql
      CREATE DATABASE airbnb_db;
      ```

2. **Run SQL Scripts**
    - Execute the provided SQL scripts in the following order:
      1. `create_tables.sql`: This script creates all necessary tables.
      2. `insert_data.sql`: This script populates the tables with sample data.

3. **Verify the Installation**
    - Ensure all 26 tables are created successfully.
    - Verify data by running sample queries, such as:
      ```sql
      SELECT * FROM User;
      ```

---

## Testing Instructions

### Test Cases
1. **User Test**: Verify user booking details and total booking costs.
    ```sql
    SELECT u.Name AS GuestName, a.Description AS Accommodation, b.TotalCost AS BookingCost
    FROM user u
    JOIN booking b ON u.UserID = b.BookedByUserID
    JOIN accommodation a ON b.AccommodationID = a.AccommodationID
    ORDER BY b.TotalCost DESC;
    ```

2. **Accommodation Test**: Retrieve accommodation details, hosts, and total bookings.
    ```sql
    SELECT a.Description AS Accommodation, h.HostID AS Host, COUNT(b.BookingID) AS TotalBookings
    FROM accommodation a
    LEFT JOIN hostprofile h ON a.HostID = h.HostID
    LEFT JOIN booking b ON a.AccommodationID = b.AccommodationID
    GROUP BY a.AccommodationID
    ORDER BY TotalBookings DESC;
    ```

3. **Booking Test**: Retrieve bookings with total costs exceeding 500.
    ```sql
    SELECT g.GuestID, u.Name AS GuestName, b.CheckInDate, b.TotalCost
    FROM booking b
    JOIN guestprofile g ON b.GuestID = g.GuestID
    JOIN user u ON b.BookedByUserID = u.UserID
    WHERE b.TotalCost > 500
    ORDER BY b.CheckInDate ASC;
    ```

---

For further assistance or questions, please contact [muhannad.al-ahmad@iu-study.org].
