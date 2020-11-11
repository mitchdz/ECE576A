# ECE576A
Engineering of Computer Based Systems

How to run the project:
```bash
sudo apt install -y vagrant virtualbox
git clone https://github.com/mitchdz/ECE576A
cd ECE576A
vagrant up
```



## How to use this project
Vagrant is used to simulate the DNS network. The Vagrantfile provided spins up multiple VMs which are configured in the following manner:

| IP addr | Distribution | Purpose | Services |
| --- | --- | --- | -- |
| 192.168.120.2 | Ubuntu 20.04 | DNS | bind9, DHCP, failover |
| 192.168.120.3 | Ubuntu 20.04 | dev machine | network tools |
| 192.168.120.4 | Ubuntu 20.04 | webserver | apache |
| 192.168.121.2 | Ubuntu 20.04 | outside machine | network tools|
