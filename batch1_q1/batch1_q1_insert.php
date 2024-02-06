
<?php 
// Inserting  a record in the table "Cab" through PHP
  $servername= "localhost";
  $username ="root";
  $password ="";
  $dbname="Cab";

  $conn = new mysqli($servername,$username,$password,$dbname);

  if($conn->connect_error){
    die("Connect failed:" .$conn->connect_error);
  }

  $cno =102;
  $model = "NewModel";
  $color ="Blue";
  $purchase_date="2024-02-06";

  $sql ="INSERT INTO Cab(model,color,purchase_date) VALUES('$model','$color','$purchase_date')";

  if($conn->query($sql) === TRUE){
    echo "Record inserted successfully";
  }else{
    echo "Error: ".$sql."<br>".$conn->error;
  }

  $conn->close();
 
?>