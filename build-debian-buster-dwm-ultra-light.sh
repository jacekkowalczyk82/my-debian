#/bin/bash 

cd live-build-buster-dwm-ultra-light/

lb config --debian-installer live -d buster \
 --debian-installer-distribution daily \
 --iso-preparer "Jacek Kowalczyk jack82@bsdmail.com" 
 
#add your packages to config/package-lists/live.list.chroot
#add your customization files to config/includes.chroot/

mkdir -p config/includes.chroot/opt/
cp -rv suckless.org/dwm config/includes.chroot/opt/

#when rebuilding run also clean
#sudo lb clean --purge

#build ISO
lb build --debug --verbose 2>&1 |tee lb-build-buster-dwm-ultra-light-`date '+%Y-%m-%d_%H%M%S'`.log




