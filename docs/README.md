# Vegar's Auto-Rice Bootstrapping Scripts (VARBS)
[A fork of Luke's Auto-Rice Bootstraping Scripts (LARBS)](http://larbs.xyz)

This is a set of scripts either can automatically
install and configure all of the prerequisites for an advanced Linux desktop
environment, using my configs [here](https://github.com/vegarab/dotfiles)
as a base.

All scripts are based on an early version of [LARBS](#larbs) (15. December
2017)


## Table of Contents

 - [About](#about)
 - [Installation](#installation)
 - [How to Use](#how-to-use)
 - [Permission Details (sudoers file)](#permission-details-sudoers-file)
 - [Version](#version)
 - [Why I made this](#why-i-made-this)
 - [Bugs?](#bugs)


## About

The goal of these scripts is for me to quickly setup my Linux
"meta-distribution" quickly and reliably. [LARBS](http://larbs.xyz) made a great foundation for
this, but the newer versions has added features that I don't need nor want. 

All the core stuff we be installed without prompt, but you'll have the option
to install some of the larger non-essential packages (LaTeX, LibreOffice,
Blender, etc.).


## Installation on an already existing Arch install

This is easy. Log in as the root user and run the following.

```sh
curl -LO http://vegarab.com/varbs.sh #Downloads the script.
bash varbs.sh #Runs it.
```

After prompting you for some settings and some package choices, the system will
install my full DWM tiling window manager Desktop Environment.

Finally, it will use `git` to download my
[Dotfiles](https://github.com/vegarab/dotfiles)
dotfiles and will plop them in their proper location for instant use!

Then, finally, once that all is done, you should be able to log out, then log in
as your newly created user and type `startx` to begin the graphical environment.
Congrats!


## Permission Details (sudoers file)

These script will give your new created user (and those others you put in the
`wheel` group) sudo access (with a password), but will also allow some commands
to be run without any password confirmation. Those include:

+ `shutdown`
+ `reboot`
+ `pacman -Syyu`/`pacman -Syu`
+ `packer -Syyu`/`packer -Syu`
+ `mount`
+ `umount`
+ `systemctl restart NetworkManager`

Additionally, if you've put your password in a terminal window already, you will
not need to repeat putting it in in other terminal windows.


## Version

This is basically not a v.1.0 yet, need some more testing and feature to
justify that. This is pretty much made for personal use, so don't expect too
much new stuff. You should check out [LARBS](http://larbs.xyz) if you want more
of a polished "distribution" of Arch. If the script fails, check the 
contents of VARBS.log in whatever directory you've run the script. Still, this 
script is still in the Wild West, so it is only recommended running it on fresh installs.


## Why I made this

I found [LARBS](http://larbs.xyz) to be a great tool for setting up a
rice/configuration on a fresh Arch install. However, newer versions of 
[LARBS](http://larbs.xyz) conflicted with some of my personal configurations,
making me uninstall or totally change some of the settings that [LARBS](http://larbs.xyz) apply. 

This is a fork of [LARBS](http://larbs.xyz) from December 2017. If Luke adds
some nice features I want to [LARBS](http://larbs.xyz), I might merge those
changes to VARBS as well.. 

## Bugs?

### When I type `startx` I get some kind of non-descript error!

Some computers might require some additional drivers to run a graphical
environment, for example, some ThinkPads might require you to install
`xf86-video-intel`. If you search your model or graphics card along with "Arch
Linux" on your preferred search engine, you'll probably get the answer fast.

### I have some other problem and it didn't install correctly.

In normal circumstances, there are two main causes of miss-installs: faulty
internet connections and errors with particular package upgrades or with the
pacman keyring. Check yourself if the former may be at fault, but feel free to
inform me in the latter case; I may be able to provide a quick fix.

