USE hotel;

CREATE TABLE IF NOT EXISTS restaurant_reservation (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(150) NOT NULL,
    mobile VARCHAR(20) NOT NULL,
    email VARCHAR(254) NOT NULL,
    guest_count INT NOT NULL,
    reservation_date DATE NOT NULL,
    reservation_time TIME NOT NULL,
    note VARCHAR(1000),
    status ENUM('Pending', 'Confirmed', 'Cancelled') NOT NULL DEFAULT 'Pending',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_restaurant_reservation_date (reservation_date, reservation_time),
    INDEX idx_restaurant_reservation_status (status)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
