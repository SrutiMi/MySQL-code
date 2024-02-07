/*
2. Design a 'Stadiunm Booking System' that maintains the following database: 
stadium (sid, name, event, type, capacity, price) 
organiser (oid, org-name, type-of-org) 
booking (bid, sid, oid, date-of-booking) 
" Stadium name must start with 'A, D' and 'G. 
Create the above tables in MySQL with following and other integrity constraints : 
Now perform the following operations in MySQL : 
(a) Display details of all stadiums which have been booked by 'ABC group of Institution' between 
01/01/2022 to 15/03/2022 (eliminate duplicate tuples). 
(b) List all organizers who have booked the highest capacity stadiums at least once. 
Now perform the following operation using PHP : 
() Display all the records from table stadium in tabular format. 
(i) Delete the records from table "Stadium" whose price is greater than 10,000. 

 */

 CREATE DATABASE Stadium;
 USE Stadium;

 -- Creating stadium Table
 CREATE TABLE stadium(
     sid INT PRIMARY KEY AUTO_INCREMENT ,
     name VARCHAR(50) CHECK( name LIKE 'A%' OR name LIKE 'D%' OR name LIKE 'G%'),
     event VARCHAR(50),
     type VARCHAR(50),
     capacity INT,
     price DECIMAL(11,3)

 );

-- Creating organiser table 
CREATE TABLE organiser(
    oid INT  PRIMARY KEY AUTO_INCREMENT,
    org_name VARCHAR(50),
    type_of_org VARCHAR(50)
);

-- Creating booking table
CREATE TABLE booking(
    bid INT PRIMARY KEY AUTO_INCREMENT,
    sid INT,
    oid INT,
    date_of_booking DATE,
    FOREIGN KEY(sid) REFERENCES stadium(sid) ON DELETE CASCADE,
    FOREIGN KEY(oid) REFERENCES organiser(oid) ON DELETE CASCADE
);

-- Inserting values into the stadium table
INSERT INTO stadium (name, event, type, capacity, price)
VALUES
('A Stadium', 'Football', 'Outdoor', 50000, 10000.00),
('D Arena', 'Concert', 'Indoor', 30000, 15000.00),
('G Field', 'Cricket', 'Outdoor', 45000, 8000.00);

-- Inserting values into the organiser table
INSERT INTO organiser (org_name, type_of_org)
VALUES
('ABC Group of Institution', 'Education'),
('XYZ Events', 'Event Management');

-- Inserting values into the booking table
INSERT INTO booking (sid, oid, date_of_booking)
VALUES
(1, 1, '2022-01-10'),
(2, 1, '2022-02-20'),
(3, 2, '2022-03-05');

-- Inserting more values into the stadium table
INSERT INTO stadium (name, event, type, capacity, price)
VALUES
('A Arena', 'Basketball', 'Indoor', 25000, 12000.00),
('D Stadium', 'Soccer', 'Outdoor', 40000, 9000.00),
('G Ground', 'Baseball', 'Outdoor', 35000, 11000.00);

-- Inserting more values into the organiser table
INSERT INTO organiser (org_name, type_of_org)
VALUES
('DEF Sports Club', 'Sports Association'),
('LMN Productions', 'Event Management');

-- Inserting more values into the booking table
INSERT INTO booking (sid, oid, date_of_booking)
VALUES
(4, 3, '2022-01-15'),
(5, 4, '2022-02-25'),
(6, 4, '2022-03-10');

-- (a) Display details of all stadiums which have been booked by 'ABC group of Institution' between 01/01/2022 to 15/03/2022 (eliminate duplicate tuples). 
SELECT DISTINCT stadium.* FROM  stadium JOIN booking ON stadium.sid = booking.sid JOIN organiser ON organiser.oid = booking.oid WHERE organiser.org_name = "ABC group of Institution" AND  booking.date_of_booking BETWEEN '2022-01-01' AND '2022-03-15';

-- (b) List all organizers who have booked the highest capacity stadiums at least once.
SELECT organiser.* FROM organiser JOIN booking ON organiser.oid= booking.oid JOIN stadium ON stadium.sid = booking.sid WHERE stadium.capacity =(SELECT MAX(capacity) FROM stadium);