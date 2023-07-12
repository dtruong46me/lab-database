DROP DATABASE IF EXISTS db_20214937;
CREATE DATABASE db_20214937;

USE db_20214937;

CREATE TABLE IF NOT EXISTS customer (
    CustomerID VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(100),
    Gender VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS  owner (
    OwnerID VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS  room (
    RoomID VARCHAR(20) PRIMARY KEY,
    OwnerID VARCHAR(20),
    FOREIGN KEY (OwnerID) REFERENCES owner(OwnerID),
    City VARCHAR(100),
    Price_per_day FLOAT
);

CREATE TABLE IF NOT EXISTS booking (
    customerID VARCHAR(20),
    roomID VARCHAR(20),
    FOREIGN KEY (customerID) REFERENCES customer(CustomerID),
    FOREIGN KEY (roomID) REFERENCES room(RoomID),
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (customerID, roomID, start_date)
);

INSERT INTO customer VALUES 
('C1', 'Nguyen Manh', 'M'),
('C2', 'Nguyen Minh', 'M'),
('C3', 'Nguyen Van', 'F'),
('C4', 'Nguyen Phuong', 'F'), 
('C5', 'Nguyen Bao', 'F'); 

INSERT INTO owner VALUES 
('O1', 'Tran Manh'),
('O2', 'Tran Minh'),
('O3', 'Tran Van'),
('O4', 'Tran Phuong'),
('O5', 'Tran Bao');

INSERT INTO room VALUES 
('R1', 'O1', 'Ha Noi', 200),
('R2', 'O1', 'Ho Chi Minh', 200),
('R3', 'O3', 'Ha Noi', 200),
('R4', 'O4', 'Ho Chi Minh', 200),
('R5', 'O5', 'Da Nang', 200);

INSERT INTO booking VALUES 
('C4', 'R2', '2020-10-10', '2021-10-15');

SELECT COUNT(*) AS NumOfRooms, city
FROM room
GROUP BY OwnerID, City
ORDER BY NumOfRooms DESC;

SELECT RoomID, City, Price_per_day
FROM room
WHERE RoomID NOT IN (
    SELECT roomID
    FROM booking
    WHERE customerID IN (
        SELECT CustomerID
        FROM customer
        WHERE Gender = 'F'
    )
);

SELECT room.roomID, ownerID, city, price_per_day
FROM room
JOIN booking
ON room.roomID = booking.roomID
GROUP BY roomID
ORDER BY COUNT(booking.roomID) DESC
LIMIT 1;

SELECT r.OwnerID, o.Name, SUM(DATEDIFF(b.end_date, b.start_date) * r.Price_per_day) AS revenue
FROM room r
JOIN booking b ON r.RoomID = b.roomID
JOIN owner o ON r.OwnerID = o.OwnerID
WHERE YEAR(b.end_date) = 2021
GROUP BY r.OwnerID, o.Name
ORDER BY revenue DESC;

SELECT customer.CustomerID, customer.Name, room.price_per_day, COUNT(booking.roomID) AS NumOfRents
FROM booking
JOIN room ON booking.roomID = room.roomID
JOIN customer ON booking.customerID = customer.CustomerID
GROUP BY customer.CustomerID, room.price_per_day
ORDER BY price_per_day DESC, COUNT(booking.roomID) DESC
LIMIT 1;

SELECT owner.OwnerID, owner.Name, COUNT(room.RoomID) AS NumOfRooms
FROM room
JOIN owner ON room.OwnerID = owner.OwnerID
WHERE room.City = 'Ha Noi'
GROUP BY owner.OwnerID
ORDER BY COUNT(room.RoomID) DESC
LIMIT 1;

SELECT o.*
FROM owner o
LEFT JOIN room r ON o.OwnerID = r.OwnerID
LEFT JOIN booking b ON r.RoomID = b.roomID
WHERE b.start_date IS NULL OR b.start_date < '2022-01-01'
GROUP BY o.OwnerID
HAVING COUNT(b.roomID) = 0;

SELECT r.RoomID, r.OwnerID, r.City, r.Price_per_day
FROM room r
JOIN booking b ON r.RoomID = b.roomID
JOIN customer c ON b.customerID = c.CustomerID
WHERE c.Gender = 'M'
GROUP BY r.RoomID, r.OwnerID, r.City, r.Price_per_day
HAVING COUNT(b.roomID) >=1;