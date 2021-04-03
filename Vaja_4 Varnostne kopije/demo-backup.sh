#Backup of critical files
#using rdiff-backup
./backup-critical.sh incremental
#using Rsync
./backup-critical.sh mirror

#Backup of entire home dir, excluding Maildir
#Using rdiff-backup
./backup-other.sh incremental
#Using Rsync
./backup-other.sh mirror

#Restoring files
./restore.sh incremental

./restore.sh mirror

#Archiving backup
./maketar.sh