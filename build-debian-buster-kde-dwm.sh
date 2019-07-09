#/bin/bash 

cd live-build-buster-kde

lb config --debian-installer live -d buster \
 --debian-installer-distribution buster \
 --iso-application debian-live-ldd-kde \
 --iso-volume debian-live-ldd-kde \
 --iso-publisher "Jacek Kowalczyk http://jacekkowalczyk82.github.io" \
 --iso-preparer "Jacek Kowalczyk http://jacekkowalczyk82.github.io" 
 
 
#add your packages to config/package-lists/live.list.chroot
#add your customization files to config/includes.chroot/

mkdir -p config/includes.chroot/opt/
cp -rv ../suckless.org/dwm config/includes.chroot/opt/

#when rebuilding run also clean
#sudo lb clean --purge

#build ISO
lb build --debug --verbose 2>&1 |tee debian-live-ldd-kde-`date '+%Y-%m-%d_%H%M%S'`.log

