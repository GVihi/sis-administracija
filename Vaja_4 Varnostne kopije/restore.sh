#Honestly no clue if this works. 
#Completely bricked 2 VM's with my previous assignment, can't even restore from snapshot
#Not running this on host machine LOL
#If it works it works, if not, well :D

#If statements to determine backup method

#If "incremental" argument is passed, rdiff-backup will be used
if [[ $1 == "incremental" ]]
then
    cd /mnt/backup/23553/
    for d in */ ; do
        sudo cp -a /mnt/backup/23553/$d /home/"$d"
    done
fi

#If "mirror" argument is passed, rsync will be used
if [[ $1 == "mirror" ]]
then
    cd /mnt/backup/23553/
    for d in */ ; do
        #echo "$d"
        sudo rsync -aAXv /mnt/backup/23553/$d /home/$d
    done
fi