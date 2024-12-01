SELECT *
FROM 
    Booking
JOIN 
    User 
ON 
    Booking.user_id = User.user_id
JOIN 
    Property 
ON 
    Booking.property_id = Property.property_id
LEFT JOIN 
    Payment 
ON 
    Booking.booking_id = Payment.booking_id
WHERE 
    Booking.status = 'confirmed'
    AND Booking.start_date BETWEEN '2024-01-01' AND '2024-03-31';



-- Analyze the query’s performance using EXPLAIN and identify any inefficiencies.
EXPLAIN SELECT *
FROM 
    Booking
JOIN 
    User 
ON 
    Booking.user_id = User.user_id
JOIN 
    Property 
ON 
    Booking.property_id = Property.property_id
LEFT JOIN 
    Payment 
ON 
    Booking.booking_id = Payment.booking_id
WHERE 
    Booking.status = 'confirmed'
    AND Booking.start_date BETWEEN '2024-01-01' AND '2024-03-31';
