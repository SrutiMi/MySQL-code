<!-- To change the phone no of customer having cid=C001 -->
<?php
$servername="localhost";
$username="root";
$password="";
$dbname="sales";

$conn =new mysqli($servername,$username,$password,$dbname);
if($conn->connect_error){
  die("Connection failed".$conn->connect_error);
}

$sql="UPDATE Customer SET phone='4567777890' WHERE C_id= 'C001'";
$result =$conn->query($sql);
if($result === TRUE){
  echo"Successfully updated";
}
else{
  echo "Error updating record".$conn->error;
}
$conn->close();

?>