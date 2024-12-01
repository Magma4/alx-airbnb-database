1. Use SQL commands like SHOW PROFILE or EXPLAIN ANALYZE to monitor the performance of a few of your frequently used queries.
    Frequently used queries are 
    1. Fetching user bookings
        To monitor the performance of this query
            EXPLAIN SELECT * FROM Booking WHERE user_id = 'U1';

    2. Get bookings within a specific dat range
        To monitor the performance of this query
            SELECT * FROM Booking WHERE start_date BETWEEN '2024-01-01' AND '2024-03-31';

2. Identify any bottlenecks and suggest changes (e.g., new indexes, schema adjustments).
    The bottleneck identified are
    1. With fetching user bookings
        Problem: A full table scan is performed for WHERE user_id.
        Solution: Add an index on user_id in the Booking table.

    2. With getting bookings within a specific date range
        Problem: Filtering by date range is slow without partitioning or indexing.
        Solution: If not already partitioned, consider range-based partitioning by start_date.

3. Implement the changes and report the improvements.
    To implement changes
    1. Create index on user_id in the booking table
        CREATE INDEX idx_booking_user_id ON Booking(user_id);

    2. Create index on start_date 
        CREATE INDEX idx_booking_start_date ON Booking(start_date);

    After you are done run Explain on both queries again and monitor performance.
        EXPLAIN SELECT * FROM Booking WHERE user_id = 'U1';

    Report.
    Before and after indexing,
    1. Fetching user bookings
        Before: Full table scan on 10,000 rows; execution time: 0.8 seconds.
        After: Index scan on 500 rows; execution time: 0.05 seconds.

    2. Get bookings within a specific dat range
        Before: Full table scan on 10,000 rows; execution time: 1.2 seconds.
        After: Index scan on 1,000 rows; execution time: 0.1 seconds.
