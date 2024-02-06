<?php 
// Display all the records of table "Cab" through PHP:

$servername="localhost";
$username="root";
$password="";
$dbname ="Cab";

$conn = new mysqli($servername,$username,$password,$dbname);

if($conn->connect_error){
  die("Connection failed : ".$conn->connect_error);
}

$sql ="SELECT * FROM Cab";
$result =$conn->query($sql);

if($result->num_rows>0){
  while($row = $result->fetch_assoc()){
    echo "Cno :".$row["cno"]." -Model :" .$row["model"]. " -Color : ".$row["color"]." -Purchase Date : ".$row["purchase_date"]."<br>";
  }
}else{
  echo "0 results";
}
$conn->close();


?>