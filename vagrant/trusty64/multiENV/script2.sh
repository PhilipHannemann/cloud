#!/usr/bin/env bash


sudo apt-get update -y
sudo apt-get install -y mysql-server
sudo apt-get install -y apache2

echo '<html><body>Das ist meine 2. VM</b></body></html>' > /var/www/html/index.html

sudo ufw allow mysql
systemctl start mysql

