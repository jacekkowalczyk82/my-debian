#/usr/bin/env bash 

LIVE_BUILD_ROOT_DIR="/home/ec2-user/live-build-config"
MY_DEBIAN_ROOT_DIR="/home/ec2-user/my-debian"
CUSTOMIZATIONS_DIR="dwm_openbox_i3"
#KALI_VARIANT_NAME="light-wm-edition-by-Jacek-multi-user-target"
KALI_VARIANT_NAME="light-wm-edition"
CUSTOMIZATIONS_KALI_VARIANT_DIR="variant-dwm_openbox_i3"
KALI_VARIANT_DIR="variant-${KALI_VARIANT_NAME}"
KALI_ARCH="amd64"

rm -f ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.xinitrc
rm -f ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.xsession
#must keep this file : kali-config/common/includes.chroot/root/.bashrc
rm -f ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/.xinitrc
rm -f ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/.xsession
rm -rf ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/
rm -f ${LIVE_BUILD_ROOT_DIR}/kali-config/common/hooks/live/live-kali-multi-user-hook.chroot || true 


mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/${KALI_VARIANT_DIR}/package-lists/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.config/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/.config/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/firefox/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/toxic/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/bin/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/share/xsessions/

cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.openbox_conkyrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.openbox_conkyrc
cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.openbox_conkyrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/.openbox_conkyrc

#cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.dwm_conkyrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.dwm_conkyrc
#cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.dwm_conkyrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/.dwm_conkyrc

cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.i3wm_conkyrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.i3wm_conkyrc
cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.i3wm_conkyrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/.i3wm_conkyrc

cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.config ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.config ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/

cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_KALI_VARIANT_DIR}/package-lists/kali.list.chroot ${LIVE_BUILD_ROOT_DIR}/kali-config/${KALI_VARIANT_DIR}/package-lists/kali.list.chroot

#Custom Xsession 
cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/custom-dwm.desktop ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/share/xsessions/

#/etc/systemd/system/default.target -> multi-user.target

#dwm_openbox_i3/live-kali-multi-user-hook.chroot
cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/live-kali-multi-user-hook.chroot ${LIVE_BUILD_ROOT_DIR}/kali-config/common/hooks/live/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/systemd/system/default.target ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/systemd/system/

cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/motd ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/motd

cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/openbox_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.xinitrc
cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/openbox_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/.xinitrc

cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/start*.sh ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/dwm_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/openbox_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/i3_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/

cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/start*.sh ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/dwm_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/openbox_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/i3_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/


#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.xsession ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/
#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.xsession ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/


# DWM REPO and compiled binaries
#cp -v -r /opt/dwm ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/
cp -rv ${MY_DEBIAN_ROOT_DIR}/suckless.org/dwm ./config/includes.chroot/opt/
cp -rv ${MY_DEBIAN_ROOT_DIR}/my-debian/live-build-buster/config/includes.chroot/opt/backgrounds ./config/includes.chroot/opt/

#firefox
#cp -v -r /opt/firefox ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/

sleep 5

#cp -v ${MY_DEBIAN_ROOT_DIR}/opt/firefox/firefox.sh ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/bin/firefox.sh
#cp -v ${MY_DEBIAN_ROOT_DIR}/opt/firefox/firefox-developer-edition.desktop ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/firefox/firefox-developer-edition.desktop

#toxic
#cp -v -r  /opt/toxic ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/

#i3lock 
cp -v -r  ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/kali-lock.sh ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/bin/kali-lock.sh

cd ${LIVE_BUILD_ROOT_DIR}/
date
rm -rf config/
./build.sh --distribution kali-rolling --variant ${KALI_VARIANT_NAME} --arch "${KALI_ARCH}" --verbose
date



