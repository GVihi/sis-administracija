#!/bin/bash

#echo $#
#echo $@

#First function
fun123553(){
    echo "--Funkcija fun123553 sprožena--"              #Debug echo, so we know if the right function got executed
    cd /home/Gašper                                 #Change directory to Gašper
    echo "#Begin Print current directory"
    pwd                                             #Print current directory
    echo "#End"
    mkdir Viher                                     #Creates folder Viher
    echo "#Begin print all files in current dir"
    ls                                              #prints all files in current directory
    echo "#End"
    cd Viher                                        #Change directory to Viher
    touch Gašper1.txt Gašper.dat Gašper-Viher.txt   #Creates 3 files
    for i in {1..3}                                 #For loops that "dumps" echo output to the 3 files 3 times
    do
        echo "N/A" >> Gašper1.txt
        echo "N/A" >> Gašper.dat
        echo "N/A" >> Gašper-Viher.txt
    done
    echo "#Begin display content of all files ending with .txt"
    cat *.txt                                       #Displays contents of all files ending with .txt
    echo "#End"
    echo "#Begin char count in Gašper.dat"
    wc -m Gašper.dat                                #Number of characters in Gašper.dat
    echo "#End"
    cd ..                                           #Move on directory down; Gašper
    rm -rf Viher                                    #Removes Viher directory; -rf because the folder isn't empty
    echo "#Begin list of installed packages"
    apt list --installed                            #Displays a list of all installed packages
    echo "#End"
}

#Second function
fun223553(){
    echo "--Funkcija fun223553 sprožena--"                              #Debug echo, so we know if the right function got executed
    echo "#Begin number of threads"
    echo "Number of threads: $(nproc --all)"                        #Print number of cpu threads
    echo "#End"
    echo  "#Begin Number of users logged in"                                                          
    echo "Number of users logged into the system: $(who | wc -l)"   #Number of users logged into the system
    echo "#End"
    echo "#Begin Users with acess"                                                           
    echo "Users with access to system:"
    awk '{if ($3 > 999) print $0}' FS=: /etc/passwd | grep -v nologin       #Users with access to system     --Not sure if I interpreted the question correctly--
    echo "#End"
                                                                        
    echo
    if dpkg --get-selections | grep -q "build-essential" > /dev/null; then      #Checks if build-essential is installed. If not, install it
        echo "Package build-essential is installed"
    else 
        echo "Package build-essential is not installed"
        apt-get install build-essential
    fi
    echo

    echo "#Begin list of active processes"
    ps -e | wc -l                                                   #Number of active processes on system
    echo "#End"
    echo "#Begin list of IP's from /etc/log/"
    last -i | grep -vE "164\.8\..\.." | grep -oE ".\..\..\.."       #List if IP's from "access log" -- ¯\_(ツ)_/¯--
    echo "#End"
}

#If script is started without arguments, let the user know and exit script
if [ $# -lt 1 ] #If number of arguments less than 1
then
    echo "You need to add arguments when starting this function"
    exit 1 #Exits script
fi

#Checking if $1 (first argument) equals "ena-23553" and calling function fun123553
#Else if $1 equals "dva-23553" call function fun223553
if [ $1 == "ena-23553" ]
then
    fun123553
elif [ $1 == "dva-23553" ]
then
    fun223553
fi


