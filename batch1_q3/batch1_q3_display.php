<!-- Display the output of above query no. (b) through PHP script -->

<?php 
$servername="localhost";
$username="root";
$password="";
$dbname="sales";

$conn =new mysqli($servername,$username,$password,$dbname);
if($conn->connect_error){
  die("Connection failed".$conn->connect_error);
}

$sql= "SELECT Customer.*  FROM Customer JOIN Sales ON Customer.C_id = Sales.C_id JOIN Item ON Item.I_no = Sales.I_no WHERE Customer.city ='Kolkata' OR Customer.city= 'Bardhaman' AND Item.I_name='Electric Kettle' AND sales.sales_date LIKE '2023-09-__'";

$result =$conn->query($sql);
echo"<table border =1><tr><th>C_id</th><th>Cname</th><th>phone</th><th>City</th></tr>";
if($result->num_rows>0){
  while($rows=$result->fetch_assoc()){
    echo"<tr><td>{$rows['C_id']}</td><td>{$rows['cname']}</td><td>{$rows['phone']}</td><td>{$rows['city']}</td></tr>";
  }
}

echo"</table>";
$conn->close();

?>