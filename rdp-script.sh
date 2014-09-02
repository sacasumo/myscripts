#! /bin/bash

clear
echo "Enter Server IP or Hostname:"
read serverip
echo "----------------------------"

echo "Username:"
read usern
echo "----------------------------"

echo "Password:"
read -s passn
echo "----------------------------"

echo "Domain (Enter . for localhost):"
read domainame
clear
sleep 1
clear

echo "Hit CTRL+ALT+Enter to exit full screen mode"
sleep1
rdesktop -f -d $domainame -u $usern -p "$passn" $serverip
clear

