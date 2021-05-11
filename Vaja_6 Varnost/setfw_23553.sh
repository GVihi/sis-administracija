#Deny all incoming connections by default
sudo ufw default deny incoming

#Allow SSH and HTTPS
sudo ufw allow OpenSSH
sudo ufw allow https

#Allow all connections from 10.10.0.39
sudo ufw allow from 10.10.0.39

#Allow all connections from network 10.30.0.0/24
sudo ufw allow from 10.30.0.0/24

#Blocking IMCP echo request (ping)
sudo sed -i "s/-A ufw-before-input -p icmp --icmp-type echo-request -j ACCEPT/-A ufw-before-input -p icmp --icmp-type echo-request -j DROP/g" /etc/ufw/before.rules

#Applying changes
sudo ufw reload 
