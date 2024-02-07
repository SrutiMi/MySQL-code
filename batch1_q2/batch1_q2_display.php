<?php
$servername="localhost";
$username="root";
$password ="";
$dbname ="Stadium";

$conn = new mysqli($servername,$username,$password,$dbname);

if($conn->connect_error){
  die("Connection faled". $conn->connect_error);
}

$sql ="SELECT * FROM Stadium";
$result = $conn->query($sql);
echo "<table border ='1'><tr><th>SID</th><th>Name</th><th>Event</th><th>Capacity</th><th>Capacity</th><th>Price</th></tr>";
if($result->num_rows>0){
  while($rows=$result->fetch_assoc()){
    echo"<tr><td>{$rows['sid']}</td><td>{$rows['name']}</td><td>{$rows['event']}</td><td>{$rows['type']}</td><td>{$rows['capacity']}</td><td>{$rows['price']}</td></tr>";
  }
}
echo "</table>";
$conn->close();



?>