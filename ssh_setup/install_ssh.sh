# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_ssh.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mikim <mikim@student.42.us.org>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/09/23 21:44:48 by mikim             #+#    #+#              #
#    Updated: 2018/09/23 21:44:55 by mikim            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#                                                               Mingyun Kim    #
#                                            https://www.github.com/mikim42    #
# **************************************************************************** #

#!/bin/bash

# update and upgrade
sudo apt-get update -y
sudo apt-get upgrade -y

# install ssh
sudo apt-get install openssh-server -y
