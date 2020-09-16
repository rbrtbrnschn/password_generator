#!/bin/bash

function remove_dir {
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
			remove_dir
			;;
	esac
}

function remove_installation {
	sudo rm -rf /usr/local/bin/password_generator/
	sudo rm -rf /usr/local/bin/pass-gen
	sudo rm -rf /usr/local/bin/database.csv
	sudo rm -rf /usr/local/bin/.database.csv
	echo "uninstall complete"
}

echo "You are uninstalling password_generator and \n removing your password database. \n Continue? [y/n]"
read BOO
case $BOO in
	[y] | [yY][eE][sS])
		remove_installation
		;;
	[n] | [nN][oO])
		exit 0
		;;
	*)
		echo "Please answer with y/yes or n/no"
		./uninstall.sh
		;;
esac
remove_dir
clear

