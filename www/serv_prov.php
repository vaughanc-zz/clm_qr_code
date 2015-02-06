<?php

## serv_prov.php?service=service_name

$service=$_GET[service];

$file = fopen("service.php","w");

echo fwrite($file,"service=$service");

fclose($file);

print("<h1>Starting provisioning of Simple Red Hat Linux 6 Server..</h1>");

?>

