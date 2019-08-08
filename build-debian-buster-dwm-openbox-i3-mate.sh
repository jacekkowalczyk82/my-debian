#/bin/bash 

cd live-build-buster-mate
lb config --debian-installer live -d buster \
 --grub-splash grub2.png \
 --debian-installer-distribution buster \
 --iso-application debian-live-10-ldd-mate \
 --iso-volume debian-live-10-ldd-mate \
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
lb build --debug --verbose 2>&1 |tee debian-live-10-ldd-mate-`date '+%Y-%m-%d_%H%M%S'`.log

