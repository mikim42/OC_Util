# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    instruction.txt                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mikim <mikim@student.42.us.org>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/09/23 21:45:10 by mikim             #+#    #+#              #
#    Updated: 2018/09/23 22:37:15 by mikim            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#                                                               Mingyun Kim    #
#                                            https://www.github.com/mikim42    #
# **************************************************************************** #

How to SSH into VirtualBox Debian

# Only works on MAC OS. Sorry Windows users...
# Depends on computers, IP addresses can be different
# Debian default password: debian
# If you don't know password, try 'sudo passwd debian' and reset the password


1. Install VirtualBox Debian

# it might take a long time to update/upgrade your apps
2. Run following commands:
	sudo apt-get update -y
	sudo apt-get upgrade -y
	sudo apt-get install git -y
	git clone https://github.com/mikim42/ohlone_cs_util
	cd ohlone_cs_util
	sh install_ssh.sh

3. Shutdown the VM

4. Go to VirtualBox Manager,
	Global Tools > Host Network Manager
	Click Create button
	Make sure you have 'vboxnet0'
	Write down IPv4 (You need it on step 6)
		Ex. 192.168.56.10
	enable DHCP server

5. Click Debian OS and go to:
	Settings > System:
		Enable I/O APIC
	Settings > Network > Adapter 2:
		Enable Network Adapter
		attached to: Host-only Adapter
		name: vboxnet0

6. Power up Debian, run 'sh setup_ssh.sh <ip-addr>' in ohlone_cs_util dir

# if you don't have ssh, you can download
# 'sudo apt-get install openssh-server -y'

7. Go to Mac OS terminal, run 'ssh <debian-username>@<ip-address> -p 50100'
	Ex. 'ssh debian@192.168.56.10 -p 50100'

#
# ++ if you want to make a shortcut command to connect:

1. Go to Mac OS terminal, run following commands:
	ssh-keygen -t rsa
	ssh <debian-username>@<ip_addr> -p 50100 mkdir -p .ssh
	cat ~/.ssh/id_rsa.pub | ssh <debian-username>@<ip_addr> -p 50100 'cat >> .ssh/authorized_keys'

2. Go to Debian terminal, run following commands:
	cd
	cd .. # Yes, cd twice
	chmod 744 debian debian/.ssh debian/.ssh/authorized_keys
	sudo service sshd restart
	sudo service ssh restart

3. Go to Mac OS terminal, run following commands:
	cat "alias debian=ssh <debian-username>@<ip-addr> -p 50100" >> ~/.zshrc
	#	If you want another command, you can put that instead of debian

	source ~/.zshrc
	reset

4. Run 'debian' on your Mac terminal
