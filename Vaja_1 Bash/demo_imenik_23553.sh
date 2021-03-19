#!/bin/bash

#Adding 5 people into the imenik_23553.dat phone book
#Running ./imenik_23553.sh script with -dodaj flag
./imenik_23553.sh -dodaj -ime gasper -priimek viher -kraj ivanjkovci -naslov zerovinci
./imenik_23553.sh -dodaj -ime franc -priimek novak -kraj ormoz -naslov ormoz5
./imenik_23553.sh -dodaj -ime franc -priimek novak -kraj ljutomer -naslov ljutomer3
./imenik_23553.sh -dodaj -ime marija -priimek kovacic -kraj ptuj -naslov ptuj10
./imenik_23553.sh -dodaj -ime ana -priimek krajnc -kraj maribor -naslov maribor23

#Searching for particular people
#Running ./imenik_23553.sh script with -isci flag
./imenik_23553.sh -isci -ime franc -priimek novak
./imenik_23553.sh -isci -kraj ormoz

#Deleting entry from phone book
echo "Enter ID of person that you'd like to remove from the phone book: "
#Reading input from terminal
read id

#Running ./imenik_23553.sh script with -brisi flag
./imenik_23553.sh -brisi -id $id

#Printing entire phone book.
cat imenik_23553.dat

#Edit
echo "Enter ID of person that you'd like to edit: "
#Reading input from terminal
read id

./imenik_23553.sh -uredi -id $id -ime peter -priimek klepec -tel "555-6969"

./imenik_23553.sh -isci -id $id