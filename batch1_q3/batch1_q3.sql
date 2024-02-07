/*Design a Sales Tracking System with the following database.
Item (I_no, I_name, type, price, colour)
Customer (C_id, cname, phone, city)
Sales (sales-id, I_no, C_id, Sales_date)
Create the above tables in MySQL with following and other integrity constraints:
   I_no must be set to value 100 and it will be autoincremented by 1.

Now perform the following operation in MySQL:
(a) Display name of each customer and total price of all items purchased by him/her.
(b) Display all customers from Kolkata and Bardhaman who have purchased an electric kettle in SEP, 23

Now perform the following operations using PHP: 
(i) Change the phone no. of customer having C_id = C001
 (ii) Display the output of above query no. (b) through PHP script

*/

CREATE DATABASE SALES;
USE SALES;

-- Creating Item table
CREATE TABLE Item(
   I_no INT PRIMARY KEY AUTO_INCREMENT,
   I_name VARCHAR(20),
   type VARCHAR(20),
   price DECIMAL(10,2),
   colour VARCHAR(20)

);
ALTER TABLE Item AUTO_INCREMENT=100;

--Creating table Customer
CREATE TABLE Customer(
    C_id VARCHAR(20) PRIMARY KEY,
    cname VARCHAR(30),
    phone VARCHAR(20) CHECK (LENGTH(phone) = 10),
    city VARCHAR(20)
);

-- Creating Sales Table
CREATE TABLE Sales(
  sales_id INT PRIMARY KEY,
  I_no INT,
  C_id VARCHAR(20),
  Sales_date VARCHAR(20),
  FOREIGN KEY (I_no) REFERENCES Item(I_no) ON DELETE CASCADE,
  FOREIGN KEY (C_id) REFERENCES Customer(C_id) ON DELETE CASCADE

);

-- Inserting values into Item table
INSERT INTO Item (I_name, type, price, colour) VALUES
('Laptop', 'Electronics', 1200.00, 'Silver'),
('Smartphone', 'Electronics', 800.00, 'Black'),
('Bookshelf', 'Furniture', 250.00, 'Brown'),
('Coffee Maker', 'Appliance', 50.00, 'White'),
('Running Shoes', 'Apparel', 80.00, 'Blue'),
('Desk Chair', 'Furniture', 150.00, 'Black'),
('Electric Kettle', 'Appliance', 30.00, 'White');


-- Insert into Customer table
INSERT INTO Customer (C_id, Cname, phone, city) VALUES
('C001', 'Amit Patel', '1234567890', 'Mumbai'),
('C002', 'Priya Gupta', '9876543210', 'Delhi'),
('C003', 'Rahul Sharma', '5551234567', 'Bangalore'),
('C004', 'Neha Singh', '7778889999', 'Chennai'),
('C005', 'Aarav Verma', '1112223333', 'Kolkata'),
('C006', 'Ananya Reddy', '4445556666', 'Hyderabad'),
('C007', 'Siddharth Das', '9998887777', 'Bardhaman');

-- Insert into Sales
INSERT INTO Sales VALUES
(1, 100, 'C001', '2023-09-01'),
(2, 101, 'C002', '2023-09-01'),
(3, 102, 'C003', '2023-09-01'),
(4, 103, 'C004', '2023-09-01'),
(5, 104, 'C005', '2023-09-01'),
(6, 105, 'C006', '2023-09-01'),
(7, 106, 'C007', '2023-09-01');

-- (a) Display name of each customer and total price of all items purchased by him/her.
SELECT Customer.* , SUM(Item.price) FROM Customer JOIN sales ON Customer.C_id = Sales.C_id JOIN Item ON Item.I_no = Sales.I_no GROUP BY Customer.C_id;

--(b) Display all customers from Kolkata and Bardhaman who have purchased an electric kettle in SEP, 23
SELECT Customer.*  FROM Customer JOIN Sales ON Customer.C_id = Sales.C_id JOIN Item ON Item.I_no = Sales.I_no WHERE Customer.city ='Kolkata' OR Customer.city= 'Bardhaman' AND Item.I_name="Electric Kettle" AND sales.sales_date LIKE "2023-09-__";




-- 



