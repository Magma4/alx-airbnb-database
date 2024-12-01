-- Subquery to Find All Properties Where the Average Rating Is Greater Than 4.0
SELECT * 
FROM Property
WHERE property_id IN (
    SELECT property_id
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- Subquery to Find Users Who Have Made More Than 3 Bookings
SELECT * 
FROM User
WHERE (
    SELECT COUNT(*) 
    FROM Booking 
    WHERE Booking.user_id = User.user_id
) > 3;

