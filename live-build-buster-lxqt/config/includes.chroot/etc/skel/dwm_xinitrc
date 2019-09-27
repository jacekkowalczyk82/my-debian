#~/.xinitrc

exec nitrogen --restore &
#exec feh --bg-scale /usr/share/desktop-base/spacefun-theme/wallpaper/contents/images/3840x2160.svg  &
#exec feh --bg-scale /home/kowalczy/Pictures/futureprototype_login.png & 
exec compton -b &
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

