<?php
$dsn= "mysql:host=localhost;dbname=attendance";// code mohm to connect to database, dbname hya qa3da elbyanat 
$user="root";
$pass="";
$option =array(
    PDO::MYSQL_ATTR_INIT_COMMAND=> "SET NAMES UTF8"// ARABIC

);
try{
    $con = new PDO($dsn, $user, $pass, $option);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    include "functions.php";
}catch(PDOException $e){

    echo $e->getMessage(); // ygibly el error
} 
 // KDA 3mlt connct to database w lw 3aiz a3ml qa3da byanat hghyr klma coursephp de ll file ele ana msmih

?>