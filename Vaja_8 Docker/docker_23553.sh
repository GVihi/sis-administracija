#!/bin/bash
sudo docker build . -t webapp_docker #Build image
sudo docker run -ti -d --name webapp -v "/home/gasper/Desktop/Naloge/Sistemska Administracija/Vaja_8 Docker/website:/var/www/html" webapp_docker #Run docker and attach "website" directory from host to /var/www/website in docker and -d to detach
sudo docker exec -ti webapp /etc/init.d/lighttpd start #Starts lighttpd service
