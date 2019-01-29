#/usr/bin/env bash 

LIVE_BUILD_ROOT_DIR="/opt/live-build-config"
MY_DEBIAN_ROOT_DIR="/opt/my-debian"
CUSTOMIZATIONS_DIR="dwm_openbox_i3"
KALI_VARIANT_NAME="dwm_openbox_i3_no_lightdm"
CUSTOMIZATIONS_KALI_VARIANT_DIR="variant-dwm_openbox_i3"
KALI_VARIANT_DIR="variant-${KALI_VARIANT_NAME}"
KALI_ARCH="i386"

mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/${KALI_VARIANT_DIR}/package-lists/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.config/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/.config/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/firefox/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/toxic/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/bin/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/share/xsessions/

cp -v ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/.openbox_conkyrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.openbox_conkyrc
cp -v ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/.openbox_conkyrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/.openbox_conkyrc

#cp -v ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/.dwm_conkyrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.dwm_conkyrc
#cp -v ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/.dwm_conkyrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/.dwm_conkyrc

cp -v ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/.i3wm_conkyrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.i3wm_conkyrc
cp -v ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/.i3wm_conkyrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/.i3wm_conkyrc

cp -v -r ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/.config ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/.config ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/

cp -v ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_KALI_VARIANT_DIR}/package-lists/kali.list.chroot ${LIVE_BUILD_ROOT_DIR}/kali-config/${KALI_VARIANT_DIR}/package-lists/kali.list.chroot

#Custom Xsession 
cp -v ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/custom-dwm.desktop ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/share/xsessions/

cp -v -r ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/motd ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/motd

cp -v -r ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/openbox_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.xinitrc
cp -v -r ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/openbox_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/.xinitrc

cp -v -r ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/start*.sh ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/dwm_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/openbox_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/i3_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/

cp -v -r ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/start*.sh ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/dwm_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/openbox_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/i3_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/


cp -v -r ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/.xsession ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/etc/skel/.xsession ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/root/


# DWM REPO and compiled binaries
cp -v -r /opt/kali-build-resources-32bit/dwm ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/

#firefox
cp -v -r /opt/kali-build-resources-32bit/firefox ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/

sleep 5

cp -v ${MY_DEBIAN_ROOT_DIR}/opt/firefox/firefox.sh ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/bin/firefox.sh

cp -v ${MY_DEBIAN_ROOT_DIR}/opt/firefox/firefox-developer-edition.desktop ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/firefox/firefox-developer-edition.desktop

#toxic
#cp -v -r  /opt/toxic ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/

#i3lock 
cp -v -r  ${MY_DEBIAN_ROOT_DIR}/${CUSTOMIZATIONS_DIR}/kali-lock.sh ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/bin/kali-lock.sh

cd ${LIVE_BUILD_ROOT_DIR}/
date
rm -rf config/
./build.sh --distribution kali-rolling --variant ${KALI_VARIANT_NAME} --arch "${KALI_ARCH}" --verbose
date



