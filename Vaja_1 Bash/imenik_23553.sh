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

    #Delete entry that contains $id
    sed -i "/$id/d" imenik_23553.dat
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
    #TODO: Never, spent way too much time on this assignment already, have to complete other assignments  (⌣_⌣”)
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