#!/bin/bash
echo "update apt"
apt update

echo "install requirements"
apt install software-properties-common

echo -n -e " add repo?? [y/n] "
read VAR

if [[ $VAR == y ]]
then
  echo "add repo"
  add-apt-repository ppa:open5gs/latest

elif [[ $VAR == n ]]
then
  echo
  echo "okewes skip"
  echo
fi

echo "apt update"
apt update

echo "installing.."
apt install open5gs

echo -n -e " install webui?? [y/n] "
read WUI

if [[ $WUI == y ]]
then
  echo "**install webui**"
  echo
  curl -fsSL https://open5gs.org/open5gs/assets/webui/install | sudo -E bash -
  echo
  echo "apt update"
  apt update
  echo
  echo "donee.."

elif [[ $WUI == n ]]
then
  echo
  echo "okewes skip"
  echo
fi