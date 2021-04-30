#!/bin/bash
cd /tmp
mkdir pomembni_projekti
cd pomembni_projekti

umask 017   #Source: https://www.cyberciti.biz/tips/understanding-linux-unix-umask-value-usage.html?fbclid=IwAR28ujVqmx489y_eQkMcgSblgWis8Peig6VgS-eSOa3GZwM5xPmWqBLP6WU
            #First bit (0): Owner, rwx
            #Second bit (1): Group, rw
            #Third bit (7): Others: no perms

mkdir projektA projektB projektC testi

#Changing dir group
sudo chgrp progskupina_23553 projektA/
sudo chgrp progskupina_23553 projektB/
sudo chgrp progskupina_23553 projektC/
sudo chgrp progskupina_23553 testi/

#Revoke all permissions from projektA
chmod go=-rwx projektA/
#Set correct permissions to projektA
setfacl -m u:ps1:rw projektA/
setfacl -m u:ps2:rw projektA/
setfacl -m u:ps5:r projektA/

#Revoke all permissions from projektB
chmod go=-rwx projektB/
#Set correct permissions to projektB
setfacl -m u:ps2:r projektB/
setfacl -m u:ps3:rw projektB/
setfacl -m u:ps4:rw projektB/
setfacl -m u:ps5:r projektB/

#Revoke all permissions from projektC
chmod go=-rwx projektC/
#Set correct permissions to projektC
setfacl -m u:ps5:r projektC/

#Revoke all permissions from testi
chmod go=-rwx testi/
#Set correct permissions to testi
setfacl -m u:ps1:rw testi/
setfacl -m u:ps2:rw testi/
setfacl -m u:ps3:rw testi/
setfacl -m u:ps4:rw testi/
setfacl -m u:ps5:rw testi/
setfacl -m u:ps6:x testi/

#Create scripts as users
cd testi
sudo -u ps1 touch ps1_test.sh
sudo -u ps2 touch ps2_test.sh
sudo -u ps3 touch ps3_test.sh
sudo -u ps4 touch ps4_test.sh
sudo -u ps5 touch ps5_test.sh

