# About Kali Linux Custom DWM Openbox i3wm edition by Jacek 


|Feature           |Description                                                                         |
|------------------|------------------------------------------------------------------------------------|
|Livecd user/pass  |root/toor                                                                           |
|GUI sessions      |All variants have: DWM (stock), Custom-DWM, Openbox or i3                           |
|DWM stock ModKey  |Alt                                                                                 |
|DWM custom ModKey |Win                                                                                 |
|i3wm ModKey       |Win                                                                                 |
|Openbox ModKey    |Win                                                                                 |
|DWM terminal      |ModKey + Shift + Enter (Win + Shift + Enter)                                        |
|DWM Dmenu         |ModKey + p (Win + p)                                                                |
|DWM exit          |ModKey + Shift + q (exits to lightdm)                                               |
|i3 exit           |ModKey + Shift + e (exits to lightdm)                                               |
|i3 poweroff       |ModKey + Shift + p (shuts down the system)                                          |
|Openbox terminal  |Win + Enter                                                                         |
|Openbox Dmenu     |Alt + F3                                                                            |
|i3wm terminal     |Win + Enter                                                                         |
|i3wm Dmenu        |Win + d                                                                             |
|Network Manager   |nmtui, nm-applet                                                                    |
|Volume Control    |pavucontrol                                                                         |
|Power Manager     |mate-power-manager, upower -i /org/freedesktop/UPower/devices/battery_BAT0          |
|WWW browser       |Firefox Developer Edition, run Dmenu and type firefox.sh                            |
|tox client        |toxic (only 64 bit ISO)                                                             |
|Kali tools        |only meta package kali-linux-top10 is installed                                     |

* ISO Variants

|Variant           |Description                                                                         |
|------------------|------------------------------------------------------------------------------------|
|live_dwm          |In LiveCD mode only one session can be used. Switching of sessions in livecd doees not work always, it is not stable, At installed system you can switch Xsessions at Lightdm Login screen |
|dwm_openbox_i3_no_lightdm |There is no lightdm installed but you can switch Xsessions using startup scripts: ./start-dwm.sh,./start-openbox.sh, ./start-i3.sh                                               |

* Customization manual for DWM is [here](./debian-dwm.md).
* More information/help about dwm can be found at [http://suckless.org](http://suckless.org).
* To install other Kali tools use these meta packages: kali-linux-full, kali-linux-all, kali-linux-sdr, kali-linux-gpu, kali-linux-wireless, kali-linux-web, kali-linux-forensic, kali-linux-voip, kali-linux-pwtools, kali-linux-top10, kali-linux-rfid

* Main gui applications and packages: 

```
#text editors
pluma
geany

#office apps
gpicview
evince
galculator
xarchiver

#terminals
xterm 
mate-terminal
terminator

#web apps
chromium
falkon
youtube-dl

#development
meld
git

#file managers
ranger
caja

#system tools 
lxrandr
lxinput
pulseaudio
udiskie
network-manager
network-manager-gnome
clipit
mate-power-manager
xscreensaver
mate-system-monitor

#audio video
mpv
smplayer
audacious

#other
plank


```

* Full list of packages for variant: [dwm_openbox_i3](./variant-dwm_openbox_i3/package-lists/kali.list.chroot)


## Download

* ISO images of this comunity edition are published at [Kali-Linux-openbox project at OSDN.net](https://osdn.net/projects/kali-lnux-openbox/storage/kali-linux-community-releases/)








