#!/bin/bash
# This script configures eth0 with a static IP/mask/sets the default gateway as per user input

echo "Enter the IP address for eth0 in dotted decimal notation (e.g. 192.168.10.5):"
read eth0ip

echo "Enter the subnet mask in dotted decimal notation (e.g. 255.255.255.0):"
read eth0mask

echo "Enter the IP address of the default gateway (e.g. 192.168.10.254):"
read eth0gw

ifconfig eth0 $eth0ip netmask $eth0mask up
route add default gw $eth0gw eth0


