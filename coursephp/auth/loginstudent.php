<?php
include "../connect.php";
// fe file el connect ana 3mlt gwah include l file elfunction 3shan astkhdmha 3latol
// sf7a el signup b3ml add ll database
// hena b7my el request bta3y mn el hack
$ID =filterRequest("ID");
$Password= filterRequest("Password");
// 3shan a7l mwdo3 el securiy b3ml el htmlspecialchars()
//htmlspecialchars(strip_tags())// edafa tags l kol code bysbb mshakl 

$stmt = $con->prepare("SELECT *FROM users WHERE `Password` =? AND ID = ? ");
$stmt->execute(array($Password,$ID));
$count = $stmt->rowCount();

if($count>0)// y3ny lw elshkhs etdaf b nga7
{
    echo json_encode(array("status"=>"success"));
    
}
else
{
    echo json_encode(array("status"=>"fail"));
}
?>