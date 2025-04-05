#!/bin/bash

sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx

sudo apt-get install docker.io -y
sudo docker image pull stefandoaga70/quote-of-the-day:latest
sudo docker run -d -p 8080:8080 stefandoaga70/quote-of-the-day:latest

sudo bash -c 'cat <<EOF > /etc/nginx/sites-available/default
server {
        listen 80;
        listen [::]:80;

        root /var/www/html;

        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                try_files $uri $uri/ =404;
        }

		location /api/ {
                proxy_pass http://localhost:8080;
                proxy_set_header Host \$host;
                proxy_set_header X-Real-IP \$remote_addr;
                proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto \$scheme;
        }
}
EOF'

sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
sudo systemctl restart nginx
