# ECE576A
Engineering of Computer Based Systems

## What is this project
This project aims to create a safe virtual environment to create a functioning DNS. This environment is planned to be easily integrated into a real server room, but allows for testing new softwares and potentially unsafe configurations without worrying about accidentally enabling something on a live network.

## How to run the project
### 1) prerequisites

* vagrant
* git
* *byobu & screen

** means optional*
### 2) clone repository and run vagrant
```bash
sudo apt install -y vagrant virtualbox
git clone https://github.com/mitchdz/ECE576A
cd ECE576A
vagrant up
```

I personally chose to use byobu with screen as the backend to manage the vagrant VMs. To do this, run the following:
```bash
./byobu_screen_sessions.sh
```

Make sure that you have byobu and screen installed. use byobu-choose-backend to configure byobu to use screen.

to exit the byobu session press `Ctrl+a` and then `d`


## Table of Virtual Machines
Vagrant is used to simulate the DNS network. The Vagrantfile provided spins up multiple VMs which are configured in the following manner:

| IP addr | Distribution | Purpose | Services |
| --- | --- | --- | -- |
| 192.168.120.8 | Ubuntu 20.04 | dns | bind9, isc-dhcp-server, heartbeat |
| 192.168.120.9 | Ubuntu 20.04 | dns-backup | same as dns |
| 192.168.120.100 | Ubuntu 20.04 | internal-test | network tools |
| 192.168.120.101 | Ubuntu 20.04 | webserver | apache2 |
| 192.168.121.10 | Ubuntu 20.04 | external-test | network tools|
