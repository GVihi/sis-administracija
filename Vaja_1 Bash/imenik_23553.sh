#!/bin/bash

#Add function -dodaj flag
add(){
    echo "Selected add"
    now="$(date +'%d%m%Y%H%M%S%N')" #Used as UUID
    #################      
    #Default values  #       
    ime="PRAZNO"     #
    priimek="PRAZNO" #
    naslov="PRAZNO"  #
    posta="PRAZNO"   #
    kraj="PRAZNO"    #
    tel="PRAZNO"     #
    id=$now          #
    #################

    #Shifted arguemnts, so $1 is now the next flag
    shift

    #Check if first argument ($1) matches any of the flags and shift until number of arguments ($#) is 0 
    while [[ $# -gt 0 ]]
    do
        if [[ $1 == "-ime" ]]       #Check if argument matches any flag }
        then                        #                                   }   }
            shift                   #Shift, so $1 is the value          }   }   }    If statements apply for other coresponding flags
            ime=$1                  #Set variable to value              }   }
        fi                          #                                   }

        if [[ $1 == "-priimek" ]]
        then
            shift
            priimek=$1
        fi

        if [[ $1 == "-naslov" ]]
        then
            shift
            naslov=$1
        fi

        if [[ $1 == "-posta" ]]
        then
            shift
            posta=$1
        fi

        if [[ $1 == "-kraj" ]]
        then
            shift
            kraj=$1
        fi

        if [[ $1 == "-tel" ]]
        then
            shift
            tel=$1
        fi

        #Shift needed after every iteration
        shift
    done

    #Printing info in the terminal
    echo "echoed $ime;;$priimek;;$naslov;;$posta;;$kraj;;$tel;;$id into imenik_23553.dat"

    #Saving info in imenik_23553.dat
    echo "$ime;;$priimek;;$naslov;;$posta;;$kraj;;$tel;;$id" >> imenik_23553.dat

}

#Delete function -brisi flag
delete(){
    echo "Selected delete"

    #Shifted arguemnts, so $1 is now the next flag
    shift

    #While number of arguments is greater than 0, check if current argument matched -id flag
    while [[ $# -gt 0 ]]
    do
        if [[ $1 == "-id" ]]
        then
            shift
            id=$1
        fi
        shift
    done

    echo "Are you sure you want to delete this entry? (y/n)"
    read confirm

    if [[ $confirm == "y" ]]
    then
    #Delete entry that contains $id
    sed -i "/$id/d" imenik_23553.dat
    fi

}

#Search function -isci flag
search(){
    #Setting these variables to .* in case they are not set by user, the function can search for anything in their place
    ime=.*
    priimek=.*
    naslov=.*
    posta=.*
    kraj=.*
    tel=.*
    id=.*
    echo "Selected search"

    #Shifted arguemnts, so $1 is now the next flag
    shift

    #Check if first argument ($1) matches any of the flags and shift until number of arguments ($#) is 0 
    while [[ $# -gt 0 ]]
    do
        if [[ $1 == "-ime" ]]       #Check if argument matches any flag }
        then                        #                                   }   }
            shift                   #Shift, so $1 is the value          }   }   }    If statements apply for other coresponding flags
            ime=$1                  #Set variable to value              }   }
        fi                          #                                   }

        if [[ $1 == "-priimek" ]]
        then
            shift
            priimek=$1
        fi

        if [[ $1 == "-naslov" ]]
        then
            shift
            naslov=$1
        fi

        if [[ $1 == "-posta" ]]
        then
            shift
            posta=$1
        fi

        if [[ $1 == "-kraj" ]]
        then
            shift
            kraj=$1
        fi

        if [[ $1 == "-tel" ]]
        then
            shift
            tel=$1
        fi

        if [[ $1 == "-id" ]]
        then
            shift
            id=$1
        fi

        #Shift needed after every iteration
        shift
    done

    #echo "$ime;;$priimek;;$naslov;;$posta;;$kraj;;$tel;;$id"
    grep -oE "$ime;;$priimek;;$naslov;;$posta;;$kraj;;$tel;;$id" imenik_23553.dat
}

#Edit function -uredi flag
edit(){
    echo "Selected edit"

    shift

    #Getting the id from arguments
    if [[ $1 == "-id" ]]
    then
        shift
        id=$1
    else
        echo "First argument must be an id!"
        exit 1
    fi

    #Grepping line containing $id from imenik_23553.dat
    line="$(grep $id imenik_23553.dat)"
    #echo $line

    #Cutting the grepped line into respectable variables
    ime="$(echo $line | cut -f 1 -d ';')"
    priimek="$(echo $line | cut -f 3 -d ';')"
    naslov="$(echo $line | cut -f 5 -d ';')"
    posta="$(echo $line | cut -f 7 -d ';')"
    kraj="$(echo $line | cut -f 9 -d ';')"
    tel="$(echo $line | cut -f 11 -d ';')"

    #Printing current information associated with $id
    echo
    echo "Old information: "
    echo "Ime: $ime"
    echo "Priimek: $priimek"
    echo "Naslov: $naslov"
    echo "Posta: $posta"
    echo "Kraj: $kraj"
    echo "Telefon: $tel"
    
    #Check if first argument ($1) matches any of the flags and shift until number of arguments ($#) is 0 
    while [[ $# -gt 0 ]]
    do
        if [[ $1 == "-ime" ]]       #Check if argument matches any flag }
        then                        #                                   }   }
            shift                   #Shift, so $1 is the value          }   }   }    If statements apply for other coresponding flags
            ime=$1                  #Set variable to value              }   }
        fi                          #                                   }

        if [[ $1 == "-priimek" ]]
        then
            shift
            priimek=$1
        fi

        if [[ $1 == "-naslov" ]]
        then
            shift
            naslov=$1
        fi

        if [[ $1 == "-posta" ]]
        then
            shift
            posta=$1
        fi

        if [[ $1 == "-kraj" ]]
        then
            shift
            kraj=$1
        fi

        if [[ $1 == "-tel" ]]
        then
            shift
            tel=$1
        fi

        #Shift needed after every iteration
        shift
    done

    #Printing new information
    echo
    echo "New information: "
    echo "Ime: $ime"
    echo "Priimek: $priimek"
    echo "Naslov: $naslov"
    echo "Posta: $posta"
    echo "Kraj: $kraj"
    echo "Telefon: $tel"

    #Getting confirmation
    echo
    echo "Are you sure you want to update this information? (y/n)"
    read confirm

    #If confirmed; change info
    if [[ $confirm == "y" ]]
    then
        sed -i "/$id/d" imenik_23553.dat
        echo "$ime;;$priimek;;$naslov;;$posta;;$kraj;;$tel;;$id" >> imenik_23553.dat
    fi
}

#Name of the phone book
PhoneBook="imenik_23553.dat"

#If file imenik_23553.dat does not exist, create it
if ! [ -f "$PhoneBook" ]
then
    touch imenik_23553.dat
fi

if [[ $1 == "-dodaj" ]]
then
    add $@
elif [[ $1 == "-brisi" ]]
then
    delete $@
elif [[ $1 == "-isci" ]]
then
    search $@
elif [[ $1 == "-uredi" ]]
then
    edit $@
else
    echo "Please specify which action you'd like to perform:"
    echo "-dodaj"
    echo "-brisi"
    echo "-isci"
    echo "-uredi"
fi