#! /bin/bash
echo -n "Enter destination IPv4 of server to transfer file: "
read -e DESTIP
echo -n "Enter listening port of remote server: "
read -e REMOTEPORT

echo -n "Enter path of folder to copy: "
read -e FOLDERPATH 
tar -cf - $FOLDERPATH | nc $DESTIP $REMOTEPORT
