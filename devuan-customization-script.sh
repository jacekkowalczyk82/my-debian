#!/bin/bash 
BUILD_TOOLS_ROOT=$1


cp -v ${BUILD_TOOLS_ROOT}/config-devuan/packages.list new_chroot/
cp -v ${BUILD_TOOLS_ROOT}/config-devuan/functions.sh new_chroot/

mkdir -p new_chroot/opt/
cp -rv ${BUILD_TOOLS_ROOT}/suckless.org/dwm new_chroot/opt/
cp -rv ${BUILD_TOOLS_ROOT}/config-devuan/etc/skel new_chroot/etc/
cp -rv ${BUILD_TOOLS_ROOT}/config-devuan/etc/skel/* new_chroot/home/devuan/
cp -rv ${BUILD_TOOLS_ROOT}/config-devuan/etc/skel/.* new_chroot/home/devuan/

cp -v ${BUILD_TOOLS_ROOT}/config-devuan/etc/motd new_chroot/etc/
cp -rv ${BUILD_TOOLS_ROOT}/config-devuan/etc/X11 new_chroot/etc/

cp -rv ${BUILD_TOOLS_ROOT}/config-devuan/usr/local new_chroot/usr/
cp -rv ${BUILD_TOOLS_ROOT}/config-devuan/usr/share new_chroot/usr/

cp -rv ${BUILD_TOOLS_ROOT}/opt/backgrounds new_chroot/opt/


mkdir -p new_chroot/usr/share/xsessions/
cp -rv ${BUILD_TOOLS_ROOT}/config-mint-xfce/usr/share/xsessions/custom-dwm.desktop new_chroot/usr/share/xsessions/
