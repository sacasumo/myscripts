#!/bin/bash

if [ "$1" = "" ]; then
	echo " #################################### "
	echo " # PING SWEEP   # "
	echo " #################################### "
	echo " " 
	echo " description "
	echo " "
	echo " Syntax: $0 <network address> "
	echo " "
	echo " Network address should be in class A, B or C"
	echo " Coded by: Ramon Vicens"
	echo " ###################################"
else
	net=$1
	mask=`echo $net| cut -d"/" -f2`
	base_addr=`echo $net | cut -d"/" -f 1`
	if [ "$mask" == "24" ]; then
		for num in $(seq 1 254); do

			base_ip=`echo $base_addr | awk -F'.' '{print $1"."$2"."$3}'`
			ip=$base_ip.$num
			hping3 --faster -c 1 --icmptype 8 --icmpcode 0 $ip | tee -a tmp.txt
			#ping -c 1 $ip | tee -a tmp.txt
		done
	fi
	if [ "$mask" == "16" ];then
		for num in $(seq 0 255); do
			for num2 in $(seq 1 254); do
                       
				base_ip=`echo $base_addr | awk -F'.' '{print $1"."$2}'`
                        	ip=$base_ip.$num.$num2
                        	hping3 --faster -c 1 --icmptype 8 --icmpcode 0 $ip | tee -a tmp.txt
                        	#ping -c 1 $ip | tee -a tmp.txt
			done
                done
	fi
	if [ "$mask" == "8" ];then
		for num in $(seq 0 255); do
                        for num2 in $(seq 0 255); do
				for num3 in $(seq 1 254); do
                                	base_ip=`echo $base_addr | awk -F'.' '{print $1}'`
                                	ip=$base_ip.$num.$num2.$num3
                                	hping3 --faster -c 1 --icmptype 8 --icmpcode 0 $ip | tee -a tmp.txt
                                	#ping -c 1 $ip | tee -a tmp.txt
                        	done
			done
                done
	fi 
	if [ "$mask" != "8" -a "$mask" != "16" -a "$mask" != "24" ];then
		echo " "
		echo "     ERROR: No CIDR Address or not valid mask"
		echo " "
		echo " Please insert class A,B or C network address."
		echo " Example: $0 192.168.1.0/24"
	else 
		echo " ------------------------------------ "
        	echo " PING DISCOVERED HOSTS"
        	echo " ------------------------------------ "
		cat tmp.txt | grep "ip=" | grep "ip=" | cut -d"=" -f3 | sed -e 's/ttl//g' | sort | uniq | tee discovered_hosts.txt
		echo " ------------------------------------ "
        	echo " ARP DISCOVERED HOSTS"
        	echo " ------------------------------------ "
		arp -a | grep -v "incomplete" |tee -a discovered_hosts.txt
		rm tmp.txt 
	fi
fi

