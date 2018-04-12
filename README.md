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

### Setup 

```
sudo apt-get install xserver-xorg-core sddm 

sudo apt-get install icewm
sudo reboot 

```

* login in gui  :-) 

