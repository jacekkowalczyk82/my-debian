# About Kali Linux Custom DWM Openbox i3wm edition by Jacek 


|Feature           |Description                                                                         |
|------------------|------------------------------------------------------------------------------------|
|Livecd user/pass  |root/toor (kali/kali)                                                               |
|GUI sessions      |DWM (stock), Custom-DWM, Openbox, i3, XFCE                                          |
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
|Power Manager     |xfce4-power-manager, upower -i /org/freedesktop/UPower/devices/battery_BAT0         |
|WWW browser       |Firefox, run Dmenu and type firefox                                                 |
|Kali tools        |only meta package kali-linux-top10 is installed                                     |

* ISO Variants

|Variant           |Description                                                                         |
|------------------|------------------------------------------------------------------------------------|

Switching of sessions in with lightdm does not work always, it is not stable. Lightdm is installed but this system is booting to multi user mode and user can 
start X11 using startgui command. 

* Customization manual for DWM is [here](./debian-dwm.md).
* More information/help about dwm can be found at [http://suckless.org](http://suckless.org).
* To install other Kali tools use these meta packages: kali-linux-full, kali-linux-all, kali-linux-sdr, kali-linux-gpu, kali-linux-wireless, kali-linux-web, kali-linux-forensic, kali-linux-voip, kali-linux-pwtools, kali-linux-top10, kali-linux-rfid

* Main gui applications and packages: 

```
#text editors
geany

#office apps
gpicview
evince
galculator
xarchiver

#terminals
xterm 
xfce4-terminal
terminator

#web apps
firefox-esr
youtube-dl

#development
meld
git

#file managers
thunar

#system tools 
lxrandr
lxinput
pulseaudio
udiskie
network-manager
network-manager-gnome
clipit
xfce4-power-manager
xscreensaver
xfce4-taskmanager

#audio video
mpv
smplayer
audacious

#other
plank


```

* Full list of packages for variant: [xfce_dwm_openbox_i3](./variant-xfce_dwm_openbox_i3/package-lists/kali.list.chroot)


## Download

* ISO images of this comunity edition are published at [my-Kali-Linux project at sourceforge.net](https://my-kali-linux.sourceforge.io)








