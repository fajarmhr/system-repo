#!/bin/bash

# RAW=`locate test/getdata | grep "/test/getdata/raw"`
cd res

echo "IPERF CLIENT"
echo
echo -n -e " ketik 1 untuk downlink\n ketik 2 untuk upnlink\n ketik 3 untuk downlink android\n ketik 4 untuk masuk surga\n [1/2/3] "
read CLT
echo
echo -n -e " enb berapa? [enb1/enb2] "
read ENB

if [[ $CLT == 1 ]]
then
   echo
   echo "iperf downlink"
   echo -n -e "\nketik IP UE : "
   read IPUE
   echo
   echo "iperfing client on server ${IPUE}"
   for ((z=1; z<=30; z++)) 
   do
      echo "$z"
      iperf3 -c ${IPUE} -i 0.5 -t 10 --sctp >> ../raw/sctp_i.csv
      sleep 2s
      iperf3 -c ${IPUE} -i 0.5 -t 10 >> ../raw/tcp_i.csv
      sleep 2s
      iperf3 -c ${IPUE} -i 0.5 -t 10 --udp >> ../raw/udp_i.csv
      sleep 2s
      a=`cat ../raw/sctp_i.csv | awk '{print$7}'`$'\n'
      b=`cat ../raw/tcp_i.csv | awk '{print$7}'`$'\n'
      c=`cat ../raw/udp_i.csv | awk '{print$7}'`$'\n'
      #d=`cat ../raw/udp_i.csv | awk '{print$9}'`$'\n'
      # c=`cat ../raw/udp_i.csv | awk '{print$7}'`$'\n'
      ovs=`cat ../raw/sctp_i.csv | grep "receiver" | awk '{print$7}'`$'\n'
      ovt=`cat ../raw/tcp_i.csv | grep "receiver" | awk '{print$7}'`$'\n'
      ovu=`cat ../raw/udp_i.csv | grep "receiver" | awk '{print$7}'`$'\n'

      echo "$a" > sctp_i5.csv
      echo "$b" > tcp_i5.csv
      echo "$c" > udp_i5.csv
      #echo "$d" > udp_jitter_i.csv
      echo "$ovs" > sctp_ovr5.csv
      echo "$ovt" > tcp_ovr5.csv
      echo "$ovu" > udp_ovr5.csv
   done
   rm ../raw/sctp_i.csv
   rm ../raw/tcp_i.csv
   rm ../raw/udp_i.csv

elif [[ $CLT == 2 ]]
then
   echo
   echo "iperf upnlink"
   echo
   for ((z=1; z<=1; z++)) 
   do
      sudo ip netns exec ue1 iperf3 -c 10.45.0.1 -i 0.5 -t 10 --sctp >> ../raw/sctp_i.csv
      sudo ip netns exec ue1 iperf3 -c 10.45.0.1 -i 0.5 -t 10 >> ../raw/tcp_i.csv
      sudo ip netns exec ue1 iperf3 -c 10.45.0.1 -i 0.5 -t 10 --udp >> ../raw/udp_i.csv
      a=`cat ../raw/sctp_i.csv | awk '{print$7}'`$'\n'
      b=`cat ../raw/tcp_i.csv | awk '{print$7}'`$'\n'
      c=`cat ../raw/udp_i.csv | awk '{print$7}'`$'\n'
      #d=`cat ../raw/udp_i.csv | awk '{print$9}'`$'\n'

      echo "$a" > sctp_i.csv
      echo "$b" > tcp_i.csv
      echo "$c" > udp_i.csv
      #echo "$d" > udp_jitter_i.csv
   done
   rm ../raw/sctp_i.csv
   rm ../raw/tcp_i.csv
   rm ../raw/udp_i.csv

elif [[ $CLT == 3 ]]
then
   echo
   echo "iperf android downlink"
   echo -n -e "\nketik IP UE : "
   read IPAD
   echo
   echo "iperfing client on server ${IPAD}"
   for ((z=1; z<=30; z++)) 
   do
      echo "$z"
      #iperf3 -c ${IPAD} -i 0.5 -t 10 --sctp >> ../raw/sctp_i.csv
      #sleep 2s
      iperf3 -c ${IPAD} -i 0.5 -t 10 >> ../raw/tcp_i.csv
      sleep 2s
      iperf3 -c ${IPAD} -i 0.5 -t 10 --udp >> ../raw/udp_i.csv
      sleep 2s
      #a=`cat ../raw/sctp_i.csv | awk '{print$7}'`$'\n'
      b=`cat ../raw/tcp_i.csv | awk '{print$7}'`$'\n'
      c=`cat ../raw/udp_i.csv | awk '{print$7}'`$'\n'
      d=`cat ../raw/udp_i.csv | awk '{print$9}'`$'\n'
      # c=`cat ../raw/udp_i.csv | awk '{print$7}'`$'\n'
      #ovs=`cat ../raw/sctp_i.csv | grep "receiver" | awk '{print$7}'`$'\n'
      ovt=`cat ../raw/tcp_i.csv | grep "receiver" | awk '{print$7}'`$'\n'
      ovu=`cat ../raw/udp_i.csv | grep "receiver" | awk '{print$7}'`$'\n'
      ovj=`cat ../raw/udp_i.csv | grep "receiver" | awk '{print$9}'`$'\n'

#      echo "$a" > sctp_i4_${ENB}.csv
      echo "$b" > tcp_i4_${ENB}.csv
      echo "$c" > udp_i4_${ENB}.csv
      echo "$d" > udp_jitter_i4_${ENB}.csv
#      echo "$ovs" > sctp_ovr4_${ENB}.csv
      echo "$ovt" > tcp_ovr4_${ENB}.csv
      echo "$ovu" > udp_ovr4_${ENB}.csv
      echo "$ovj" > udpj_ovr4_${ENB}.csv
   done
#   rm ../raw/sctp_i.csv
   rm ../raw/tcp_i.csv
   rm ../raw/udp_i.csv

elif [[ $CLT == 4 ]]
then
    echo
    echo "subhanallah"
fi
