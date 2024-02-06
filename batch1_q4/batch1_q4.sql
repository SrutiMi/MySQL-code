/*
Design an ‘Art Gallery System’ with the following database:
Gallery(G_id, G_name,Capacity,City)
                                    Artists(A_id,A_name,Age,Rank)
                                    Reserved(G_id,A_id,Date_reserve)
Create the above tables in MySQL with the following and other integrity constraints:
      Default value or the field capacity in ‘Gallery’ table 500.

Now perform the following operation using PHP:
    Design form to insert the record in the ‘Artists’ table and insert the record in the table Artists through the form.

Now perform the following operations in MySQL:
   a)Display the details of all galleries in which ‘S. Sengupta ‘ has made reservations between 01/01/2022 to 28/04/2022.
  b)List all the artists who have reserved the highest capacity at least once.

*/

CREATE DATABASE ART_GALLERY;
USE ART_GALLERY;

-- Creating the Gallery Table
CREATE TABLE Gallery(
    G_id INT PRIMARY KEY AUTO_INCREMENT,
    G_name VARCHAR(255),
    Capacity INT DEFAULT 500,
    City VARCHAR(255)
);

-- Creating Artists Table
CREATE TABLE Artists(
    A_id INT PRIMARY KEY AUTO_INCREMENT,
    A_name VARCHAR(255),
    Age INT,
    Rank INT
);

-- Creating Reserved Table
CREATE TABLE Reserved(
    G_id INT,
    A_id INT,
    Date_reserve DATE,
    PRIMARY KEY(G_id, A_id),
    FOREIGN KEY (G_id) REFERENCES Gallery(G_id),
    FOREIGN KEY (A_id) REFERENCES Artists(A_id)
);

-- Inserting values into gallery 
INSERT INTO Gallery (G_id, G_name, Capacity, City) VALUES
(1, 'National Gallery of Modern Art', 1000, 'New Delhi'),
(2, 'Indian Museum', 500, 'Kolkata'),
(3, 'Salar Jung Museum', 600, 'Hyderabad');

-- The values of artist are inserted using the form
INSERT INTO Reserved (G_id, A_id, Date_reserve) VALUES
(1, 1, '2022-01-15'),
(2, 2, '2022-02-20'),
(3, 5, '2022-03-25'),
(1, 2, '2022-01-20'),
(2, 1, '2022-02-25');

-- Displaying the details of all galleries in which ‘S. Sengupta ‘ has made reservations between 01/01/2022 to 28/04/2022.
SELECT Gallery.* from Gallery 
JOIN Reserved ON Gallery.G_id = Reserved.G_id 
JOIN Artists ON Reserved.A_id = Artists.A_id 
WHERE Artists.A_name= "S. Sengupta" AND Reserved.Date_reserve BETWEEN 2022-01-01 AND 2022-04-28;

-- List all the artists who have reserved the highest capacity at least once.

SELECT Artists.A_name from Gallery 
JOIN Reserved ON Gallery.G_id = Reserved.G_id 
JOIN Artists ON Reserved.A_id = Artists.A_id
WHERE Gallery.Capacity = (SELECT MAX(Capacity) FROM Gallery);


