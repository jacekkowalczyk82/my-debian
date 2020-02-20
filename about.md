# About LDD Linux 

* Project Home page - https://jacekkowalczyk82.github.io/my-debian/
* LDD Linux - Lightweight Debian Distribution is custom Live build of Debian Linux with DWM, Openbox, i3wm, 
* Desktop environments XFCE, MATE, LXQT, KDE are optional and are preinstalled in dedicated editions. 
* The goal of this project is to create custom debian live cd image and lightweight OS that can be used on VM or older hardware. 
* [Linux Mint based custom ISO](https://sourceforge.net/projects/my-debian/files/my-mint-dwm-openbox-i3-xfce/)

* [my-debian - LDD Linux at sourceforge.net](https://sourceforge.net/projects/my-debian/)
* [Download files](https://sourceforge.net/projects/my-debian/files/)
* To start X session run `startgui` command after login in terminal 



|Feature           |Description                                                                         |
|------------------|------------------------------------------------------------------------------------|
|Livecd user/pass  |user/live                                                                           |
|ULTRA sessions    |Custom-DWM, Openbox, i3                                                             |
|XFCE sessions     |Custom-DWM, Openbox, i3, XFCE                                                       |
|MATE sessions     |Custom-DWM, Openbox, i3, MATE                                                       |
|LXQT sessions     |Custom-DWM, Openbox, i3, LXQT                                                       |
|KDE sessions      |Custom-DWM, Openbox, i3, KDE                                                        |
|DWM custom ModKey |Win                                                                                 |
|i3wm ModKey       |Win                                                                                 |
|Openbox ModKey    |Win                                                                                 |
|DWM terminal      |ModKey + Shift + Enter (Win + Shift + Enter)                                        |
|DWM Dmenu         |ModKey + p (Win + p)                                                                |
|DWM exit          |ModKey + Shift + q (exits to terminal)                                              |
|DWM close app     |ModKey + Shift + c                                                                  |
|i3 terminal       |ModKey + Enter                                                                      |
|i3 quite app      |ModKey + Shift + q                                                                  |
|i3 exit           |ModKey + Shift + e (exits to terminal)                                              |
|i3 poweroff       |ModKey + Shift + p (shuts down the system)                                          |
|Openbox terminal  |Win + Enter                                                                         |
|Openbox Dmenu     |Alt + F3                                                                            |
|i3wm terminal     |Win + Enter                                                                         |
|i3wm Dmenu        |Win + d                                                                             |
|Network Manager   |nmtui, nm-applet                                                                    |
|Volume Control    |pavucontrol                                                                         |
|ULTRA Power Manager|upower -i /org/freedesktop/UPower/devices/battery_BAT0                             |
|XFCE Power Manager|xfce4-power-manager, upower -i /org/freedesktop/UPower/devices/battery_BAT0         |
|MATE Power Manager|mate-power-manager, upower -i /org/freedesktop/UPower/devices/battery_BAT0          |
|WWW browser       |Firefox,                                                                            |



* More information/help about dwm can be found at [http://suckless.org](http://suckless.org).

## Editions /variants

All LDD editions have DWM, Openbox, i3wm window managers. There are also some other editions that comes with preinstalled and configured Desktop Environments.

* ULTRA wich does not have any DE. 
* XFCE
* MATE
* KDE
* LXQT

There is also Devuan Linux based LDD iso. 

## Instal 

You have three options:
* Debian installer
* Graphical debian installer 
* Start Live cd mode and run in terminal 

```
sudo calamares 
```

## Changelog

* 2020-02-19 fixed startgui script in ultra edition.
* 2020-02-18 Added development tools, java, python3, adb. 
* 2019-08-26 Created working and installable Devuan based ISO. 
* 2019-08-19 Added few rescue tools (ntfsutils, chntpw) to all LDD variants. 
* 2019-07-04 Added Mint based ISO with (DWM, Openbox, i3wm, XFCE)

## Download

* ISO images are published at [My-debian project at sourceforge.net](https://sourceforge.net/projects/my-debian/files/)


