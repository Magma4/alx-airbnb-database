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

EXPLAIN ANALYZE SELECT * 
FROM Booking 
WHERE user_id = 'U1';
