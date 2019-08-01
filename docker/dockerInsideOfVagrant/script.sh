#!/usr/bin/env bash


#sudo su - stack
sudo apt-get update -y

sudo apt-get install apt-transport-https ca-certificates

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

cd /etc/apt/sources.list.d

ls

