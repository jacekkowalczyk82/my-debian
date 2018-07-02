#/usr/bin/env bash 
cp -v /opt/my-debian/openbox/etc/skel/.openbox_conkyrc /home/kowalczy/live-build-config/kali-config/common/includes.chroot/etc/skel/.openbox_conkyrc
cp -v /opt/my-debian/openbox/etc/skel/.openbox_conkyrc /home/kowalczy/live-build-config/kali-config/common/includes.chroot/root/.openbox_conkyrc

cp -v -r /opt/my-debian/openbox/etc/skel/.config /home/kowalczy/live-build-config/kali-config/common/includes.chroot/etc/skel/
cp -v -r /opt/my-debian/openbox/etc/skel/.config /home/kowalczy/live-build-config/kali-config/common/includes.chroot/root/

cp -v /opt/my-debian/variant-openbox/package-lists/kali.list.chroot home/kowalczy/live-build-config/kali-config/variant-openbox/package-lists/kali.list.chroot

cd /home/kowalczy/live-build-config/
date
./build.sh --distribution kali-rolling --variant openbox --verbose
date



