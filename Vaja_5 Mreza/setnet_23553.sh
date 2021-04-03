if [[ $1 == "-urediIP" ]]
then
    ip=$2
    #Honestly no clue how to do this
    #Could do some sed regex magic, but
    #DNS would also get recognised
    #as IP
    #Same applies to -dodajDNS 

    #Will submit assignment as is
    #Still got 2 more out of 3 submits
    #Consultations Tuesday 6.4.
fi

if [[ $1 == "-dodajDNS" ]]
then
    dns=$2
    #cd /etc/netplan
    #echo "              - $dns"
    #string="              - $dns"
    #sudo bash -c 'echo $dns >> config.yaml'
fi

if [[ $1 == "-zaženi" ]]
then
    sudo netplan --debug generate
    sudo netplan apply
fi

if [[ $1 == "-ustvari" ]]
then
    cd /etc/netplan
    sudo touch config.yaml
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