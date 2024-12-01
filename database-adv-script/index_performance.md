1. Identify high-usage columns in your User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses). 
    The high-usage columns in the User table are:
        user_id: Frequently used in WHERE, JOIN, and as the primary key.
        email: Likely used in WHERE clauses for login or user retrieval.

    The high-usage columns in the Booking Table are:
        booking_id: Used in WHERE, JOIN, and as the primary key.
        user_id: Used in WHERE and JOIN clauses to link with the User table.
        property_id: Used in WHERE and JOIN clauses to link with the Property table.

    The high-usage columns in the Property Table are:
        property_id: Used in WHERE, JOIN, and as the primary key.
        location: Potentially used in WHERE clauses for filtering properties by city.

2. Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql
    -- Indexes for User Table
    CREATE INDEX idx_user_id ON User(user_id); 
    CREATE INDEX idx_user_email ON User(email);

    -- Indexes for Booking Table
    CREATE INDEX idx_booking_id ON Booking(booking_id); 
    CREATE INDEX idx_booking_user_id ON Booking(user_id);
    CREATE INDEX idx_booking_property_id ON Booking(property_id);

    -- Indexes for Property Table
    CREATE INDEX idx_property_id ON Property(property_id); 
    CREATE INDEX idx_property_location ON Property(location);

    -- nB Primary keys are already indexed

3. Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE.
    EXPLAIN SELECT * 
    FROM Booking 
    WHERE user_id = 'U1';
