#!/bin/bash
#Create users and add them to "progskupina_23553" group
sudo useradd -d /home/ps1 -s /bin/bash -U -m ps1 #-m create home dir, -d specifies home dir, -U creates group with same name as user
sudo useradd -d /home/ps2 -s /bin/bash -U -m ps2
sudo useradd -d /home/ps3 -s /bin/bash -U -m ps3
sudo useradd -d /home/ps4 -s /bin/bash -U -m ps4
sudo useradd -d /home/ps5 -s /bin/bash -U -m ps5
sudo useradd -d /home/ps6 -s /bin/bash -U -m ps6

sudo groupadd progskupina_23553

sudo usermod -a -G progskupina_23553 ps1 #-a add user to supplementary group, -G specifies group
sudo usermod -a -G progskupina_23553 ps2
sudo usermod -a -G progskupina_23553 ps3
sudo usermod -a -G progskupina_23553 ps4
sudo usermod -a -G progskupina_23553 ps5
sudo usermod -a -G progskupina_23553 ps6
