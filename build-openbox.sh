#/usr/bin/env bash 
cp -v /opt/my-debian/openbox/etc/skel/.openbox_conkyrc /home/kowalczy/live-build-config/kali-config/common/includes.chroot/etc/skel/.conkyrc
cp -v /opt/my-debian/openbox/etc/skel/.openbox_conkyrc /home/kowalczy/live-build-config/kali-config/common/includes.chroot/root/.conkyrc

./build.sh --distribution kali-rolling --variant openbox --verbose




