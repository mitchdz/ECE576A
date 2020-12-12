#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y net-tools apache2

## install rootfs
cp -r /vagrant/rootfs/webserver_rootfs/* / &> /dev/null || :
