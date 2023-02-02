#!/bin/bash
echo
echo "### iperf3 on server side"
echo
echo -n -e " ketik 1 untuk upnlink\n ketik 2 untuk downlink\n ketik 3 untuk masuk surga\n [1/2] "
read SER

if [[ $SER == 1 ]]
then
    echo
    echo "iperf upnlink"
    iperf3 -s -i 1

elif [[ $SER == 2 ]]
then
    echo
    echo "iperf downlink"
    echo
    sudo ip netns exec ue1 iperf3 -s -i 0.5
elif [[ $SER == 3 ]]
then
    echo
    echo "subhanallah"
fi