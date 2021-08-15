#!/bin/bash

blue() { printf "\n\033[0;34m $* \033[0m\n\n" && (echo $* >> /tmp/VARBS.log) ;}
red() { printf "\n\033[0;31m $* \033[0m\n\n" && (echo ERROR: $* >> /tmp/VARBS.log) ;}

NAME=$(whoami)

blue Activating Pulseaudio if not already active...
pulseaudio --start && blue Pulseaudio enabled...

#Install an AUR package manually.
aurinstall() { curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz && tar -xvf $1.tar.gz && cd $1 && makepkg --noconfirm -si && cd .. && rm -rf $1 $1.tar.gz ;}

#aurcheck runs on each of its arguments, if the argument is not already installed, it either uses packer to install it, or installs it manually.
aurcheck() {
qm=$(pacman -Qm | awk '{print $1}')
for arg in "$@"
do
if [[ $qm = *"$arg"* ]]; then
	echo $arg is already installed.
else 
	echo $arg not installed
	blue Now installing $arg...
	if [[ -e /usr/bin/packer ]]
	then
		(packer --noconfirm -S $arg && blue $arg now installed) || red Error installing $arg.
	else
		(aurinstall $arg && blue $arg now installed) || red Error installing $arg.
	fi

fi
done
}


blue Installing AUR programs...
blue \(This may take some time.\)

gpg --recv-keys 5FAF0A6EE7371805 #Add the needed gpg key for neomutt

aurcheck packer vim-pathogen tamzen-font-git neomutt unclutter-xfixes-git  xfce-theme-blackbird fzf-git arc-gtk-theme ttf-monaco || red Error with basic AUR installations...

#packer --noconfirm -S ncpamixer-git speedometer cli-visualizer

choices=$(cat /tmp/.choices)
for choice in $choices
do
    case $choice in
    1)
		aurcheck vim-live-latex-preview
      	;;
	6)
		aurcheck ttf-ancient-fonts
		;;
	7)
		aurcheck transmission-remote-cli-git
		;;
	8)
		aurcheck bash-pipes cli-visualizer speedometer neofetch
		;;
    esac
done
cat << "EOF"

         ▄              ▄
        ▌▒█           ▄▀▒▌
        ▌▒▒▀▄       ▄▀▒▒▒▐
       ▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐
     ▄▄▀▒▒▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐
   ▄▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀██▀▒▌
  ▐▒▒▒▄▄▄▒▒▒▒▒▒▒▒▒▒▒▒▒▀▄▒▒▌
  ▌▒▒▐▄█▀▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐
 ▐▒▒▒▒▒▒▒▒▒▒▒▌██▀▒▒▒▒▒▒▒▒▀▄▌
 ▌▒▀▄██▄▒▒▒▒▒▒▒▒▒▒▒░░░░▒▒▒▒▌
 ▌▀▐▄█▄█▌▄▒▀▒▒▒▒▒▒░░░░░░▒▒▒▐
▐▒▀▐▀▐▀▒▒▄▄▒▄▒▒▒▒▒░░░░░░▒▒▒▒▌
▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒░░░░░░▒▒▒▐
 ▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒▒▒░░░░▒▒▒▒▌
 ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐
  ▀▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▒▒▒▒▌
    ▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀
   ▐▀▒▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀
  ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀▀

EOF



browsers=$(cat /tmp/.browch)
for choice in $browsers
do
	case $choice in
		3)
			gpg --recv-keys 865E6C87C65285EC #Key required for Palemoon install.
			aurcheck palemoon-bin
			;;
		4)
			aurcheck waterfox-bin
			;;
	esac
done

mkdir -p /home/$NAME/.local/src
cd /home/$NAME/.local/src
git clone https://github.com/vegarab/dwm.git dwm
git clone https://github.com/vegarab/st.git st
git clone https://github.com/vegarab/dwmblocks.git dwmblocks

cd /home/$NAME/.local/src/dwm
sudo make install
cd /home/$NAME/.local/src/st
sudo make install
cd /home/$NAME/.local/src/dwmblocks
sudo make install

blue Downloading config files...
cd /home/$NAME/
git clone https://github.com/vegarab/dotfiles.git dotfiles
sudo rm -r .config .vimrc .vim .bashrc .xinitrc .Xresources .Xmodmap .gtkrc-2.0 .Xdefaults
sudo ln -s /home/$NAME/dotfiles/.config /home/$NAME/.config
sudo ln -s /home/$NAME/dotfiles/.vimrc /home/$NAME/.vimrc
sudo ln -s /home/$NAME/dotfiles/.vim /home/$NAME/.vim
sudo ln -s /home/$NAME/dotfiles/.bashrc /home/$NAME/.bashrc
sudo ln -s /home/$NAME/dotfiles/.bash_aliases /home/$NAME/.bash_aliases 
sudo ln -s /home/$NAME/dotfiles/.xinitrc /home/$NAME/.xinitrc 
sudo ln -s /home/$NAME/dotfiles/.Xmodmap /home/$NAME/.Xmodmap 
sudo ln -s /home/$NAME/dotfiles/.Xdefaults /home/$NAME/.Xdefaults 
sudo ln -s /home/$NAME/dotfiles/.gtkrc-2.0 /home/$NAME/.gtkrc-2.0
sudo ln -s /home/$NAME/dotfiles/.xprofile /home/$NAME/.xprofile
sudo ln -s /home/$NAME/dotfiles/.local/bin /home/$NAME/.local/bin
sudo ln -s /home/$NAME/dotfiles/.themes /home/$NAME/.themes

mkdir /home/$NAME/docs
mkdir /home/$NAME/dev
mkdir /home/$NAME/pics
mkdir /home/$NAME/dl

blue Generating bash/ranger/qutebrowser shortcuts...
cd /home/$NAME/
python /home/$NAME/.config/Scripts/shortcuts.py
                                                               
