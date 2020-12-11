#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "----------------------------------------------------------------------------------------------------------------"
echo ""
echo "	• ▌ ▄ ·.  ▄▄▄· ▐▄• ▄ 		User:		$(whoami)"
echo "	·██ ▐███▪▐█ ▀█  █▌█▌▪		Hostname:	$(hostname)"
echo "	▐█ ▌▐▌▐█·▄█▀▀█  ·██· 		Kernel:		$(uname -r)"
echo "	██ ██▌▐█▌▐█ ▪▐▌▪▐█·█▌		Shell:		$SHELL"	
echo "	▀▀  █▪▀▀▀ ▀  ▀ •▀▀ ▀▀		CPU:		$(sed -n 's/^model name[ \t]*: *//p' /proc/cpuinfo | uniq | sed ':a;N;$!ba;s/\n/, /g')"
echo ""
echo "----------------------------------------------------------------------------------------------------------------"

echo "Executing tasks:"

apt-get update
apt-get install curl
apt-get install htop
apt-get install python3
apt-get install python3-pip
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
apt-get update
apt-get install sublime-text
apt-get install tmux

echo "setting up git"
git config --global user.name "Maksymilian Potok"
git config --global user.email makspotok@gmail.com

echo "done!"
