#!/bin/bash

site="http://54.76.107.44/service.php"
delete="http://54.76.107.44/serv_ack.php?service=delete"

while true; do

service=`curl -s $site | awk -F"=" '{print $2}'`

case "$service" in
    rhel6)
        echo "Running Service Provisioning for Service: $service"
        sh /root/clm-qr_apicall.sh "AWS RedHat 5.8" myrhbox
        echo "Provisoning Started!"
        curl $delete

        ;;
     apache)
        echo "Running Service Provisioning for Service: $service"
        echo "Where you put in the CLM api calls."
        ;;

     null)
        echo "Waiting for service request..."
        ;;
esac

sleep 5

done
