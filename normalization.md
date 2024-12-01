We want to organize our data in a way that avoids redundancy and ensures data integrity.

3NF (Third Normal Form) is one of the levels of database normalization. It's like organizing your books into categories and then arranging them alphabetically within each category.


Let's break down the entities:

1. User
    Each row represents a unique user.
    Information like user ID, name, email, and password is stored here.

2. Property
    Each row represents a unique property.
    Information like property ID, name, description, location, price per night, and the owner's ID (foreign key to the User table) is stored here.

3. Booking
    Each row represents a unique booking.
    Information like booking ID, user ID (foreign key to the User table), property ID (foreign key to the Property table), check-in date, check-out date, and potentially total price is stored here.
    Note about total price: If the total price can always be calculated from the price per night and the duration of the stay, it might not be necessary to store it as a separate attribute. This would avoid redundancy and potential inconsistencies.

4. Payment
    Each row represents a unique payment.
    Information like payment ID, booking ID (foreign key to the Booking table), amount, and payment method is stored here.

5. Review
    Each row represents a unique review.
    Information like review ID, user ID (foreign key to the User table), property ID (foreign key to the Property table), rating, and comment is stored here.

6. Message
    Each row represents a unique message.
    Information like message ID, sender ID (foreign key to the User table), recipient ID (foreign key to the User table), message content, and timestamp is stored here.



After applying 3NF, the schema remains largely the same, with the exception of possibly removing total_price from the Booking table:

User Table
    | Attribute      | Type       | Constraints                              |
    |----------------|------------|------------------------------------------|
    | user_id        | UUID       | Primary Key                              |
    | first_name     | VARCHAR    | NOT NULL                                 |
    | last_name      | VARCHAR    | NOT NULL                                 |
    | email          | VARCHAR    | UNIQUE, NOT NULL                         |
    | password_hash  | VARCHAR    | NOT NULL                                 |
    | phone_number   | VARCHAR    | NULL                                     |
    | role           | ENUM       | NOT NULL (guest, host, admin)            |
    | created_at     | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP                |

Property Table
    | Attribute      | Type       | Constraints                              |
    |----------------|------------|------------------------------------------|
    | property_id    | UUID       | Primary Key                              |
    | host_id        | UUID       | Foreign Key (User.user_id)               |
    | name           | VARCHAR    | NOT NULL                                 |
    | description    | TEXT       | NOT NULL                                 |
    | location       | VARCHAR    | NOT NULL                                 |
    | pricepernight  | DECIMAL    | NOT NULL                                 |
    | created_at     | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP                |
    | updated_at     | TIMESTAMP  | ON UPDATE CURRENT_TIMESTAMP              |

Booking Table
    | Attribute      | Type       | Constraints                              |
    |----------------|------------|------------------------------------------|
    | booking_id     | UUID       | Primary Key                              |
    | property_id    | UUID       | Foreign Key (Property.property_id)       |
    | user_id        | UUID       | Foreign Key (User.user_id)               |
    | start_date     | DATE       | NOT NULL                                 |
    | end_date       | DATE       | NOT NULL                                 |
    | status         | ENUM       | NOT NULL (pending, confirmed, canceled)  |
    | created_at     | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP                |

Payment Table
    | Attribute      | Type       | Constraints                              |
    |----------------|------------|------------------------------------------|
    | payment_id     | UUID       | Primary Key                              |
    | booking_id     | UUID       | Foreign Key (Booking.booking_id)         |
    | amount         | DECIMAL    | NOT NULL                                 |
    | payment_date   | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP                |
    | payment_method | ENUM       | NOT NULL (credit_card, paypal, stripe)   |

Review Table
    | Attribute      | Type       | Constraints                           |
    |----------------|------------|------------------------------------------|
    | review_id      | UUID       | Primary Key                              |
    | property_id    | UUID       | Foreign Key (Property.property_id)       |
    | user_id        | UUID       | Foreign Key (User.user_id)               |
    | rating         | INTEGER    | CHECK (rating >= 1 AND rating <= 5)      |
    | comment        | TEXT       | NOT NULL                                 |
    | created_at     | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP                |

Message Table
    | Attribute      | Type       | Constraints                              |
    |----------------|------------|------------------------------------------|
    | message_id     | UUID       | Primary Key                              |
    | sender_id      | UUID       | Foreign Key (User.user_id)               |
    | recipient_id   | UUID       | Foreign Key (User.user_id)               |
    | message_body   | TEXT       | NOT NULL                                 |
    | sent_at        | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP                |
