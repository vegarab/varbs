#!/bin/bash
sudo pacman -S fakeroot jshon expac git wget --noconfirm

cd /tmp
wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer
mv PKGBUILD\?h\=packer PKGBUILD
makepkg
sudo pacman -U packer-*.pkg.tar.xz --noconfirm
