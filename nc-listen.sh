#! /bin/bash
echo -n "Enter port on which to listen for incoming connections: "
read -e INCOMING_PORT
nc -l -p $INCOMING_PORT | tar xvf -
