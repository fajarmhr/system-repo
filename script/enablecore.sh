#!/bin/bash
echo "This script will enable Open5Gs."
echo
read -s -p "Press ENTER to continue, or CTRL + C to exit"

echo
echo
echo "**** enabling mmed... ****"
sudo systemctl enable open5gs-mmed

echo "**** enabling sgwcd... ****"
sudo systemctl enable open5gs-sgwcd

echo "**** enabling smfd... ****"
sudo systemctl enable open5gs-smfd

echo "**** enabling amfd... ****"
sudo systemctl enable open5gs-amfd

echo "**** enabling sgwud... ****"
sudo systemctl enable open5gs-sgwud

echo "**** enabling upfd... ****"
sudo systemctl enable open5gs-upfd

echo "**** enabling hssd... ****"
sudo systemctl enable open5gs-hssd

echo "**** enabling pcrfd... ****"
sudo systemctl enable open5gs-pcrfd

echo "**** enabling nrfd... ****"
sudo systemctl enable open5gs-nrfd

echo "**** enabling ausfd... ****"
sudo systemctl enable open5gs-ausfd

echo "**** enabling udmd... ****"
sudo systemctl enable open5gs-udmd

echo "**** enabling pcfd... ****"
sudo systemctl enable open5gs-pcfd

echo "**** enabling nssfd... ****"
sudo systemctl enable open5gs-nssfd

echo "**** enabling bsfd... ****"
sudo systemctl enable open5gs-bsfd

echo "**** enabling udrd... ****"
sudo systemctl enable open5gs-udrd

echo "**** enabling webui... ****"
sudo systemctl enable open5gs-webui

echo "**** enabling scpd... ****"
sudo systemctl enable open5gs-scpd

echo
echo
echo "Done"
echo "Everything looks good to go!"