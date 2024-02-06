/* Design a Cab allotment System" that maintains the following database : 
Cab (cno, model, color, purchase-date)
driver (did, dname, phone, rating, age).
alloted-in (cno, did, datel)
[Rating should be between 0 and 5]
 Create all the above tables, in MySQL with all integrity constraints properly and perform the following operations
 (a) Find the average age of all drivers who have driven Andi AS. 
(b) Display the details of all cabs which have been driven by the driver with the highest rating in Jan 2021
Now perform the following operations using PHP : 
(i) Insert a record in the table "Cab" through PHP. 
(ii) Display all the records of table "Cab" through PHP.
*/

CREATE DATABASE CAB;

USE CAB;

-- Creating Cab table
CREATE TABLE CAB(
  cno INT PRIMARY KEY,
  model VARCHAR(255),
  color VARCHAR(10),
  purchase_date DATE
);

-- Creating driver table
CREATE TABLE driver(
  did INT PRIMARY KEY,
  dname VARCHAR(25),
  phone VARCHAR(10) CHECK (LENGTH(phone)=10),
  rating DECIMAL(3,2) CHECK (rating>=0 AND rating<=5),
  age INT
);


-- Creating alloted-in
CREATE TABLE alloted_in(
  cno INT,
  did INT,
  date1 DATE,
  PRIMARY KEY(cno,date1),
  FOREIGN KEY (cno) REFERENCES Cab(cno),
  FOREIGN KEY (did) REFERENCES driver(did)
);

-- Inserting values into Cab

INSERT INTO Cab (cno,model,color,purchase_date) VALUES
(1,'Audi','Black','2022-01-01'),
(2,'BMW','White','2020-05-01'),
(3,'Mercedes','Red','2021-09-01'),
(4,'Audi','Black','2020-01-10'),
(5,'BMW','White','2022-01-07'),
(6,'Mercedes','Red','2020-01-01'),
(7,'Andi AS','Black','2019-02-01');

-- Inserting values into driver

INSERT INTO driver(did,dname,phone,rating,age) VALUES 
(101, 'John Doe', '1234567890', 4.5, 30),
(102, 'Jane Smith', '9876543210', 4.8, 28),
(103, 'Bob Johnson', '5558889999', 3.9, 35),
(104, 'Alice Brown', '7771234567', 4.2, 32);

-- Inserting values into alloted-in table

INSERT INTO alloted_in (cno,did,date1) VALUES
(1,101,'2022-01-01'),
(2,102,'2020-05-01'),
(3,103,'2021-09-01'),
(4,104,'2020-01-10'),
(5,101,'2022-01-07'),
(6,102,'2020-01-01'),
(7,103,'2019-02-01');

-- Finding the average age of all drivers who have driven Andi AS

SELECT AVG(Driver.age) FROM driver JOIN alloted_in ON driver.did = alloted_in.did JOIN  Cab ON alloted_in.cno = Cab.cno WHERE Cab.model = 'ANDI AS';

--  Display the details of all cabs which have been driven by the driver with the highest rating in Jan 2021
SELECT Cab.* FROM Cab JOIN alloted_in ON alloted_in.cno= Cab.cno 
JOIN driver ON alloted_in.did=driver.did
WHERE driver.rating= (SELECT MAX(rating) FROM driver)
AND alloted_in.date1 BETWEEN '2021-01-01' AND '2021-01-31';



    