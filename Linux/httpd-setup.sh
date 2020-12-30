#!/usr/bin/env bash
yum install httpd.x86_64
service httpd start
systemctl enable httpd
echo "Hello world" > /var/www/html/index.html