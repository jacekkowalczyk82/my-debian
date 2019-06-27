#/bin/bash 

cd live-build-buster
lb config --debian-installer live -d buster \
 --debian-installer-distribution daily \
 --iso-application debian-live-wm-edition \
 --iso-volume debian-live-wm-edition \
 --iso-publisher "Jacek Kowalczyk http://jacekkowalczyk82.github.io" \
 --iso-preparer "Jacek Kowalczyk http://jacekkowalczyk82.github.io" 
 
 
#add your packages to config/package-lists/live.list.chroot
#add your customization files to config/includes.chroot/

mkdir -p config/includes.chroot/opt/
cp -rv suckless.org/dwm config/includes.chroot/opt/

#when rebuilding run also clean
#sudo lb clean --purge

#build ISO
lb build --debug --verbose 2>&1 |tee lb-build-buster-xfce-dwm-`date '+%Y-%m-%d_%H%M%S'`.log



