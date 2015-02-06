#!/bin/sh
if [ $# -eq 0 ]
  then
    echo "You need to supply the publically accessible url"
    echo "USAGE: sh setup.sh http://www.external_url.com <PORT> <User/Customer Name>"
    exit 0
fi

tar xvzf www.tar.gz
mkdir /var/www/html/$3
cp -R www/* /var/www/html/$3 
rm /var/www/html/$3/serv_array.txt
rm /var/www/html/$3/services.php
rm -rf /var/www/html/phpqrcode
rm -rf /var/www/html/$3/images
mkdir /var/www/html/$3/images

unzip phpqrcode.zip -d /var/www/html/

CLM_URL="http://clm-pm:7070/csm"
CLM_USER="CloudAdmin"
CLM_PASSWORD="password"

EXTERNAL_URL="$1"

echo "Logging to $CLM_URL using $CLM_USER..."
clm login --url "$CLM_URL" --user "$CLM_USER" --password "$CLM_PASSWORD"

OFFERINGS=`clm offering-list | awk -F"," '{print $1}'|sed -e '1,3d'|tr \\\n \,`

export IFS=","

id=0;

echo "<h1>Welcome $3</h1><br>" >> /var/www/html/$3/services.php

for service in $OFFERINGS; do

echo "<?php
include('/var/www/html/phpqrcode/qrlib.php'); 
     
// outputs image directly into browser, as PNG stream 
QRcode::png('$EXTERNAL_URL/service_req.php?id=$id');

?>" > /var/www/html/$3/images/$id.php

#>> /var/www/html/services.php

echo "$service" >> /var/www/html/$3/serv_array.txt


echo "
<section>
<h1>$service</h1>
<a href='$EXTERNAL_URL/$3/service_req.php?id=$id'>
<img src='images/$id.php' height=150 width=150>
</a></section>
" >> /var/www/html/$3/services.php

	id=$((id+1))
done

chown -R apache:apache /var/www
chmod 777 /usr/local/bin/clm

echo "Configuring Apache"

PORT="$2"

sed  s/Listen\ 80/Listen\ $PORT/g /etc/httpd/conf/httpd.conf > /tmp/httpd.conf
mv /tmp/httpd.conf /etc/httpd/conf/httpd.conf

#service httpd restart

netstat -nap | grep 9080

echo "Website Installed: Please Check For Errors";
echo "Go to $EXTERNAL_URL to test";
