exec nitrogen --restore &
while true ; do xsetroot -name "`date '+%Y-%m-%d %H:%M.%S'` Load15: `cat /proc/loadavg |cut -d " " -f 3`; `uptime -p `"; sleep 1 ; done &
exec /opt/dwm/dwm

