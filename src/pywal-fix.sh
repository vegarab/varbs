#!/bin/bash

pacman -Rs python-pywal --noconfirm
pacman -Sy python-pip --noconfirm
pip install pywal==3.1.0

NAME=$(whoami)
cd /home/$NAME/.mozilla/firefox/*.default/

if [ ! -d "chrome" ]; then
	mkdir chrome
fi

cp /home/$NAME/dotfiles/userChrome.CSS chrome/
packer -S oomox --noconfirm
