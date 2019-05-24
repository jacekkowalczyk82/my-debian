# How to Create a Custom Debian Stable ISO

```
sudo apt install dwm suckless-tools stterm libx11-dev libxft-dev libxinerama-dev nitrogen feh 


mkdir -p /opt/  && cd /opt

git clone git://git.suckless.org/dwm
cd dwm

* follow https://gitlab.com/jacekkowalczyk82/my-debian/blob/master/debian-dwm.md

cd /opt/dwm/
sudo make clean install 

create file ~/.xinitrc
exec nitrogen --restore &
while true ; do xsetroot -name "`date '+%Y-%m-%d %H:%M.%S'` Load15: `cat /proc/loadavg |cut -d " " -f 3`; `uptime -p `"; sleep 1 ; done &
exec /opt/dwm/dwm



exec nitrogen --restore &
#exec compton -b &
dropbox_status_string=""
while true ; do 
#    dropbox_status=$(dropbox-cli status | head -n 1)
#    if [ "$dropbox_status" == "Up to date" ]; then 
#        dropbox_status_string="Dropbox: "$(echo $dropbox_status)
#    else 
#        dropbox_status_string="Dropbox: "$(echo $dropbox_status|awk -F " " '{print $1}')
#    fi 

    load=$(cat /proc/loadavg |cut -d " " -f 3 )
    uptime=$(uptime -p)
    load_uptime="Load15: ${load}; ${uptime}"

    xsetroot -name "`date '+%Y-%m-%d %H:%M.%S' ` $load_uptime $dropbox_status_string "; sleep 1; 
done &
#exec /usr/bin/dropbox & 
exec /opt/dwm/dwm


Set permissions and create xsession link
ln -s ~/.xinitrc ~/.xsession
chmod 755 ~/.xinitrc

create file /usr/share/xsessions/custom-dwm.desktop
[Desktop Entry]
Name=Kowalczy-DWM
Exec=/etc/X11/Xsession






mkdir live-default && cd live-default
LIVE_DEFAULT_HOME="/home/kowalczy/live-default"

#sudo apt install xorriso 
sudo apt install curl git live-build debootstrap 
lb config --debian-installer live -d buster

lb build 




```

## Web Resources 

* https://dug.net.pl/tekst/243/budowa_spersonalizowanego_systemu_debian_live/
* https://dug.net.pl/tekst/341/wlasny_debian_liveusb/

* https://live-team.pages.debian.net/live-manual/html/live-manual/the-basics.en.html#179
* https://live-team.pages.debian.net/live-manual/html/live-manual/customizing-contents.en.html#517
* 
* https://willhaley.com/blog/custom-debian-live-environment/
* https://www.opengeeks.me/2015/04/build-your-hybrid-debian-distro-with-xorriso/
* http://www.linuxandubuntu.com/home/make-your-very-own-customized-linux-distro-from-your-current-installation
* https://www.linux-live.org/#download
* https://marvin.im/post/a-suckless-debian/
* https://www.debian.org/devel/debian-desktop/
* http://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/
* https://www.debian.org/CD/live/
* https://wiki.debian.org/DebianLive
* https://www.google.pl/search?q=live%20systems%20debian%20builder&ie=utf-8&oe=utf-8&client=firefox-b&gfe_rd=cr&dcr=0&ei=v1POWrq_K8TX8gfJt7yYBw&authuser=0


