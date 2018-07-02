#/usr/bin/env bash 
cp -v /opt/my-debian/openbox/etc/skel/.openbox_conkyrc /home/kowalczy/live-build-config/kali-config/common/includes.chroot/etc/skel/.openbox_conkyrc
cp -v /opt/my-debian/openbox/etc/skel/.openbox_conkyrc /home/kowalczy/live-build-config/kali-config/common/includes.chroot/root/.openbox_conkyrc

cp -v -r /opt/my-debian/openbox/etc/skel/.config /home/kowalczy/live-build-config/kali-config/common/includes.chroot/etc/skel/
cp -v -r /opt/my-debian/openbox/etc/skel/.config /home/kowalczy/live-build-config/kali-config/common/includes.chroot/root/

cp -v /opt/my-debian/variant-openbox/package-lists/kali.list.chroot /home/kowalczy/live-build-config/kali-config/variant-openbox/package-lists/kali.list.chroot

#firefox
cp -v -r  /opt/firefox /home/kowalczy/live-build-config/kali-config/common/includes.chroot/opt/

cp -v -r  /opt/my-debian/opt/firefox/firefox.sh /home/kowalczy/live-build-config/kali-config/common/includes.chroot/usr/bin/firefox.sh

#toxic
cp -v -r  /opt/toxic /home/kowalczy/live-build-config/kali-config/common/includes.chroot/opt/

#i3lock 
cp -v -r  /opt/my-debian/i3/kali-lock.sh /home/kowalczy/live-build-config/kali-config/common/includes.chroot/usr/bin/kali-lock.sh

cd /home/kowalczy/live-build-config/
date
./build.sh --distribution kali-rolling --variant openbox --verbose
date



