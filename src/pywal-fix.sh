#!/bin/bash
sudo pacman -Rs python-pywal --noconfirm
sudo pacman -Sy python-pip --noconfirm
sudo pip install pywal==3.1.0

NAME=$(whoami)
firefox -CreateProfile $NAME

if [ ! -f "/home/$NAME/dotfiles/userChrome.css" ]; then
	cd /home/$NAME/dotfiles/
	wget https://raw.githubusercontent.com/vegarab/dotfiles/master/userChrome.css
fi

cd /home/$NAME/.mozilla/firefox/*.default/

if [ ! -d "chrome" ]; then
	mkdir chrome
fi

P1=$(pwd)
sudo ln -s /home/$NAME/dotfiles/userChrome.css $P1/chrome/userChrome.css

packer -S oomox --noconfirm
