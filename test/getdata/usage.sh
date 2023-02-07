#!/bin/bash

# RAW=`locate test/getdata | grep "/test/getdata/raw"`
cd res
echo -n -e "\nberapa kali iterasi? "
read ITR
for ((y=1; y<=${ITR}; y++)) 
do
   echo
   echo "itr = $y"
   for ((z=1; z<=10; z++))
   do
      echo "$z"
      mpstat >> ../raw/cpu.csv
      free -m >> ../raw/mem.csv
      sleep 1s
   done
   a=`cat ../raw/cpu.csv | grep "all" | awk '{print$12}'`$'\n'
   b=`cat ../raw/mem.csv | grep "Mem" | awk '{print$3}'`$'\n'
   echo "$a" > cpu_idle_enb2.csv
   echo "$b" > mem_usage_enb2.csv
   sleep 1s
done
echo "done"
echo
rm ../raw/cpu.csv
rm ../raw/mem.csv
