#/usr/bin/env bash 

LIVE_BUILD_ROOT_DIR="/home/ec2-user/live-build-config"
MY_DEBIAN_ROOT_DIR="/home/ec2-user/my-debian"
CUSTOMIZATIONS_DIR="xfce_dwm_openbox_i3"
#KALI_VARIANT_NAME="light-wm-edition-by-Jacek-multi-user-target"
KALI_VARIANT_NAME="light-plus-wm-edition"
CUSTOMIZATIONS_KALI_VARIANT_DIR="variant-xfce_dwm_openbox_i3"
KALI_VARIANT_DIR="variant-${KALI_VARIANT_NAME}"
KALI_ARCH="amd64"

rm -f ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.xinitrc
rm -f ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.xsession
rm -f ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/
#must keep this file : kali-config/common/includes.chroot/home/kali/.bashrc
rm -f ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/home/kali/.xinitrc
rm -f ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/home/kali/.xsession
rm -rf ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/
rm -f ${LIVE_BUILD_ROOT_DIR}/kali-config/common/hooks/live/live-kali-multi-user-hook.chroot || true 
rm -rf ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/local/bin/
rm -f ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/motd
rm -rf ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/share/xsessions/
rm -f ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/lib/live/config/



mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/${KALI_VARIANT_DIR}/package-lists/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.config/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/home/kali/.config/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/dwm/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/backgrounds/

mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/bin/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/lib/live/config/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/local/bin/
mkdir -p ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/share/xsessions/

cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.openbox_conkyrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.openbox_conkyrc
cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.openbox_conkyrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/home/kali/.openbox_conkyrc

cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.i3wm_conkyrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.i3wm_conkyrc
cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.i3wm_conkyrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/home/kali/.i3wm_conkyrc

cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.config ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.config ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/home/kali/

cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_KALI_VARIANT_DIR}/package-lists/kali.list.chroot ${LIVE_BUILD_ROOT_DIR}/kali-config/${KALI_VARIANT_DIR}/package-lists/kali.list.chroot

#Custom Xsession 
cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/custom-dwm.desktop ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/share/xsessions/
cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/usr/local/bin/startgui ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/local/bin/startgui

chmod 755 ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/local/bin/startgui

#/etc/systemd/system/default.target -> multi-user.target

#dwm_openbox_i3/live-kali-multi-user-hook.chroot
cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/live-kali-multi-user-hook.chroot ${LIVE_BUILD_ROOT_DIR}/kali-config/common/hooks/live/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/systemd/system/default.target ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/systemd/system/

cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/motd ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/motd

cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/usr/lib/live/config/0032-kali-ownership ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/lib/live/config/


#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/openbox_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/.xinitrc
#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/openbox_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/home/kali/.xinitrc

#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/start*.sh ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/
#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/dwm_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/
#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/openbox_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/
#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/i3_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/etc/skel/

#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/start*.sh ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/home/kali/
#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/dwm_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/home/kali/
#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/openbox_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/home/kali/
#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/i3_xinitrc ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/home/kali/


# DWM REPO and compiled binaries
#cp -v -r /opt/dwm ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/
cp -rv ${MY_DEBIAN_ROOT_DIR}/live-build-buster/config/includes.chroot/opt/backgrounds ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/
cp -rv ${MY_DEBIAN_ROOT_DIR}/suckless.org/dwm/* ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/dwm/

if [ -e ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/dwm/ ]; then 
    echo "DWM binaries installed ast should be to chroot"
else 
    echo "ERROR DWM binaries not installed to chroot "
    exit 1
fi 

sleep 5

#i3lock 
cp -v -r  ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/kali-lock.sh ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/usr/local/bin/kali-lock.sh

chown -R 1000:1000 ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/home/kali/

cd ${LIVE_BUILD_ROOT_DIR}/
date
rm -rf config/
./build.sh --distribution kali-rolling --variant ${KALI_VARIANT_NAME} --arch "${KALI_ARCH}" --verbose
date
cd ${LIVE_BUILD_ROOT_DIR}/images
chown -R ${USER}:${USER} ${LIVE_BUILD_ROOT_DIR}

ls -alh 
if [ -e "kali-linux-rolling-live-${KALI_VARIANT_NAME}-amd64.iso" ]; then 
    #`date '+%Y-%m-%d_%H%M%S'`
    GENERATED_NAME="kali-linux-rolling-live-${KALI_VARIANT_NAME}-amd64"
    RELEASE_NAME="kali-linux-rolling-live-${KALI_VARIANT_NAME}-`date '+%Y-%m-%d_%H%M%S'`-amd64"
    RELEASE_DATE=`date '+%Y%m%d'`

    mv ${GENERATED_NAME}.iso  ${RELEASE_NAME}.iso
    mv ${GENERATED_NAME}.log  ${RELEASE_NAME}.log
    sha256sum ${RELEASE_NAME}.iso | tee  ${RELEASE_NAME}.sha256sum.txt
    
    aws s3 --region us-east-2 cp ${RELEASE_NAME}.iso s3://jacekkowalczyk82.private.s3/kali-images/${RELEASE_DATE}/
    aws s3 --region us-east-2 cp ${RELEASE_NAME}.sha256sum.txt s3://jacekkowalczyk82.private.s3/kali-images/${RELEASE_DATE}/
    aws s3 --region us-east-2 cp ${RELEASE_NAME}.log s3://jacekkowalczyk82.private.s3/kali-images/${RELEASE_DATE}/
    
    mv -v ${RELEASE_NAME}.* ${MY_DEBIAN_ROOT_DIR}/kali/
    cd ${MY_DEBIAN_ROOT_DIR}/kali/
    ls -alh 
else 
	echo "ERROR: failed to build ISO"
fi 






