#!/bin/bash

# RAW=`locate test/getdata | grep "/test/getdata/raw"`
cd res
for ((z=1; z<=100; z++)) 
do
   echo "$z"
   mpstat >> ../raw/cpu.csv
   free -m >> ../raw/mem.csv
   a=`cat ../raw/cpu.csv | grep "all" | awk '{print$12}'`$'\n'
   b=`cat ../raw/mem.csv | grep "Mem" | awk '{print$3}'`$'\n'

   echo "$a" > cpu_idle_4.csv
   echo "$b" > mem_usage_4.csv
   sleep 1s
done
rm ../raw/cpu.csv
rm ../raw/mem.csv
