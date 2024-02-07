 
<?php 
/*if($_SERVER["REQUEST_METHOD"] == "POST"){
     $Roll=$_POST['roll'];

     $servername="localhost";
     $username="root";
     $password="";
     $dbname="RESULT";
     
     $conn= new mysqli($servername,$username,$password,$dbname);

     if($conn->connect_error){
          die("Connection failed: " . $conn->connect_error);
     }
     $sql="SELECT R.MARKS , R.GRADE FROM STUDENT S JOIN RESULT R ON S.ROLL =R.ROLL WHERE R.ROLL= $Roll";
     $result=$conn->query($sql);
     if($result->num_rows >0){
         $rows=$result->fetch_assoc();
         echo "Roll Number :$Roll<br>";
         echo "Marks: ".$rows["MARKS"]."<br>";
          echo "Grade: ".$rows["GRADE"]."<br>";
     }else{
          echo "0 results";
     }

}
*/

// other method of doing so
$servername="localhost";
$username="root";
$password="";
$dbname="RESULT";

$conn= new mysqli($servername,$username,$password,$dbname);
if($conn->connect_error){
     die("Connection failed: " . $conn->connect_error);
}
if($_SERVER["REQUEST_METHOD"]=="POST"){
  $Roll = isset($_POST["roll"])?intval($_POST["roll"]):0;

  if($Roll>0){
    $sql="SELECT Marks, Grade FROM Result WHERE Roll = $rollNumber";

    $result =$conn->query($sql);
    if($result->num_rows>0){
      $row=$result->fetch_assoc();
      echo "Roll Number: $Roll<br>";
      echo "Marks: ".$row["Marks"]."<br>";
      echo "Grade: ".$row["Grade"]."<br>";
    }else{
      echo "No records";
    }
  }else{
    echo"please provide a valid rollno";
  }
}
?> 
