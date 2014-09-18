#!/bin/bash
# netcat-tx.sh
# This script sets up a listener / server using netcat to listen for incoming connections
# This script needs to work in tandem with netcat-rx.sh

echo "Enter the number of concurrent sessions you would to listen for (between 1 and 10000):"
read ncsessions

echo "Enter the ip / hostname of the server running the listener:"
read ncrxip


for (( i = 0; i < $ncsessions; i++ )) ; do
    let 'k = 4444+i';
    nc -vv -w 30 $ncrxip $k < /dev/null &
done &
