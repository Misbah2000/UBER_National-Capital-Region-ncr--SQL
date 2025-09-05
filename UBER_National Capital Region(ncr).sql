CREATE TABLE ncr_ride_bookings (
    Date DATE,
    Time TIME,
    Booking_ID VARCHAR(20),
    Booking_Status VARCHAR(50),
    Customer_ID VARCHAR(20),
    Vehicle_Type VARCHAR(50),
    Pickup_Location VARCHAR(100),
    Drop_Location VARCHAR(100),
    Avg_VTAT DECIMAL(10,2),
    Avg_CTAT DECIMAL(10,2),
    Cancelled_Rides_by_Customer INT,
    Reason_for_cancelling_by_Customer VARCHAR(255),
    Cancelled_Rides_by_Driver INT,
    Driver_Cancellation_Reason VARCHAR(255),
    Incomplete_Rides INT,
    Incomplete_Rides_Reason VARCHAR(255),
    Booking_Value DECIMAL(10,2),
    Ride_Distance DECIMAL(10,2),
    Driver_Ratings DECIMAL(3,1),
    Customer_Rating DECIMAL(3,1),
    Payment_Method VARCHAR(50)
);

INSERT INTO ncr_ride_bookings
 VALUES ('2024-03-23', '12:29:38', '"CNR5884300"', 'No Driver Found', '"CID1982111"', 'eBike', 'Palam Vihar', 'Jhilmil', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ncr_ride_bookings
 VALUES ('2024-11-29', '18:01:39', '"CNR1326809"', 'Incomplete', '"CID4604802"', 'Go Sedan', 'Shastri Nagar', 'Gurgaon Sector 56', 4.9, 14.0, NULL, NULL, NULL, NULL, 1.0, 'Vehicle Breakdown', 237.0, 5.73, NULL, NULL, 'UPI');

INSERT INTO ncr_ride_bookings
 VALUES ('2024-08-23', '08:56:10', '"CNR8494506"', 'Completed', '"CID9202816"', 'Auto', 'Khandsa', 'Malviya Nagar', 13.4, 25.8, NULL, NULL, NULL, NULL, NULL, NULL, 627.0, 13.58, 4.9, 4.9, 'Debit Card');

INSERT INTO ncr_ride_bookings
 VALUES ('2024-10-21', '17:17:25', '"CNR8906825"', 'Completed', '"CID2610914"', 'Premier Sedan', 'Central Secretariat', 'Inderlok', 13.1, 28.5, NULL, NULL, NULL, NULL, NULL, NULL, 416.0, 34.02, 4.6, 5.0, 'UPI');

INSERT INTO ncr_ride_bookings
 VALUES ('2024-09-16', '22:08:00', '"CNR1950162"', 'Completed', '"CID9933542"', 'Bike', 'Ghitorni Village', 'Khan Market', 5.3, 19.6, NULL, NULL, NULL, NULL, NULL, NULL, 737.0, 48.21, 4.1, 4.3, 'UPI');

INSERT INTO ncr_ride_bookings
 VALUES ('2024-02-06', '09:44:56', '"CNR4096693"', 'Completed', '"CID4670564"', 'Auto', 'AIIMS', 'Narsinghpur', 5.1, 18.1, NULL, NULL, NULL, NULL, NULL, NULL, 316.0, 4.85, 4.1, 4.6, 'UPI');

INSERT INTO ncr_ride_bookings
 VALUES ('2024-06-17', '15:45:58', '"CNR2002539"', 'Completed', '"CID6800553"', 'Go Mini', 'Vaishali', 'Punjabi Bagh', 7.1, 20.4, NULL, NULL, NULL, NULL, NULL, NULL, 640.0, 41.24, 4.0, 4.1, 'UPI');

INSERT INTO ncr_ride_bookings
 VALUES ('2024-03-19', '17:37:37', '"CNR6568000"', 'Completed', '"CID8610436"', 'Auto', 'Mayur Vihar', 'Cyber Hub', 12.1, 16.5, NULL, NULL, NULL, NULL, NULL, NULL, 136.0, 6.56, 4.4, 4.2, 'UPI');

INSERT INTO ncr_ride_bookings
 VALUES ('2024-09-14', '12:49:09', '"CNR4510807"', 'No Driver Found', '"CID7873618"', 'Go Sedan', 'Noida Sector 62', 'Noida Sector 18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ncr_ride_bookings
 VALUES ('2024-12-16', '19:06:48', '"CNR7721892"', 'Incomplete', '"CID5214275"', 'Auto', 'Rohini', 'Adarsh Nagar', 6.1, 26.0, NULL, NULL, NULL, NULL, 1.0, 'Other Issue', 135.0, 10.36, NULL, NULL, 'Cash');

SELECT * FROM ncr_ride_bookings;

-- 1. List all completed bookings?
SELECT * FROM ncr_ride_bookings
WHERE Booking_Status = "Completed";
-- Returns all rows where booking status is completed.

-- 2. Find the number of rides for each Vehicle_Type?
SELECT Vehicle_Type, count(*) as total_rides
FROM ncr_ride_bookings
group by Vehicle_Type;
-- groups rides by type of vehile and counts them.

-- 3. Get the top 5 customers who spent the most?
SELECT Customer_ID, sum(Booking_Value) AS total_spent
FROM ncr_ride_bookings
GROUP BY Customer_ID
ORDER BY total_spent DESC
LIMIT 5;
-- finds customers who spent the most on bookings.

-- 4. Find the average ride distance for completed bookings?
SELECT avg(Ride_Distance) AS avg_distance
FROM ncr_ride_bookings
WHERE Booking_Status = "Completed";
-- calculate average ride distance for only completed bookings.

-- 5. Show rides where payment was made using UPI?
SELECT * FROM ncr_ride_bookings
WHERE Payment_Method = "UPI";
-- find rides that were paid with UPI.

-- 6. Get the highest and lowest driver ratings recorded?
SELECT MAX(Driver_Ratings) AS max_rating,
 MIN(Driver_Ratings) AS min_rating
FROM ncr_ride_bookings;
-- finds max and min driver ratings.

-- 7. Count how many rides were cancelled by customers?
SELECT count(*) AS cancelled_by_customer
FROM ncr_ride_bookings
WHERE Cancelled_Rides_by_Customer is not null;
-- count rides where cancelled by customers.

-- 8. Get all rides that were completed and had a driver rating above 4.5?
SELECT * FROM ncr_ride_bookings
WHERE Booking_status = "Completed"
AND Driver_Ratings > 4.5;
-- find completed rides with high driver ratings.

-- 9. Show the top 3 drop locations with highest completed rides?
SELECT Drop_Location, count(*) AS completed_rides
FROM ncr_ride_bookings
WHERE Booking_Status = "Completed"
GROUP BY Drop_Location
ORDER BY completed_rides DESC
LIMIT 3;
-- finds the busiest drop points

-- 10. Find the 2nd highest booking value?
SELECT MAX(Booking_Value)
FROM ncr_ride_bookings
WHERE Booking_Value < (SELECT MAX(Booking_Value)
 FROM ncr_ride_bookings);
 -- get the 2nd highest ride fare
 
 -- 11. Display duplicate custimer IDs (customers who booked more than once)
 SELECT Customer_ID, count(*) AS total_bookings
 FROM ncr_ride_bookings
 GROUP BY Customer_ID
 HAVING count(*) > 1;
-- shows customers with multiple bookings

-- 12. Show bookings where the value is higer than  the average booking value?
SELECT Booking_ID, Customer_ID, Vehicle_Type, Booking_Value
FROM ncr_ride_bookings
WHERE Booking_Value > (SELECT AVG(Booking_Value) 
FROM ncr_ride_bookings);
-- finds premium rides with fare above average.

-- 13. Show each customer with their ride details?
SELECT c.Customer_Name,
b.Booking_ID,
b.Vehicle_Type,
b.Booking_Status,
b.Booking_Value
FROM ncr_ride_bookings b
INNER JOIN Customers c
ON b.Customer_ID = c.Customer_ID;
-- shows only customer who have bookings.

-- 14. Show all customers and their bookings (including customers with no rides)?
SELECT c.Customer_Name,
b.Booking_ID,
b.Vehicle_Type,
b.Booking_Status
FROM Customers c
LEFT JOIN ncr_ride_bookings b
ON c.Customer_ID = b.Customer_ID;
-- customers without rides will appear with NULL booking details.

-- 15. Show all customers and their rides (even if some never booked)?
SELECT c.Customer_Name,
 b.Booking_ID,
 b.Vehicle_Type
FROM ncr_ride_bookings b
RIGHT JOIN Customers c 
ON b.Customer_ID = c.Customer_ID;
-- all vehicles with their bookings, and if a vehicle has no booking, its booking details appear as NULL.

-- 16. Find bookings where one ride cost more than another ride?
SELECT a.Booking_ID AS Ride_A,
b.Booking_ID AS Ride_B,
a.Booking_Value AS Value_A,
b.Booking_Value AS Value_B
FROM ncr_ride_bookings a
JOIN ncr_ride_bookings b
ON a.Booking_Value = b.Booking_Value;
-- Each booking is compared with all others.If Booking_A has a higher fare than Booking_B, it will be listed.
-- This helps analyze fare differences among rides.

-- 17. Find the total booking value (revenue) genareted per vehicle type?
SELECT Vehicle_Type, 
 SUM(Booking_Value) AS Total_Revenue
FROM ncr_ride_bookings
GROUP BY Vehicle_Type
ORDER BY Total_Revenue DESC;
-- This shows which vehicle type earns the most money.