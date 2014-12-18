How the integration with the API works.

A user can provision a CLM Service by scanning a QR code from a website or menu.  Once the user has scanned the QR code it will re-direct them to serv_prov.php?=[CLM_Service] the output will be written to service.php and the file will contain service=[CLM_Service].  On the CLM PM a script named clm-qr.sh will be poling for the contents of service.php.  Once it finds that there is a new value through using curl it will then select one of the case statements that matches the corrosponding service.  This will then call the clm-qr_apicall.sh and provision a new service.

Pre requisites

Install CLM SDK on CLM Platform Manager
Instructions: https://communities.bmc.com/docs/DOC-30711  
*Suggest using sdk_install.gz to perform installation

Instructions to setup integration

1. Install CLM SDK on CLM Platform Manager

2. Copy bin directory to folder on CLM Platform Manager

Check clm-qr_apicall.sh and ensure proper credentials are in place.

Edit clm-qr.sh and edit site url and delete url to point to externally hosted website. Edit services to match what are in CLM service catalog.  You can use the sdk to get a list of these offerings.

3. Setup public webserver integration.

On a webserver with a static IP or domain name copy the contents of www to a webdirectory that supports php.  Use a QR code generator that will generate redirect urls to http://externalWebsite/serv_prov.php?service=[CLM_Service].  Swap these images for the qr*.png in the img folder.  You can find a free online QR generator here http://www.qrstuff.com/

4. Test the app

The flow should be

user scans qr code "Rhel 6" -> redirects to http://externalWebsite/serv_prov.php?=rhel6 -> clm-qr.sh is polling http://externalWebsite/service.php -> it then calls the rhel6 case statement and executes clm-qr_apicall.sh "CLM Service" <description name> to provision a server. -> You should see services being provisioned within CLM now. 


 

Next copy the bin directory to a server that can run CLM.
