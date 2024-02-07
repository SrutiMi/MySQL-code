<?php
$servername="localhost";
$username="root";
$password ="";
$dbname ="Stadium";

$conn = new mysqli($servername,$username,$password,$dbname);

if($conn->connect_error){
  die("Connection failed:".$conn->connect_error);
}

$sql="DELETE FROM Stadium WHERE price>10000";
$result =$conn->query($sql);
if($result=== TRUE){
  echo "Record deleted successfully";
}else{
  echo "Error deleting record:".$conn->error;
}
$conn->close();
?>