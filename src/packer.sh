#!/bin/bash

pacman -S fakeroot jshon expac git wget --noconfirm -Sy

cd /tmp
wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer
mv PKGBUILD\?h\=packer PKGBUILD
makepkg
pacman -U packer-*.pkg.tar.xz --noconfirm

