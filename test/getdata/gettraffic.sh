#!/bin/bash

# RAW=`locate test/getdata | grep "/test/getdata/raw"`
cd res

echo "IPERF CLIENT"
echo
echo -n -e " ketik 1 untuk client di core\n ketik 2 untuk client di ue\n ketik 3 untuk masuk surga\n [1/2] "
read CLT

if [[ $CLT == 1 ]]
then
   echo
   echo "iperf client on core"
   echo -n -e "\nketik IP UE : "
   read IPUE
   echo
   echo "iperfing client on server ${IPUE}"
   for ((z=1; z<=1; z++)) 
   do
      iperf3 -c ${IPUE} -i 1 -t 30 --sctp >> ../raw/sctp_4.csv
      sleep 5s
      iperf3 -c ${IPUE} -i 1 -t 30 >> ../raw/tcp_4.csv
      sleep 5s
      iperf3 -c ${IPUE} -i 1 -t 30 --udp >> ../raw/udp_4.csv
      a=`cat ../raw/sctp_4.csv | awk '{print$7}'`$'\n'
      b=`cat ../raw/tcp_4.csv | awk '{print$7}'`$'\n'
      c=`cat ../raw/udp_4.csv | awk '{print$7}'`$'\n'
      d=`cat ../raw/udp_4.csv | awk '{print$9}'`$'\n'
      # c=`cat ../raw/udp_4.csv | awk '{print$7}'`$'\n'

      echo "$a" > sctp_4.csv
      echo "$b" > tcp_4.csv
      echo "$c" > udp_4.csv
      echo "$d" > udp_jitter_4.csv
   done
   rm ../raw/sctp_4.csv
   rm ../raw/tcp_4.csv
   rm ../raw/udp_4.csv

elif [[ $CLT == 2 ]]
then
   echo
   echo "iperf client on UE"
   echo
   for ((z=1; z<=1; z++)) 
   do
      sudo ip netns exec ue1 iperf3 -c 10.45.0.1 -i 1 -t 30 --sctp >> ../raw/sctp_4.csv
      sudo ip netns exec ue1 iperf3 -c 10.45.0.1 -i 1 -t 30 >> ../raw/tcp_4.csv
      sudo ip netns exec ue1 iperf3 -c 10.45.0.1 -i 1 -t 30 --udp >> ../raw/udp_4.csv
      a=`cat ../raw/sctp_4.csv | awk '{print$7}'`$'\n'
      b=`cat ../raw/tcp_4.csv | awk '{print$7}'`$'\n'
      c=`cat ../raw/udp_4.csv | awk '{print$7}'`$'\n'
      d=`cat ../raw/udp_4.csv | awk '{print$9}'`$'\n'

      echo "$a" > sctp_4.csv
      echo "$b" > tcp_4.csv
      echo "$c" > udp_4.csv
      echo "$d" > udp_jitter_4.csv
   done
   rm ../raw/sctp_4.csv
   rm ../raw/tcp_4.csv
   rm ../raw/udp_4.csv
elif [[ $CLT == 3 ]]
then
    echo
    echo "subhanallah"
fi
