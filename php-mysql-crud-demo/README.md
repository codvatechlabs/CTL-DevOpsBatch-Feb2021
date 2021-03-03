AWS RDS and EC2 Demo

Simple Create, Read, Update, Delete (CRUD) using PHP & MySQL
========


User data script for installaing xampp(PHS Web Server) while setting up EC2 

#!/bin/bash
yum update -y
yum install wget
wget https://www.apachefriends.org/xampp-files/7.0.23/xampp-linux-x64-7.0.23-0-installer.run
chmod +x xampp-linux-x64-7.0.23-0-installer.run
./xampp-linux-x64-7.0.23-0-installer.run
sudo /opt/lampp/lampp start



Restart lampp
sudo /opt/lampp/lampp restart

Download latest code from GITHub

wget https://github.com/codvatechlabs/CTL-DevOpsBatch-Feb2021/archive/main.zip 
unzip main.zip

copy php demo file to below path 
cp -r /source_files_directory /opt/lampp/htdocs

Update Config.php file with DB Credentails 

Restart lampp
sudo /opt/lampp/lampp restart


Browse PHP Web App from browser : 
http://public-ip


