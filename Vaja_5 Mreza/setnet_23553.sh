#If statements checking for flags

if [[ $1 == "-urediIP" ]]
then
    ip=$2
    oldip=$(grep -oE "[0-9]+[.][0-9]+[.][0-9]+[.][0-9]+/[0-9]+" /etc/netplan/config.yaml) #Stored previous ip with mask into variable
    echo "old IP: $oldip"
    echo "new IP: $ip"

    sudo sed -i "s@$oldip@$ip@g" /etc/netplan/config.yaml #Replaces old IP with new IP
fi

if [[ $1 == "-dodajDNS" ]]
then
    dns=$2
    cd /etc/netplan
    echo "              - $dns"
    string="              - ${dns}"
    sudo bash -c "echo $string >> config.yaml" #Echo DNS into config.yaml file with sudo privileges
    #Spaces don't seem to get printed into the file no matter what I do :sad_face:
fi

if [[ $1 == "-zaženi" ]]
then
    sudo netplan --debug generate #Generates configuration from config.yaml file
    sudo netplan apply #Applies changes
fi

if [[ $1 == "-ustvari" ]]
then
    cd /etc/netplan
    sudo touch config.yaml #Creates new config file
    #Prints required network configuration into config.yaml file. Source: https://askubuntu.com/questions/1064921/scripting-netplan-for-static-ip-address
    sudo bash -c 'cat > config.yaml <<EOF 
    network:
      version: 2
      renderer: networkd
      ethernets:
        enp2s0:
          addresses:
            - 10.0.10.37/27
          nameservers:
            addresses:
              - 9.9.9.9
EOF'
fi
