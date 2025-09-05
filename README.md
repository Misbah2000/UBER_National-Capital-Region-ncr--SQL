# Uber Ride Bookings – NCR Region 🚖

## Overview
This project simulates **Uber ride bookings in the National Capital Region (NCR)**.  
It includes SQL scripts for creating the dataset, inserting sample bookings, and running analytical queries to explore **ride performance, customer trends, cancellations, and revenue**.  

## Database Schema
The table **`ncr_ride_bookings`** stores ride-level details:  

- `Booking_ID` → Unique ride booking ID  
- `Customer_ID` → Rider identifier  
- `Date`, `Time` → Booking date & time  
- `Booking_Status` → Completed, Incomplete, or No Driver Found  
- `Vehicle_Type` → Auto, Bike, Sedan, eBike, etc.  
- `Pickup_Location`, `Drop_Location` → Ride locations  
- `Avg_VTAT`, `Avg_CTAT` → Average vehicle/confirmation times  
- `Cancelled_Rides_by_Customer`, `Cancelled_Rides_by_Driver` → Cancellation details  
- `Incomplete_Rides` → Incomplete trips with reasons  
- `Booking_Value` → Fare of the ride  
- `Ride_Distance` → Distance travelled  
- `Driver_Ratings`, `Customer_Rating` → Ratings after ride  
- `Payment_Method` → UPI, Cash, Card, etc.  

## Features
- Create **ride booking table** with customer, driver, and payment details  
- Insert **sample NCR ride data**  
- Perform **SQL queries** for ride analytics  

## Example Queries
Some of the analysis included in the script:  

- List all completed bookings  
- Count rides per vehicle type  
- Find top 5 customers by total spend  
- Calculate average ride distance for completed rides  
- Show rides paid via UPI  
- Find highest & lowest driver ratings  
- Count cancellations by customers  
- Top 3 busiest drop locations  
- Get 2nd highest booking value  
- Identify duplicate customers with multiple bookings  
- Revenue generated per vehicle type  

WHERE Booking_Status = "Completed";

