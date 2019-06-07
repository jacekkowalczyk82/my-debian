#!/bin/bash 
#sudo apt install live-wrapper
# sudo lwr -d testing
# sudo lwr # for stretch 
# sudo lwr -d buster 

PACKAGES="dwm,suckless-tools,stterm,nitrogen,sudo,git,htop,nano,vim"
PACKAGES_AND_RECOMMENDED="live-task-xfce,xorg,live-boot,live-config,live-config-systemd"
lwr -d testing  -e ${PACKAGES} -t  ${PACKAGES_AND_RECOMMENDED} 


