# My Custom Kali Linux distribution 

* The goal of this project is to create custom debian or debian based distribution iso
* This repo is a place for manuals, scripts and configs. 

#### My story 

I spent a lot of time on searching for a Linux distribution that was best suited for my needs. I wanted a very lightweight system. I tested almost all variants of Manjaro (except Gnome and KDE), Debian, Ubuntu, Sparky, MX Linux, Antix, Arch, Anarchy, Antergos Archlabs, Bunsen Labs, and many more. I played around with different desktops: XFCE, LXDE, Mate, LXqt, i3, openbox, fluxbox, jwm, and icewm. I still wasn't satisfied.

It started to become clear that I needed a rolling release Linux that was not only lightweight, but also had good support from either a company or community. I made a long list of my favorite linux distributions, but I still couldn't decide. 

I had always wanted to take part in an opensource project and do a little development. It occurred to me that my solution could be to simply create my own setup - I could take a linux distro, install a base os, and customize it. 

But what would happen if I needed to reinstall? I didn't want to have to start over again on customizing my installed system. I knew I wanted to create an ISO that I could use to install anytime, anywhere. It would be perfectly customized for my needs out on a fresh install. I started to looking for way of customizing Debian, arch, or manjaro, and I found Kali Linux live-build config scripts. I knew I had found my solution. 

Kali Linux is a rolling distro, based on debian, and has great support from the  Offensive Security team as well as an active community. I also found existing scripts for i3wm. That was my starting point. I started playing with the custom packages list and later on with some chroot files to be included in the ISO. I generated over 20 ISO images until I had one I was happy with, and I am still continuing to improve on it.

In this post I will try to explain how to create two variants of Kali linux - one with i3wm and one with Openbox window manager. 

## Custom Kali Linux with i3wm or openbox

* I did my first setup based on the official Kali documentation for [live-build-config](https://docs.kali.org/development/live-build-a-custom-kali-iso)

##### 1. Install Kali Linux. Use any official Kali image
##### 2. Install additional packages

```
apt install curl git live-build cdebootstrap
git clone git://git.kali.org/live-build-config.git

cd live-build-config
```

##### 3. Start hacking i3wm/openbox variant

  * For i3 I started with making my modifications in the `variant-i3wm` folder. 
  * For openbox I copied `variant-i3wm` folder to `variant-openbox` and added my modifications to it. 
  * Edit the file `kali-config/<VARIANT>/package-lists/kali.list.chroot` and add the required packages you want. My list of packages is in file [here](variant-i3wm/package-lists/kali.list.chroot), for openbox use [this](variant-openbox/package-lists/kali.list.chroot)
  * Add configs for livecd and for the target installed file system. 
  * All config files for livecd should be copied to: `kali-config/common/includes.chroot/root/`. This directory is used by livecd as the livecd environment is running as root user. 
  * All config files for installed file system should be copied to: `kali-config/common/includes.chroot/etc/skel/`. '/etc/skel' directory in commonly used as a template for creating user home directories, so every new user will by default have the files that are located in this directory. 
  * Nitrogen is an application used to setup wallpaper. The file `.config/nitrogen/bg-saved.cfg` defines the set wallpaper. The second file `.config/nitrogen/nitrogen.cfg` is the main configuration file for nitrogen and defines the direcories where the wallaper images are located. 
  * Power manager applet is configured by file `.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml`
  * For i3wm I added files: 
    * `kali-config/common/includes.chroot/root/.i3wm_conkyrc`
    * `kali-config/common/includes.chroot/root/.config/i3/config`
  * For Openbox I added files: 
    * `kali-config/common/includes.chroot/root/.openbox_conkyrc` - configuration for conky. 
    * `kali-config/common/includes.chroot/root/.config/openbox/autostart` - openbox autostart file.
    * `kali-config/common/includes.chroot/root/.config/openbox/menu.xml` - openbox menu.
    * `kali-config/common/includes.chroot/root/.config/openbox/rc.xml` - openbox window manager themes and keybindings. 
    * `kali-config/common/includes.chroot/root/.config/tint2/tint2rc` - tint2 panel settings, and launchers, I added here my most commonly used tools: terminal, editors, web browsers.
  * My example config files for i3wm can be found [here](./i3/etc/skel/)
  * My example config files for openbox can be found [here](./openbox/etc/skel/)
  * I added the Firefox developer edition browser by downloading the install package and unpacking it into `kali-config/common/includes.chroot/opt/firefox/` and then added the toxic tox client to `kali-config/common/includes.chroot/opt/toxic`. 
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

* Wait for the job to finish. In my case it took about 3 hours. 
* The ISO file will be generated in the `images` subfolder. 


## Recommended post install setup

I decided to install a few packages after completing the installation. I noticed that when I added pcmanfm to the list of packages to generate an ISO, I got a system with preinstalled LXqt. It seems likely that some scripts install more than the bare minimum, and will include recommended packages.

```
apt install lxappearance pcmanfm smplayer mplayer mpv vlc audacious lxinput lxrandr xarchiver galculator gpicview evince retext scite
```

## Final version 

In the final version of the configs, I decided to port my i3wm install to my openbox build. This way, when building the openbox config, I am getting both window managers, openbox and i3. On the login screen I can select the session I want.

## Issues and solutions

#### Installing pcmanfm and getting the LXQT desktop 

This happened very early in the project. I decided to avoid the problem by not installing pcmanfm file manager

#### While installing, the installer complained that kernel modules did not match the installer kernel version. 

I started investigating the issue and wanted to get an updated Debian installer from Debian buster. The next day I found out that Kali linux was upgrading the kernel packages, but they had not updated the installer and netboot images yet. Two days later it was OK. Debian installer and netboot were updated at Kali linux repos and everything worked fine. The only negative was that I needed to rebuild the iso. 
