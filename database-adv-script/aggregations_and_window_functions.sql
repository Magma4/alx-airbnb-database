-- Query to Find the Total Number of Bookings Made by Each User
SELECT * 
FROM (
    SELECT 
        Booking.user_id, 
        COUNT(Booking.booking_id) AS total_bookings
    FROM 
        Booking
    GROUP BY 
        Booking.user_id
) AS UserBookings
INNER JOIN User 
ON UserBookings.user_id = User.user_id;

-- Query to Rank Properties Based on the Total Number of Bookings
SELECT *,
       ROW_NUMBER() OVER (ORDER BY ranking) AS row_number
FROM (
    SELECT 
        Property.property_id, 
        Property.name AS property_name, 
        COUNT(Booking.booking_id) AS total_bookings,
        RANK() OVER (ORDER BY COUNT(Booking.booking_id) DESC) AS ranking
    FROM 
        Property
    LEFT JOIN 
        Booking 
    ON 
        Property.property_id = Booking.property_id
    GROUP BY 
        Property.property_id, Property.name
) AS RankedProperties;


