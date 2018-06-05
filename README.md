# my-debian
* manuals, scripts to create my own custom debian iso

## My Setup 

* Install debian server from https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.4.0-amd64-netinst.iso 
* Language: English 
* Location: Poland
* locales: en_US.UTF-8
* Keymap: Polish 
* Hostname
* domain name
* Setup root password
* Create user
* Do partitioning 
* Configure package manager
* Mirror: Poland, ftp.pl.debian.org
* No proxy 
* Package usage survey: yes

* Software selection 
  * unmark Debian Desktop environment
  * mark SSH Server
* Install grub boot loader to MBR /dev/sda


## First boot 

```
apt-get update
apt-get dist-upgrade

apt-get install byobu htop mc vim curl sudo git 
usermod -aG sudo kowalczy 
reboot 


```

## Setup gui iceWM

* https://www.debian.org/doc/manuals/debian-handbook/sect.customizing-graphical-interface.en.html
* apt-get install xserver-xorg-core gdm
* apt-get install xserver-xorg-core sddm
* http://wiki.debian.org/DisplayManager
* http://wiki.debian.org/WindowManager
* http://wiki.debian.org/Xorg

### Setup iceWM

```
sudo apt-get install xserver-xorg-core sddm 

sudo apt-get install icewm
sudo reboot 

```

* login in gui  :-) 

### Add support for virtualbox guest os 

```
sudo apt-get install build-essential module-assistant linux-headers-amd64 linux-headers-`uname -r`
```

* Mount Virtualbox Additions Iso 
```
cd /media/cdrom0
sudo mount /dev/cdrom /media/cdrom0
ls
sudo sh VBoxLinuxAdditions.run 
sudo reboot 

```
* after login I got 
```
VBoxClient: Failed to execurte the xrandr utility. 
```
* `sudo apt-get install x11-xserver-utils`
* reboot 



## My Custom Kali Linux with i3wm 

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


## Setup OpenBox

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
 
