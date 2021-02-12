#/bin/bash 
LDD_EDITION="mate"
lb config --debian-installer live -d buster \
 --grub-splash grub2.png \
 --firmware-chroot true \
 --debian-installer-distribution buster \
 --iso-application debian-live-10-ldd-${LDD_EDITION} \
 --iso-volume debian-live-10-ldd-${LDD_EDITION} \
 --iso-publisher "Jacek Kowalczyk http://jacekkowalczyk82.github.io" \
 --iso-preparer "Jacek Kowalczyk http://jacekkowalczyk82.github.io" 
 
 
#add your packages to config/package-lists/live.list.chroot
#add your customization files to config/includes.chroot/

mkdir -p config/includes.chroot/opt/
cp -rv ../suckless.org/dwm ./config/includes.chroot/opt/
#mv -v ./config/includes.chroot/opt/dwm-gaps ./config/includes.chroot/opt/dwm
cp -rv ../src/usr ./config/includes.chroot/
cp -rv ../bootloaders ./config/

read -p "Press any key: " any_key

#when rebuilding run also clean
#sudo lb clean --purge

#build ISO
lb clean

lb build --debug --verbose 2>&1 |tee debian-live-10-ldd-${LDD_EDITION}-`date '+%Y-%m-%d_%H%M%S'`.log

#`date '+%Y-%m-%d_%H%M%S'`
GENERATED_NAME="debian-live-10-ldd-${LDD_EDITION}-amd64"
RELEASE_NAME="debian-live-10-ldd-${LDD_EDITION}-`date '+%Y-%m-%d_%H%M%S'`-amd64"
RELEASE_DATE=`date '+%Y%m%d'`

if [ -e "${GENERATED_NAME}.hybrid.iso" ]; then 

    mv ${GENERATED_NAME}.hybrid.iso  ${RELEASE_NAME}.iso
    sha256sum ${RELEASE_NAME}.iso | tee -a ${RELEASE_NAME}.sha256sum.txt

    FILES_PATTERN="debian-live-10-ldd-${LDD_EDITION}"

    #aws s3 --region us-east-2 cp ${FILES_PATTERN}-*.log  s3://jacekkowalczyk82.private.s3/my-debian-images/${RELEASE_DATE}/
    #aws s3 --region us-east-2 cp ${RELEASE_NAME}.iso s3://jacekkowalczyk82.private.s3/my-debian-images/${RELEASE_DATE}/
    #aws s3 --region us-east-2 cp ${RELEASE_NAME}.sha256sum.txt s3://jacekkowalczyk82.private.s3/my-debian-images/${RELEASE_DATE}/

    #aws s3 --region us-east-2 cp ${GENERATED_NAME}.contents         s3://jacekkowalczyk82.private.s3/my-debian-images/${RELEASE_DATE}/
    #aws s3 --region us-east-2 cp ${GENERATED_NAME}.files         s3://jacekkowalczyk82.private.s3/my-debian-images/${RELEASE_DATE}/
    #aws s3 --region us-east-2 cp ${GENERATED_NAME}.hybrid.iso.zsync  s3://jacekkowalczyk82.private.s3/my-debian-images/${RELEASE_DATE}/
    #aws s3 --region us-east-2 cp ${GENERATED_NAME}.packages      s3://jacekkowalczyk82.private.s3/my-debian-images/${RELEASE_DATE}/

else 
	echo "ERROR: failed to build ISO"
fi 
