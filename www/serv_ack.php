<?php

## serv_ack.php?service=delete

$delete=$_GET[delete];

$file = fopen("service.php","w");

echo fwrite($file,"");

fclose($file);

?>

