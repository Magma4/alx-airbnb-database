Brief Report on the improvements observed
    Partitioning is like organizing these letters into smaller boxes, each with a specific date range (e.g., January-March, April-June, etc.).

    Why is this helpful?
        Faster Search: When you need a letter from a specific time period, you only need to search the relevant box.
        Reduced Search Time: Instead of searching through the entire giant box, you're only searching through a smaller, more specific box.
        
    In our database, we partitioned the Booking table based on the start_date of each booking.
    This means that bookings from the same quarter or year are grouped together.

    The Results we observed were:
    Faster Queries: When we want to find bookings from a specific time period, the database can quickly locate the correct partition and only search within that smaller dataset.
    Improved Performance: This leads to significantly faster query execution times.