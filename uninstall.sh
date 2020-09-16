#!/bin/bash
sudo rm -rf /usr/local/bin/password_generator/
sudo rm -rf /usr/local/bin/pass-gen
sudo rm -rf ~/database.csv
sudo rm -rf ~/.database.csv

echo "uninstall complete"
echo "Remove Current Directory? [y/n]"
read BOO

case $BOO in
	[y] | [yY][eE][sS])
		PWD=$(pwd)
		sudo rm -rf "$PWD"
		cd ..
		;;
	[n] | [nN][oO])
		:
		;;
	*)
		echo "Please answer with y/yes or n/no"
		./uninstall.sh
		;;
esac
clear

