<?php 
$servername = "localhost";
$username="root";
$password="";
$dbname="ART_GALLERY";

$conn = new mysqli($servername,$username, $password, $dbname);

if($conn->connect_error){
  die("Connection failed".$conn->connect_error);
}

if($_SERVER[REQUEST_METHOD] == 'POST'){
  $A_name =$_POST['A_name'];
  $Age=$_POST['Age'];
  $Rank=$_POST['Rank'];

  $sql ="INSERT INTO Artists (A_name,Age,Rank) VALUES('$A_name','$Age',$Rank)";

  if($conn->query($sql)=== TRUE){
    echo "Record inserted Successfully";

    // Redirect to the form page after a brief delay
        header("refresh:2;url= batch1_q4.html");
  }else{
    echo "Error: ". $sql."<br>".$conn->error;
  }
}
$conn->close();

?>