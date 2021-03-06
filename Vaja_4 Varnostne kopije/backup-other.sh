#If statements to determine backup method

#If "incremental" argument is passed, rdiff-backup will be used
if [[ $1 == "incremental" ]]
then
    cd /home/
    for d in */ ; do
        #echo "$d"
        sudo rdiff-backup --exclude /home/"$d"Maildir /home/"$d" /mnt/backup/23553/$d
    done
fi

#If "mirror" argument is passed, rsync will be used
if [[ $1 == "mirror" ]]
then
    cd /home/
    for d in */ ; do
        #echo "$d"
        sudo rsync -a --exclude 'Maildir' /home/"$d" /mnt/backup/23553/$d
    done
fi