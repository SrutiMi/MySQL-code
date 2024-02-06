/* 
 Create the following database table in MySQL using SQL query : Player (PCode, Name, Age, MatchPlayed, RunScored, WicketTaken, Country) Insert at least 10 meaningful records into the table using SQL statement so that each query gives result. Answer the following question using SQL query : 
i) Display name and Age of all the senior players of Virat Kohli. 
(ii) Display country nanme and total number of cricketers from that country. 
Design a form using PHP that will accept Player Code (PCode) of a player and on clicking on the submit button it will show the Name and Country of the player for a valid player code, otherwise it will display suitable error message. To do this connect to the same database created above.

*/

-- Creating the database

CREATE DATABASE IF NOT EXISTS CRICKET;

USE CRICKET;

-- Create player Table
CREATE TABLE Player(
  PCode INT PRIMARY KEY,  
  Name VARCHAR(255),
  Age INT,
  MatchPlayed INT,
  RunScored INT,
  WicketTaken INT,
  Country VARCHAR(50)
);

-- Inserting the values
INSERT INTO Player VALUES(1,'Virat Kohli',32,250,12000,5,'india');
INSERT INTO Player VALUES(2, 'Steve Smith', 32, 220, 11000, 2, 'Australia');
INSERT INTO Player VALUES(3, 'Kane Williamson', 30, 200, 10000, 0, 'New Zealand');
INSERT INTO Player VALUES(4, 'Joe Root', 30, 200, 10000, 0, 'England');
INSERT INTO Player VALUES(5, 'Rohit Sharma', 33, 200, 10000, 0, 'India');
INSERT INTO Player VALUES(6, 'Babar Azam', 27, 150, 8000, 0, 'Pakistan');
INSERT INTO Player VALUES(7, 'David Warner', 34, 200, 11000, 0, 'Australia');
INSERT INTO Player VALUES(8, 'Quinton de Kock', 28, 150, 7000, 0, 'South Africa');
INSERT INTO Player VALUES(9, 'Kusal Perera', 30, 100, 5000, 0, 'Sri Lanka');
INSERT INTO Player VALUES(10, 'Shakib Al Hasan', 34, 200, 8000, 200, 'Bangladesh');

-- i) Display name and Age of all the senior players of Virat Kohli.
SELECT Name ,Age from Player where Age>(SELECT Age FROM Player WHERE NAME ='Virat Kohli');

-- ii) Display country name and total number of cricketers from that country
SELECT Country, COUNT(*) FROM Player GROUP BY Country;