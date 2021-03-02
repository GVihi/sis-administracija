#!/bin/bash

#echo $#
#echo $@

#First function
fun123553(){
    echo "Funkcija fun123553 sprožena"              #Debug echo, so we know if the right function got executed
    cd /home/Gašper                                 #Change directory to Gašper
    pwd                                             #Print current directory
    mkdir Viher                                     #Creates folder Viher
    ls                                              #prints all files in current directory
    cd Viher                                        #Change directory to Viher
    touch Gašper1.txt Gašper.dat Gašper-Viher.txt   #Creates 3 files
    for i in {1..3}                                 #For loops that "dumps" echo output to the 3 files 3 times
    do
        echo "N/A" >> Gašper1.txt
        echo "N/A" >> Gašper.dat
        echo "N/A" >> Gašper-Viher.txt
    done
    cat *.txt                                       #Displays contents of all files ending with .txt
    wc -m Gašper.dat                                #Number of characters in Gašper.dat
    cd ..                                           #Move on directory down; Gašper
    rm -rf Viher                                    #Removes Viher directory; -rf because the folder isn't empty
    apt list --installed                            #Displays a list of all installed packages
}

#Second function
fun223553(){
    echo "Funkcija fun223553 sprožena"              #Debug echo, so we know if the right function got executed
    echo $(nproc --all)                             #Print number of cpu threads
    who | wc -l                                     #Number of users logged into the system
    grep -v nologin /etc/passwd                     #Users with access to system     --Not sure if I interpreted the question correctly--

    if dpkg --get-selections | grep -q "build-essential" > /dev/null; then      #Checks if build-essential is installed. If not, install it
        echo "Package build-essential is installed"
    else 
        echo "Package build-essential is not installed"
        apt-get install build-essential
    fi
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


