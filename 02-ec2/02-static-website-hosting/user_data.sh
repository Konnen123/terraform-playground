#!/bin/bash

sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx

sudo apt-get install git -y
sudo git clone https://github.com/Konnen123/StefanDoaga.github.io.git
cp -r /StefanDoaga.github.io/* /var/www/html
