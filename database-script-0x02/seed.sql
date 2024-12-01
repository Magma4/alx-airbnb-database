INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    ('U1', 'Raymond', 'Amoateng', 'raymond.amoateng@example.com', 'hashed_password_123', '0541234567', 'guest', DEFAULT),
    ('U2', 'Cole', 'Baidoo', 'cole.baidoo@example.com', 'hashed_password_456', '0559876543', 'host', DEFAULT),
    ('U3', 'Irene', 'Aragona', 'irene.aragona@example.com', 'hashed_password_admin', NULL, 'admin', DEFAULT);


INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
    ('P1', 'U2', 'Accra Luxury Apartment', 'A luxurious apartment in the heart of Accra.', 'Accra', 1200.00, DEFAULT, DEFAULT),
    ('P2', 'U2', 'Cape Coast Beach House', 'A serene beach house in Cape Coast.', 'Cape Coast', 800.00, DEFAULT, DEFAULT),
    ('P3', 'U2', 'Kumasi Garden Villa', 'A cozy villa with a beautiful garden.', 'Kumasi', 1000.00, DEFAULT, DEFAULT);


INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    ('B1', 'P1', 'U1', '2024-12-15', '2024-12-20', 6000.00, 'confirmed', DEFAULT),
    ('B2', 'P2', 'U1', '2024-12-25', '2024-12-30', 4000.00, 'pending', DEFAULT);


INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    ('PAY1', 'B1', 6000.00, DEFAULT, 'credit_card'),
    ('PAY2', 'B2', 4000.00, DEFAULT, 'paypal');


INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('R1', 'P1', 'U1', 5, 'Fantastic stay at the luxury apartment in Accra.', DEFAULT),
    ('R2', 'P2', 'U1', 4, 'Beautiful beach house, perfect for relaxation.', DEFAULT);


INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    ('M1', 'U1', 'U2', 'Hi Cole, is the Accra Luxury Apartment available?', DEFAULT),
    ('M2', 'U2', 'U1', 'Hi Raymond, yes it is available for your requested dates.', DEFAULT);
