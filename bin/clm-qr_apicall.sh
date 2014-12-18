#!/bin/sh

CLM_URL="http://clm-pm:7070/csm"
CLM_USER="CloudAdmin"
CLM_PASSWORD="password"

SERVICE_NAME="$1"

SERVICE_OPTION="TRO_CPU"
SERVICE_OPTION_CHOICE="TRO_5CPU"


SERVER_NAME="$2"

echo "Logging to $CLM_URL using $CLM_USER..."
clm login --url "$CLM_URL" --user "$CLM_USER" --password "$CLM_PASSWORD"

echo "Provisioning Service $SERVICE_NAME with server name $SERVER_NAME..."
clm service-create --offeringname "$SERVICE_NAME" --servicename "$SERVER_NAME" --serverusername "matt" --serverpassword "Passw0rd1!" --serverhostprefix "$SERVER_NAME" --tenantname "CLM Provider"

#echo "Stopping service $SERVICE_NAME..."
#clm service-stop --servicename "$SERVICE_NAME"

#echo "Applying day 2 option $SERVICE_OPTION=$SERVICE_OPTION_CHOICE to service $SERVICE_NAME..."
#clm service-update-option --servicename "$SERVICE_NAME" --servername "$SERVER_NAME" --optionname "$SERVICE_OPTION" --optionchoicename "$SERVICE_OPTION_CHOICE"

#echo "Starting service $SERVICE_NAME..."
#clm service-start --servicename "$SERVICE_NAME"
