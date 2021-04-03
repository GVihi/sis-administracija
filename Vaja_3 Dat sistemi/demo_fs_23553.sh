#-izpis flag
echo "------------------------------- IZPIS -------------------------------"
./fs-23553.sh -izpis

#-ustvari flag
echo "------------------------------- USTVARI -------------------------------"
./fs-23553.sh -ustvari /dev/sdb ext4
./fs-23553.sh -ustvari /dev/sdc ext4
./fs-23553.sh -ustvari /dev/sdd ext4
lsblk -f | grep "sdb"
lsblk -f | grep "sdc"
lsblk -f | grep "sdd"

#-priklopi flag
echo "------------------------------- PRIKLOPI -------------------------------"
./fs-23553.sh -priklopi /dev/sdb1 priklop/
cd priklop #Changing directory to priklop to show it actually mounted
pwd #Print working directory
cd ..

#-posodobi flag
echo "------------------------------- POSODOBI -------------------------------"
#Changing sdb1 file system to ext3 
sudo mkfs -t ext3 /dev/sdb1 
#Displaying change to the user
lsblk -f | grep "sdb1"
#Changing sdb1 file system to ext4
./fs-23553.sh -posodobi /dev/sdb1 
#Displaying change to the user
lsblk -f | grep "sdb1"

#-ustvariraid flag
echo "------------------------------- USTVARI RAID -------------------------------"
./fs-23553.sh /dev/sdb1 /dev/sdb2 /dev/sdc1 /dev/sdc2
lsblk -f | grep "linux_raid_member"

#-hotspare flag
echo "------------------------------- HOTSPARE -------------------------------"
#mdadm displays changes itself, no need for additional echo's, etc.
./fs-23553.sh -hotspare /dev/md0 /dev/sdd1

#-izpisraid flag
echo "------------------------------- IZPIS RAID -------------------------------"
./fs-23553.sh -izpisraid /dev/md0

#-izpad flag
echo "------------------------------- IZPAD -------------------------------"
./fs-23553.sh -izpad /dev/md0 /dev/sdb1

#-odstrani flag
echo "------------------------------- ODSTRANI -------------------------------"
./fs-23553.sh -odstrani /dev/md0 /dev/sdb1
