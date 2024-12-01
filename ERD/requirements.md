1. User-Property Relationship
    One-to-Many Relationship:
    A User can own or manage multiple Properties. However, a Property can only be owned by one User.

2. User-Booking Relationship
    One-to-Many Relationship:
    A User can make multiple Bookings. However, a Booking can only be made by one User.

3. Property-Booking Relationship
    One-to-Many Relationship:
    A Property can have multiple Bookings. However, a Booking can only be for one Property.

4. Booking-Payment Relationship
    One-to-One Relationship:
    A Booking has exactly one Payment, and a Payment is linked to exactly one Booking.

5. User-Review Relationship
    One-to-Many Relationship:
    A User can leave multiple Reviews. However, a Review can only be left by one User.

6. Property-Review Relationship
    One-to-Many Relationship:
    A Property can have multiple Reviews. However, a Review can only be for one Property.

7. User-Message Relationship
    Self-Referential One-to-Many Relationship:
    A User can send and receive multiple Messages. Each Message has one sender and one recipient, both of whom are Users.