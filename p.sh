#!/bin/bash
ipok=0
ipbad=0
echo "-------------------------------------" 
while read dstip
do
    if ping -c1 -W1 $dstip > /dev/null; then
        ms=$(ping $dstip -c1 | grep time= | sed 's/=/ /g' | awk '{print $10}')
        echo "$dstip Ping OK Legacy $ms ms"
        let ipok++
    else
        echo "$dstip IP Boom"
        let ipbad++
    fi
done < $1
echo "-------------------------------------" 
echo "                 totaly $ipok IP is fine"
echo "                 totaly $ipbad IP is fail"
