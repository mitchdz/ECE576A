#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y bind9 heartbeat isc-dhcp-server

## install rootfs
cp -r /vagrant/rootfs/dns-backup_rootfs/* / &> /dev/null || :
