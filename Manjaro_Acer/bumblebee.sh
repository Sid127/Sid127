#!/bin/bash
linuxstring=linux$(uname -r | cut -d '.' -f-2 | tr -d .)

if [ "$1" = "--install" ] || [ "$1" = "-i" ]; then
	sudo pacman -S primus bumblebee $linuxstring-bbswitch primus_vk lib32-primus lib32-primus_vk
	sudo gpasswd -a $(whoami) bumblee
	sudo systemctl enable bumblebeed

	echo "Bumblebee will be enabled after a restart"
elif [ "$1" = "--uninstall" ] || [ "$1" = "-u" ]; then
	sudo systemctl disable bumblebeed
	sudo pacman -R primus bumblebee $linuxstring-bbswitch primus_vk lib32-primus lib32-primus_vk

	echo "Bumblebee has been disabled and uninstalled, please restart for changes to take full effect."
else
	echo "Please type -i or --install to install bumblebee, or -u or --uninstall to uninstall bumblebee."
fi
