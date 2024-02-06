<!DOCTYPE html>
<html>
<head>
    <title>Player Details</title>
</head>
<body>

<?php
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve and sanitize playerCode
    $playerCode = isset($_POST["playerCode"]) ? intval($_POST["playerCode"]) : 0;

    // Check if playerCode is provided
    if ($playerCode > 0) {
        // Database connection parameters
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "cricket";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // Query to fetch player details
        $sql = "SELECT Name, Country FROM Player WHERE PCode = $playerCode";
        $result = $conn->query($sql);

        // Check if the player is found
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            echo "Player Name: " . $row["Name"] . "<br>Country: " . $row["Country"];
        } else {
            echo "Player not found!";
        }

        // Close the database connection
        $conn->close();
    } else {
        echo "Please provide a valid Player Code!";
    }
}
?>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    Player Code: <input type="text" name="playerCode">
    <input type="submit" value="Submit">
</form>

</body>
</html>
