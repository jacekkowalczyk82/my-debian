#/bin/bash 

ISO_NAME="debian-live-10.2-ldd-xfce"
cd live-build-buster
lb config --debian-installer live -d buster \
 --grub-splash grub2.png \
 --debian-installer-distribution buster \
 --iso-application ${ISO_NAME} \
 --iso-volume ${ISO_NAME} \
 --iso-publisher "Jacek Kowalczyk http://jacekkowalczyk82.github.io" \
 --iso-preparer "Jacek Kowalczyk http://jacekkowalczyk82.github.io" 
 
 
#add your packages to config/package-lists/live.list.chroot
#add your customization files to config/includes.chroot/

mkdir -p config/includes.chroot/opt/
cp -rv ../suckless.org/dwm ./config/includes.chroot/opt/
cp -rv ../bootloaders ./config/

#when rebuilding run also clean
#sudo lb clean --purge

#build ISO
lb build --debug --verbose 2>&1 |tee ${ISO_NAME}-`date '+%Y-%m-%d_%H%M%S'`.log

