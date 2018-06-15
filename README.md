# my-debian

* The goal of this project is to custom debian or debian based iso. 
* This repo is a place for manuals, scripts and configs. 
* I spent a lot of time on searching for Linux distribution that suites best for me. I wated to have a very lightweight system. 
* I was testing almost all variants of Manjaro (except Gnome and KDE), Debian, Ubuntu, Sparky, MX Linux, Antix, Arch, Anarchy, Antergos Archlabs, Bunsen Labs... and many many more. 
* I was playing around with different desktops, XFCE, LXDE, Mate, LXqt, i3, openbox, fluxbox, jwm, icewm. 
* After some time it started to be clear that I want a rolling release linux and it must be lightweight, and with a good support of some company or comunity. 
* I made a list of my favourites linux distributions but it was still long list, and I could not make a final choice. 
* Ithought, maybe I should create my own setup: Take some good linux distro and install base os and customize it. But what will happen if I will need to reinstall it? I will need to spend all this time again on customizing my nstalled system? No, I wanted to create a ISO, taht I could use to install anytime anywhere and it will be perfectly customized for my needs out of the box. 
* I started to looking for way of custmizing debian, arch or manjaro, and I found Kali Linux live-build-config scripts. That was it. 
* Kali Linux is a rolling distro, based on debian, and has a good support of Offensive Security. 
* I found also existing scripts for i3wm. That was my starting point. I start plaing with custom packages list and later on with some chroot files to be included in the ISO. 
* I generated over 18 ISO images untill I made this gret one with openbox . 
* In This manual I will try to explain step by step how to create two variants of Kali linux - with i3wm and openbox window managers. 

## My Custom Kali Linux with i3wm DRAFT

```

apt install curl git live-build cdebootstrap
git clone git://git.kali.org/live-build-config.git


cd live-build-config

nano kali-config/variant-i3wm/package-lists/kali.list.chroot


kali-desktop-common 
xorg
lightdm
slick-greeter
sudo
git 
curl 
mc
vim 
htop
terminator
falkon
chromium
feh
screenfetch
nitrogen 
openssh-server
apt-transport-https
pcmanfm
oxygen-icon-theme
live-build 
cdebootstrap


cd kali-config/common/includes.chroot/
mkdir opt/
cd opt/
git clone https://github.com/jacekkowalczyk82/my-debian.git
git clone https://jacek_kowalczyk@bitbucket.org/jacek_kowalczyk/walpapers.git
git clone git://git.kali.org/live-build-config.git


#./build.sh --distribution kali-rolling --verbose
#./build.sh --distribution kali-rolling --variant {gnome,kde,xfce,mate,e17,lxde,i3wm} --verbose
./build.sh --distribution kali-rolling --variant i3wm --verbose


``` 


## Setup OpenBox DRAFT

* https://www.youtube.com/watch?v=_FZCXVgiORA&t=1038s
* https://www.debian.org/doc/manuals/debian-handbook/sect.customizing-graphical-interface.en.html
* https://github.com/dwt1/dotfiles
* https://www.debian.org/CD/netinst/

* apt-get install openbox obconf obmenu lxterminal leafpad
* apt-get install iceweasel
* apt-get install lightdm 

* reboot the machine 
* apt-get install pcmanfm tint2 nitrogen  

* apt-get install gnome-backgrounds mate-backgrounds 
* nitrogen
* nano ~/.config/openbox/autostart.sh 

```
nitrogen --restore & 
tint2 & 

```
* apt-get install menu 
* apt-get install compton 
* mkdir ~/.config/compton/

* obmenu

* pasystray or xfce4-pulseaudio-plugin or volumeicon-alsa or mate-media (mate-volume-control-applet) or pnmixer
 

 
## Post install setup

* apt install lxappearance pcmanfm smplayer mplayer mpv vlc clementine audacious 



