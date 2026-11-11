USE hotel;

CREATE TABLE IF NOT EXISTS contact_message (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    mobile VARCHAR(20) NOT NULL,
    email VARCHAR(254) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Dữ liệu mẫu (chạy một lần; chạy lại sẽ tạo thêm bản ghi trùng lặp)
INSERT INTO contact_message (name, mobile, email, message) VALUES
('Nguyễn Minh Anh', '0900000001', 'khach01@example.com', 'Tôi muốn hỏi về phòng Deluxe và tiện ích đi kèm.'),
('Trần Quốc Bảo', '0900000002', 'khach02@example.com', 'Khách sạn có dịch vụ đưa đón sân bay không?'),
('Lê Thu Hà', '0900000003', 'khach03@example.com', 'Vui lòng cho tôi biết giờ nhận phòng và trả phòng.'),
('Phạm Gia Huy', '0900000004', 'khach04@example.com', 'Tôi muốn đặt phòng cho gia đình vào cuối tuần.'),
('Võ Ngọc Linh', '0900000005', 'khach05@example.com', 'Phòng có phục vụ bữa sáng không?'),
('Đặng Tuấn Kiệt', '0900000006', 'khach06@example.com', 'Tôi cần tư vấn phòng có sức chứa bốn người.'),
('Bùi Khánh Vy', '0900000007', 'khach07@example.com', 'Khách sạn có hồ bơi và bãi đỗ xe không?'),
('Đỗ Thành Nam', '0900000008', 'khach08@example.com', 'Xin gửi bảng giá phòng cho kỳ nghỉ sắp tới.'),
('Hoàng Mai Phương', '0900000009', 'khach09@example.com', 'Tôi muốn yêu cầu phòng không hút thuốc.'),
('Nguyễn Đức Thịnh', '0900000010', 'khach10@example.com', 'Vui lòng liên hệ lại để xác nhận thông tin đặt phòng.');
