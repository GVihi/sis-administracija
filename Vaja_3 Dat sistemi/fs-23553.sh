#README:
#"Vsaka izmed zastvic naj bo implementirana v lastni funkciji."
#Mentioned at the end of assignment instructions... >:( 
#Can't be bothered to go and change the entire structure of script.
#If statements will have to do. Angry_face.png

#If statements to check flags
#-izpis lists all available drives
#Use example: ./fs-23553.sh -izpis
if [[ $1 == "-izpis" ]]
then
    lsblk
fi

#-ustvari creates two same sized partitions
#Use example: ./fs-23553.sh -ustvari /dev/sdb ext4
#$2 being the drive and $3 being the file system
if [[ $1 == "-ustvari" ]]
then
    sudo parted -s $2 mklabel gpt
    sudo parted -s $2 mkpart primary $3 0% 50%
    sudo parted -s $2 mkpart primary $3 50% 100% #Adding the file system type here doesnt work, error when mounting
    VAR1="${2}1" #e.g. /dev/sdb1
    VAR2="${2}2" #e.g. /dev/sdb2
    echo $VAR1
    sudo mkfs -t $3 $VAR1
    sudo mkfs -t $3 $VAR2
    sudo fdisk -l $2
fi

#-priklopi mounts the desired partition to desired mount point
#Use example: ./fs-23553.sh /dev/sdb1 priklop/
#$2 being the partition and $3 being the mount point
if [[ $1 == "-priklopi" ]]
then
    mkdir -p $3
    sudo mount $2 $3
fi

#-posodobi converts filesystem on desired partition to ext4
#Use example: ./fs-23553.sh -posodobi /dev/sdb1
#$2 being the desired partition
if [[ $1 == "-posodobi" ]]
then
    sudo mkfs -t ext4 $2
fi

#-ustvariraid creates RAID 1 array using partitions that the user passed to script
#Use example: ./fs-23553.sh /dev/sdb1 /dev/sdb2 /dev/sdc1 /dev/sdc2
#$var used to pass amount of partitions to mdadm, $partitions: loop iterates through all arguments, adding them to a single string
if [[ $1 == "-ustvariraid" ]]
then
    var=$#
    var=$((var-1))
    space=" "
    #echo $var
    shift
    while [[ $# -gt 0 ]]
    do
        partitions="${partitions}$1"
        partitions="${partitions}$space"
        shift
    done
    echo "Partitions to add to RAID 1: $partitions"
    sudo mdadm --create --verbose /dev/md0 --level=1 --raid-devices=$var $partitions
fi

#-hotspare adds spare drive to RAID 1 array in case of drive failure
#Use example: ./fs-23553.sh -hotspare /dev/md0 /dev/sdd1
#$2 being the raid array (md0) and $3 being the spare disk/partition
if [[ $1 == "-hotspare" ]]
then
    sudo mdadm --manage $2 --add-spare $3
fi

#-izpisraid prints status of raid array
#Use example: ./fs-23553.sh -izpisraid /dev/md0
#$2 being the raid array
if [[ $1 == "-izpisraid" ]]
then
    sudo mdadm --detail $2
fi

#-izpad simulates drive failure
#Use example: ./fs-23553.sh -izpad /dev/md0 /dev/sdb1
#$2 being the raid array, $3 being the partition that "failed"
if [[ $1 == "-izpad" ]]
then
    sudo mdadm --manage $2 --fail $3
fi

#-odstrani removes "corrupted" partition from raid array
#Use example: ./fs-23553.sh -odstrani /dev/md0 /dev/sdb1
#$2 being the raid array, $3 being the partition that "failed"
if [[ $1 == "-odstrani" ]]
then
    sudo mdadm --manage $2 --remove $3
fi
