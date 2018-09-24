# How to SSH into VirtualBox Debian

Setting up SSH between Mac OS and VirtualBox Debian
If you are using a different Debian source, it might not work

## Getting Started

Only works on MAC OS. Sorry Windows users...
Depends on computers, IP addresses can be different
Debian default password: debian
If you don't know password, reset the password with following commands:
```
sudo passwd debian
sudo passwd root
```

### Prerequisites

You need to install GIT and SSH on both Mac OS and Debian
```
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install git openssh-server -y
```

### Installation

1. Run following commands on your Debian:
```
git clone https://github.com/mikim42/ohlone_cs_util
cd ohlone_cs_util
sh install_ssh.sh
```

2. Shutdown the VM

3. Go to VirtualBox Manager,
	- Global Tools > Host Network Manager
	- Click Create button
	- Make sure you have 'vboxnet0'
	- Write down IPv4 (You need it on step 6)
		- Ex. 192.168.56.10
	- enable DHCP server

5. Click Debian OS and go to:
	- Settings > System:
		- Enable I/O APIC
	- Settings > Network > Adapter 2:
		- Enable Network Adapter
		- attached to: Host-only Adapter
		- name: vboxnet0

6. Power up Debian, run following command on your Debian:
```
cd ohlone_cs_util
sh setup_ssh.sh <ip-addr>
```

## Usage

Run following command on your Mac OS:
```
ssh <debian-username>@<ip-address> -p 50100
Ex. ssh debian@192.168.56.10 -p 50100
```

### Shortcut

If you want to make a shortcut command for SSH connection

1. Run following commands on your Mac OS:
```
ssh-keygen -t rsa
ssh <debian-username>@<ip-addr> -p 50100 mkdir -p .ssh
cat ~/.ssh/id_rsa.pub | ssh <debian-username>@<ip_addr> -p 50100 'cat >> .ssh/authorized_keys'
```

2. Run following commands on your Debian:
```
cd
cd ..
chmod 744 debian debian/.ssh debian/.ssh/authorized_keys
sudo service sshd restart
sudo service ssh restart
```

3. Run following commands on your Mac OS:
```
cat "alias debian=ssh <debian-username>@<ip-addr> -p 50100" >> ~/.zshrc
```
> If you want another command, you can put that instead of debian
```
source ~/.zshrc
reset
```

4. Run the shortcut command on your Mac OS

## Author

* **Mingyun Kim** - [mikim42](https://github.com/mikim42)
