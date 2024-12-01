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
    Booking.booking_id = Payment.booking_id;
