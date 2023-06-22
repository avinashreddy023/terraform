#!/bin/bash
yum update -y
yum install httpd* -y
systemctl start httpd
syatemctl enable httpd
echo "Hello" > /var/www/html/index.html


