-- Retrieve All Bookings and the Respective Users Who Made Those Bookings (Inner Join)
SELECT * 
FROM Booking
INNER JOIN User 
ON Booking.user_id = User.user_id;


-- Retrieve All Properties and Their Reviews Including Properties with No Reviews (Left Join)
SELECT *
FROM Property
LEFT JOIN Review 
ON Property.property_id = Review.property_id
ORDER BY Review.rating DESC;


-- Retrieve All Users and All Bookings (Full Outer Join)
SELECT *
FROM User
FULL OUTER JOIN Booking 
ON User.user_id = Booking.user_id;


