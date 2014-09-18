#!/bin/bash
# netcat-rx.sh
# This script sets up a listener / server using netcat to listen for incoming connections
# This script needs to work in tandem with netcat-tx.sh

echo "Enter the number of concurrent sessions you would to listen for (between 1 and 10000):"
read ncsessions

# echo "========================================================================="
# echo "Please make sure to delete any temporary files (file#.tgz) from /var/tmp/"
# echo "========================================================================="

for (( i = 0; i < $ncsessions; i++ )) ; do
    let 'k = 4444+i';
    nc -vv -p $k -l > /var/tmp/file$i &
done
