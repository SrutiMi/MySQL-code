<?php
$servername = "localhost";
$username = "root";
$password = "";
// Create a database connection
$conn = new mysqli($servername, $username, $password);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$databaseName = "Doctor";
$createDatabase = "CREATE DATABASE IF NOT EXISTS $databaseName";

if ($conn->query($createDatabase) === TRUE) {
    echo "Database created successfully";
} else {
    echo "Error creating database: " . $conn->error;
}

// Switch to the created database
$conn->select_db($databaseName);

// Create the Doctor table
$createDoctorTable = "CREATE TABLE IF NOT EXISTS Doctor (
         DID INT PRIMARY KEY,
         Dname VARCHAR(50) NOT NULL,
         Specialist VARCHAR(50) CHECK (Specialist IN ('Medicine','surgery','child','cardiologist','oncologist'))
);";

$conn->query($createDoctorTable);

// Create the Patient table
$queryCreatePatientTable = "CREATE TABLE IF NOT EXISTS Patient (
        PID INT PRIMARY KEY,
        Pname VARCHAR(50) NOT NULL,
        sex VARCHAR(1) CHECK (sex IN ('M', 'F')),
        age INT,
        Phone VARCHAR(15)
    );
";

$conn->query($queryCreatePatientTable);

// Create the Treatment table
$queryCreateTreatmentTable = "CREATE TABLE IF NOT EXISTS Treatment (
        DID INT,
        PID INT,
        Tdate DATE,
        Diagnosis VARCHAR(100),
        PRIMARY KEY (DID, PID, Tdate),
        FOREIGN KEY (DID) REFERENCES Doctor(DID),
        FOREIGN KEY (PID) REFERENCES Patient(PID)
    );
";

$conn->query($queryCreateTreatmentTable);

// Insert data into the Doctor table
$queryInsertDoctorData = "INSERT INTO Doctor VALUES
    (1, 'Rajib Mehata', 'Medicine'),
    (2, 'John Doe', 'Surgery');
";
$conn->query($queryInsertDoctorData);

// Insert data into the Patient table
$queryInsertPatientData = "INSERT INTO Patient VALUES
    (1, 'Alice Smith', 'F', 35, '123-456-7890'),
    (2, 'Bob Johnson', 'M', 45, '987-654-3210');
";

$conn->query($queryInsertPatientData);

// Query (a): List the names of the oldest patient treated by Doctor Rajib Mehata
$findOldest = "SELECT Patient.Pname FROM Patient 
                JOIN Treatment ON Patient.PID = Treatment.PID 
                JOIN Doctor ON Treatment.DID = Doctor.DID 
                WHERE Patient.age = (SELECT MAX(age) FROM Patient) 
                AND Doctor.Dname='Rajib Mehata';";

$result = $conn->query($findOldest);
if ($result->num_rows > 0) {
    echo "<br>Query (a) Results:<br>";
    while ($row = $result->fetch_assoc()) {
        echo $row['Pname'] . "<br>";
    }
} else {
    echo "<br>No results for Query (a)";
}

// Query (b): List the names of specialist doctors in Medicine who have treated more than two patients on 10.01.2023.
$queryB = "SELECT D.Dname FROM Doctor D 
            JOIN Treatment T ON D.DID = T.DID 
            WHERE D.Specialist ='Medicine' 
            AND T.Tdate='2023-01-10' 
            GROUP BY D.DID 
            HAVING COUNT(T.PID) > 2";

$resultB = $conn->query($queryB);
if ($resultB->num_rows > 0) {
    echo "<br>Query (b) Results:<br>";
    while ($row = $resultB->fetch_assoc()) {
        echo $row['Dname'] . "<br>";
    }
} else {
    echo "<br>No results for Query (b)";
}

// Close the connection
$conn->close();
?>
