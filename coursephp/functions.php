<?php
// ana b3ml function akhzn feha el htmlspecialchar fe kol 7aga 
function filterRequest($requestname)
{

    return htmlspecialchars(strip_tags($_POST[$requestname]));
}
?>