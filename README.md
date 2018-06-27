# My Kali L inux distribution 

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
* In this manual I will try to explain step by step how to create two variants of Kali linux - with i3wm and openbox window managers. 
* And last but not least I always wanted to take part in some opensource project and do some "development"


## My Custom Kali Linux with i3wm or openbox

* I did my first setup based on the official kali documentation for [live-build-config](https://docs.kali.org/development/live-build-a-custom-kali-iso)

##### 1. Install new Kali Linux and you can use any official Kali image
##### 2. Install additional packages that will be needed

```
apt install curl git live-build cdebootstrap
git clone git://git.kali.org/live-build-config.git

cd live-build-config
```

##### 3. Start hacking i3wm/openbox variant :-)

  * For i3 I started with making my modifications in the `variant-i3wm` folder. 
  * For openbox I copied `variant-i3wm` folder to `variant-openbox` and add my modifications to it. 
  * Edit the file `kali-config/<VARIANT>/package-lists/kali.list.chroot` and add there the required packages you want. My list of packages is in file [here](variant-i3wm/package-lists/kali.list.chroot), for openbox use [this](variant-openbox/package-lists/kali.list.chroot)
  * Add configs for live cd and for root fs. 
  * All config files for livecd should be copied to: `kali-config/common/includes.chroot/root/`. 
  * All config files for installed file system should be copied to: `kali-config/common/includes.chroot/etc/skel/`. 
  * For example I added files: 
    * `kali-config/common/includes.chroot/root/.conkyrc`
    * `kali-config/common/includes.chroot/root/.config/i3/config`
  * For Openbox some example files: 
    * `kali-config/common/includes.chroot/root/.conkyrc`
    * `kali-config/common/includes.chroot/root/.config/openbox/autostart`
    * `kali-config/common/includes.chroot/root/.config/openbox/menu.xml`
    * `kali-config/common/includes.chroot/root/.config/openbox/rc.xml`
    * `kali-config/common/includes.chroot/root/.config/tint2/tint2rc`
  * My example config files for i3wm can be found [here](./i3/etc/skel/)
  * My example config files for openbox can be found [here](./openbox/etc/skel/)
  * I added firefox developer edition browser by adding downloading install package and unpacking it into `kali-config/common/includes.chroot/opt/firefox/`
  * I added also shell script `kali-config/common/includes.chroot/usr/bin/firefox.sh` for starting firefox. 

```

#!/bin/bash 

echo "Starting firefox developer edition"
/opt/firefox/firefox 

```

##### 4. Build ISO

```
sudo ./build.sh --distribution kali-rolling --variant i3wm --verbose
sudo ./build.sh --distribution kali-rolling --variant openbox --verbose
```

* Wait for the job to finish. In my case it was usually around 3-5 hours. 
* ISO file will be generated in `images` subfolder. 


## Recommended post install setup

* I decided to install few packages after completing the instalation to hard drive. For example when I added pcmanfm to the list of packages to generate iso I was getting system with preinstalled LXqt. Probably scripts install also some recommended packages not only the dependencies. 

```
apt install lxappearance pcmanfm smplayer mplayer mpv vlc audacious lxinput lxrandr xarchiver galculator gpicview evince retext scite
```



