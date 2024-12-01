-- Analyze the query’s performance using EXPLAIN and identify any inefficiencies.

    EXPLAIN SELECT **
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


-- Refactor the query to reduce execution time, such as reducing unnecessary joins or using indexing.
    Reducing unnecessary columns
        SELECT 
        Booking.booking_id, 
        Booking.start_date, 
        Booking.end_date, 
        Booking.total_price, 
        User.first_name, 
        User.last_name, 
        Property.name AS property_name, 
        Property.location, 
        Payment.amount
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
    
    Indexing
        -- Index for User table
            CREATE INDEX idx_user_id ON User(user_id);

            -- Index for Property table
            CREATE INDEX idx_property_id ON Property(property_id);

            -- Index for Booking table
            CREATE INDEX idx_booking_user_id ON Booking(user_id);
            CREATE INDEX idx_booking_property_id ON Booking(property_id);

            -- Index for Payment table
            CREATE INDEX idx_payment_booking_id ON Payment.booking_id;
