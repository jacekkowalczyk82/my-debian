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
lb config --debian-installer live 

lb build 




```
