#!/bin/bash
#Get public IP
MY_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
#echo $MY_IP
DOMAIN=$(dig -x $MY_IP +short)
#echo $DOMAIN
CHECK_GATEWAY=$(ping -c 1 $(ip r | grep default | awk '{print$3}') | grep "1 packets transmitted, 1 received" | wc -l)
echo $CHECK_GATEWAY | awk '{print "Connection,component="conn" value="$1}' | curl -i -XPOST 'http://localhost:8086/write?db=demo_abb' --data-binary @-
