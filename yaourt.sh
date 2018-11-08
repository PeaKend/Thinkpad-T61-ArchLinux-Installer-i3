#!/bin/bash

if [[ $EUID -eq 0 ]]; then
	echo "you need to run this script as the user"
	exit 1
fi

repoName = "thinkpad-t61-archlinux-installer"

cd ~/

## Installs yaourt

git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..

clear

git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..

clear

rm -rf package-query
rm -rf yaourt
sudo rm -rf /etc/yaourtrc 

cd ~
git clone https://github.com/peakend/thinkpad-t61-archlinux-installer
cd thinkpad-t61-archlinux-installer/
sudo cp configs/yaourt/yaourtrc /etc/yaourtrc
cd ~ 
rm -rf $repoName/

mkdir /home/$userName/.tmp
clear
printf "Yaourt installed\n"
