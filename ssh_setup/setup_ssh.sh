# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup_ssh.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mikim <mikim@student.42.us.org>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/09/23 22:12:10 by mikim             #+#    #+#              #
#    Updated: 2018/09/23 22:35:59 by mikim            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#                                                               Mingyun Kim    #
#                                            https://www.github.com/mikim42    #
# **************************************************************************** #

#!/bin/bash

# getting permission
su

# make a backup
cp /etc/network/interfaces /etc/network/interfaces-backup

# append
# first 3 part of IP address should be equal to the vboxnet0 addr
# last one sho4uld be different from that
# ex. same.same.same.diff
echo "auto enp0s8" >> /etc/network/interfaces
echo "iface enp0s8 inet static" >> /etc/network/interfaces
echo address $1 >> /etc/network/interfaces
echo "netmask 255.255.255.0" >> /etc/network/interfaces

# change the port number
# private port number 49152 ~ 65535
# -i command creates backups
sed -i "s/^#\?Port .*/Port 50100/g" /etc/ssh/sshd_config

# run ssh server
ifup enp0s8
service sshd restart
service ssh restart

# exit su
exit
