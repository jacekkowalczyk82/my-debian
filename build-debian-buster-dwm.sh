#/bin/bash 

cd live-build-buster
sudo lb config --debian-installer live -d buster --debian-installer-distribution daily
#add your packages to config/package-lists/live.list.chroot
#add your customization files to config/includes.chroot/

mkdir -p config/includes.chroot/opt/
cp -rv suckless.org/dwm config/includes.chroot/opt/

#when rebuilding run also clean
#sudo lb clean --purge

#build ISO
sudo lb build --debug --verbose 2>&1 |tee lb-build-buster-`date '+%Y-%m-%d_%H%M%S'`.log



