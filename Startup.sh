#!/bin/bash


if [ ! -e "loc.txt" ]; then
  echo "-------------Doing your first time setup--------------"
  touch loc.txt
  echo "Please enter your location :"
  read location
  echo $location >> loc.txt
  echo " $(cat loc.txt) is set as your location"
  echo "-------------To-do list setup------------"
  echo "How many tasks in list:"
  read n_items
  for ((i=1;i<=$n_items; i++)); do
  	touch list.txt
  	echo "task $i"
  	read item
  	echo "$item" >> list.txt
  done
fi

toilet -t  -f  pagga Welcome $(whoami) -F border 
sleep 1
toilet -t -f wideterm  This is your system , starting just the way you like it:
echo "------------------------------------------------------------------------------"
toilet -t -f wideterm  Today is:
sleep 1
toilet -t -f smbraille $(date) -F border --gay
echo "------------------------------------------------------------------------------"
toilet -t -f wideterm  Joke of the day is:
curl https://v2.jokeapi.dev/joke/Any?format=txt
echo ""
sleep 5
echo "------------------------------------------------------------------------------"
curl wttr.in/$(cat loc.txt)?1
sleep 2
echo "------------------------------------------------------------------------------"
toilet -t -f future  Your To-Do List -F border
cat -n list.txt
sleep 2
echo "------------------------------------------------------------------------------"
echo  "Do you want to modify Location or the To-Do List(you can add to the list or change it entirely):"
echo  "1. Change Location"
echo  "2. Add to the list"
echo  "3. Change the list"
echo  "4. Do nothing"
read Choice


case $Choice in

  1)
    rm loc.txt
    touch loc.txt
    echo "Please enter your location :"
    read location
    echo $location >> loc.txt
    echo " $(cat loc.txt) is set as your location"
    toilet -t -f future  Goodbye -F border --gay
    ;;

  2)
    echo "How many tasks in list:"
    read n_items
    for ((i=1;i<=$n_items; i++)); do
        	touch list.txt
                echo "task $i"
        	read item
        	echo "$item" >> list.txt
    done
    toilet -t -f future  Goodbye -F border --gay
    ;;

  3)
    rm list.txt
    echo "How many tasks in list:"
    read n_items
    for ((i=1;i<=$n_items; i++)); do
        	touch list.txt
        	echo "task $i"
        	read item
        	echo "$item" >> list.txt
    done
    toilet -t -f future  Goodbye -F border --gay
    ;;

  4)
    toilet -t -f future  Goodbye -F border --gay
    ;;
esac
sleep 2
