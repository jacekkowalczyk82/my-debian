#/usr/bin/env bash 

mkdir -p /home/kowalczy/live-build-config/kali-config/variant-dwm/package-lists/
mkdir -p /home/kowalczy/live-build-config/kali-config/common/includes.chroot/etc/skel/.config/
mkdir -p /home/kowalczy/live-build-config/kali-config/common/includes.chroot/root/.config/
mkdir -p /home/kowalczy/live-build-config/kali-config/common/includes.chroot/opt/firefox/
mkdir -p /home/kowalczy/live-build-config/kali-config/common/includes.chroot/opt/toxic/
mkdir -p /home/kowalczy/live-build-config/kali-config/common/includes.chroot/usr/bin/
mkdir -p /home/kowalczy/live-build-config/kali-config/common/includes.chroot/usr/share/xsessions/

cp -v /opt/my-debian/dwm/etc/skel/.dwm_conkyrc /home/kowalczy/live-build-config/kali-config/common/includes.chroot/etc/skel/.dwm_conkyrc
cp -v /opt/my-debian/dwm/etc/skel/.dwm_conkyrc /home/kowalczy/live-build-config/kali-config/common/includes.chroot/root/.dwm_conkyrc

cp -v /opt/my-debian/i3/etc/skel/.i3wm_conkyrc /home/kowalczy/live-build-config/kali-config/common/includes.chroot/etc/skel/.i3wm_conkyrc
cp -v /opt/my-debian/i3/etc/skel/.i3wm_conkyrc /home/kowalczy/live-build-config/kali-config/common/includes.chroot/root/.i3wm_conkyrc

cp -v -r /opt/my-debian/dwm/etc/skel/.config /home/kowalczy/live-build-config/kali-config/common/includes.chroot/etc/skel/
cp -v -r /opt/my-debian/dwm/etc/skel/.config /home/kowalczy/live-build-config/kali-config/common/includes.chroot/root/

cp -v /opt/my-debian/variant-dwm/package-lists/kali.list.chroot /home/kowalczy/live-build-config/kali-config/variant-dwm/package-lists/kali.list.chroot

#Custom Xsession 
cp -v /opt/my-debian/dwm/custom-dwm.desktop /home/kowalczy/live-build-config/kali-config/common/includes.chroot/usr/share/xsessions/

cp -v -r /opt/my-debian/dwm/etc/skel/.xinitrc /home/kowalczy/live-build-config/kali-config/common/includes.chroot/etc/skel/
cp -v -r /opt/my-debian/dwm/etc/skel/.xinitrc /home/kowalczy/live-build-config/kali-config/common/includes.chroot/root/

cp -v -r /opt/my-debian/dwm/etc/skel/.xsession /home/kowalczy/live-build-config/kali-config/common/includes.chroot/etc/skel/
cp -v -r /opt/my-debian/dwm/etc/skel/.xsession /home/kowalczy/live-build-config/kali-config/common/includes.chroot/root/


# DWM REPO and compiled binaries
cp -v -r /opt/dwm /home/kowalczy/live-build-config/kali-config/common/includes.chroot/opt/

#firefox
cp -v -r /opt/firefox /home/kowalczy/live-build-config/kali-config/common/includes.chroot/opt/

sleep 5

cp -v /opt/my-debian/opt/firefox/firefox.sh /home/kowalczy/live-build-config/kali-config/common/includes.chroot/usr/bin/firefox.sh

cp -v /opt/my-debian/opt/firefox/firefox-developer-edition.desktop /home/kowalczy/live-build-config/kali-config/common/includes.chroot/opt/firefox/firefox-developer-edition.desktop

#toxic
cp -v -r  /opt/toxic /home/kowalczy/live-build-config/kali-config/common/includes.chroot/opt/

#i3lock 
cp -v -r  /opt/my-debian/i3/kali-lock.sh /home/kowalczy/live-build-config/kali-config/common/includes.chroot/usr/bin/kali-lock.sh

cd /home/kowalczy/live-build-config/
date
rm -rf config/
./build.sh --distribution kali-rolling --variant dwm --verbose
date



