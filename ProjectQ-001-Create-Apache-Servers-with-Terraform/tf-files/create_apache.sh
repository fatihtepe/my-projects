#! /bin/bash
sudo su
yum -y install httpd
echo "<p> Hello World </p>" >> /var/www/html/index.html
sudo systemctl enable httpd
sudo systemctl start httpd