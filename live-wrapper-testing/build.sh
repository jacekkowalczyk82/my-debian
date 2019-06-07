#!/bin/bash 
#sudo apt install live-wrapper
# sudo lwr -d testing
# sudo lwr # for stretch 
# sudo lwr -d buster 
#/usr/share/live-wrapper/customise.sh 
# --customise=`pwd`/customise.sh

PACKAGES="dwm,suckless-tools,stterm,nitrogen,sudo,git,htop,nano,vim"
PACKAGES_AND_RECOMMENDED="live-task-xfce,xorg,live-config-systemd"
LOGFILE="debian-live-lwr-build-`date '+%Y-%m-%d_%H%M%S'`.log"

MY_LWR_OPTIONS="--isolinux --grub --installer --di-daily --log-level=debug --log=${LOGFILE}"
lwr -d testing -o debian-live-xfce-dwm.iso ${MY_LWR_OPTIONS} \
 -e ${PACKAGES} -t ${PACKAGES_AND_RECOMMENDED} 




