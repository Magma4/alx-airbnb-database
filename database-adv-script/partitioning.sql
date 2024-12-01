-- Create a new partitioned Booking table
CREATE TABLE Booking_partitioned (
    booking_id UUID NOT NULL,
    user_id UUID NOT NULL,
    property_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
)
PARTITION BY RANGE (start_date) (
    PARTITION p_2023 VALUES LESS THAN ('2024-01-01'),
    PARTITION p_2024_q1 VALUES LESS THAN ('2024-04-01'),
    PARTITION p_2024_q2 VALUES LESS THAN ('2024-07-01'),
    PARTITION p_2024_q3 VALUES LESS THAN ('2024-10-01'),
    PARTITION p_2024_q4 VALUES LESS THAN ('2025-01-01'),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);

-- Migrate data from the original Booking table
INSERT INTO Booking_partitioned
SELECT * FROM Booking;



-- Test 1. Fetch Bookings for Q1 2024
EXPLAIN ANALYZE
SELECT * 
FROM Booking_partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-03-31';
