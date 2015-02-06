Authors

Chris Vaughan 
Matt Hausmann 

Installation Instructions

Notes: You must have RedHat Network Credentials to setup the base requirements to correctly setup this demonstration.  You will also need to be able to access the environment from an external URL.  

tar -xvzf clm_qr_v1.3.tar.gz
cd clm_qr
sh sdk_install.sh rhel_user@bmc.com rhel_password
sh setup.sh http://externalurl.com 9080 CustomerOrUser

If you don’t put a customer or user name it will install to /var/www/html if you do it will create individual directories under html such as below.

[root@clm-pm clm_qr]# ls /var/www/html/
CustomerOne   CustomerTwo        images     js           phpqrcode       service_req.php
CustomerFour    css    favicon.ico  index.php  CustomerThree  serv_array.txt  services.php

If things go wrong

Apache Logs
/var/log/httpd/access_log
/var/log/httpd/error_log
Request Logs
/tmp/qr_clm.log
SDK Log
/var/www/csmsdk/log/csmsdk.log
