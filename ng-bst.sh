#!/bin/bash

if [ -d "dist" ]; then
	echo "dist exists"
	read -p "Create new one (y/n)?" answer
	case "$answer" in 
	  y|Y )
	echo "#run ng build --prod command"
	echo -n "Loading"
	while true; do
	echo -n .
	sleep 1
	done & trap "kill $!" EXIT  
	ng build --prod;
	kill $! && trap " " EXIT;;
	  n|N ) echo "done";;
	  * ) echo "invalid";;
	esac
else
	echo "#directory /dist doesn't exist"
	echo "#run ng build --prod command"
	echo -n "Loading"
	while true; do
	echo -n "."
	sleep 1
	done & trap "kill $!" EXIT  
	ng build --prod;
	kill $! && trap " " EXIT
fi

read -p "Load /dist to server (y/n)?" choice
case "$choice" in 
  y|Y )
	scp -r dist/* user_name@host_name:target_path || echo "connection failed";;
  n|N ) echo "done";;
  * ) echo "invalid";;
esac