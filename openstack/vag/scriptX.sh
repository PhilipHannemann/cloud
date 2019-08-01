#!/usr/bin/env bash


#sudo su - stack
sudo apt-get update -y
sudo apt-get install git-core -y

sudo useradd -s /bin/bash -d /opt/stack -m stack
echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack
sudo su - stack

mkdir dev/
cd dev/

whoami

git clone https://git.openstack.org/openstack/devstack -b stable/ocata
cd devstack

echo '[[local|localrc]]
HOST_IP=171.168.33.10
SERVICE_HOST=127.0.0.1
DATABASE_PASSWORD=cloud
ADMIN_PASSWORD=cloud
MYSQL_PASSWORD=cloud
RABBIT_PASSWORD=cloud
SERVICE_PASSWORD=cloud
SWIFT_HASH=cloud
SERVICE_TOKEN=tokentoken
LOGDAYS=1
LOGFILE=/opt/stack/logs/stack.sh.log
enable_service s-proxy s-object s-container s-account 
disable_service n-net
enable_service q-svc
enable_service q-agt
enable_service q-dhcp
enable_service q-l3
enable_service q-meta
enable_service q-metering
enable_service neutron

' > local.conf

sudo chown -R vagrant ..
sudo chmod 777 .

./stack.sh

neutron subnet-update public-subnet --dns_nameservers list=true 8.8.8.8
neutron subnet-update private-subnet --dns_nameservers list=true 8.8.8.8

nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0
nova secgroup-add-rule default tcp 22 22 0.0.0.0/0
nova secgroup-add-rule default tcp 80 80 0.0.0.0/0


#git config –global url.”https://&#8221;.insteadOf git://
#export no_proxy=127.0.0.1,171.168.33.10

