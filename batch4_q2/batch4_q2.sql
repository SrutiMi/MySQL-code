/* 
Create the following database in MySQL using SQL query : 
Student (Narne, Roll, Departnent, Address) 
Result (RegNo, Roll, marks, grade) [Grade : 'A', 'B, C, D'] 
Insert at least 5 meaningful records into each table using SQL statement so that each query gives result. 
Answer the following question using SQL query 
i) Display the name of all the students who have scored more marks than Ritam scored. 
(ii) Display name and address of all the students who study in the same department as Sreeja' study. 
Design a form using PHP that will accept Roll number of a student and on clicking on the submit button 
it will show the Grade and Marks of the student for a valid roll number, otherwise it will display suitable 
error message. To do this connect to the same database created above.
*/

CREATE DATABASE RESULT;
USE RESULT;

CREATE TABLE STUDENT(
  NAME VARCHAR(255),
  ROLL INT PRIMARY KEY,
  DEPARTMENT VARCHAR(255),
  ADDRESS VARCHAR(255)

);

CREATE TABLE RESULT(
  REGNO INT AUTO_INCREMENT PRIMARY KEY,
  ROLL INT,
  MARKS INT CHECK(MARKS >= 0 AND MARKS <= 100),
  GRADE CHAR(1) CHECK( GRADE IN ('A','B','C','D')),
  FOREIGN KEY (ROLL) REFERENCES STUDENT(ROLL) ON DELETE CASCADE
);


INSERT INTO Student VALUES ('John Doe', 101, 'Computer Science', '123 Main St');
INSERT INTO Student VALUES ('Alice Smith', 102, 'Mathematics', '456 Oak St');
INSERT INTO Student VALUES ('Bob Johnson', 103, 'Physics', '789 Pine St');
INSERT INTO Student VALUES ('Sreeja Kumar', 104, 'Computer Science', '321 Elm St');
INSERT INTO Student VALUES ('Ritam Sen', 105, 'Physics', '987 Birch St');

INSERT INTO Result (Roll, Marks, Grade) VALUES (101, 85, 'A');
INSERT INTO Result (Roll, Marks, Grade) VALUES (102, 72, 'B');
INSERT INTO Result (Roll, Marks, Grade) VALUES (103, 65, 'C');
INSERT INTO Result (Roll, Marks, Grade) VALUES (104, 90, 'A');
INSERT INTO Result (Roll, Marks, Grade) VALUES (105, 78, 'B');

-- i) Display the name of all the students who have scored more marks than Ritam scored. 
SELECT S.* , R.MARKS FROM STUDENT S JOIN RESULT R ON S.ROLL=R.ROLL WHERE S.ROLL != 105 AND R.MARKS > (SELECT MARKS FROM RESULT WHERE ROLL=105);

-- (ii) Display name and address of all the students who study in the same department as Sreeja' study. 
SELECT S.NAME,S.ADDRESS FROM STUDENT S JOIN RESULT R ON S.ROLL = R.ROLL WHERE S.ROLL!=104 AND S.DEPARTMENT=(SELECT DEPARTMENT FROM STUDENT WHERE NAME='SREEJA KUMAR');