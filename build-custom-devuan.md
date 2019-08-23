# LiveCDCustomization way for Linux Mint 19.1 XFCE 

* Based on https://nathanpfry.com/how-to-customize-an-ubuntu-installation-disc/

* run as  user:

```
apt -y install squashfs-tools genisoimage

cd my-debian

BUILD_TOOLS_ROOT=`pwd`
cd ~/
mkdir -p ~/Downloads || true

#https://ftp.fau.de/devuan-cd/devuan_ascii/desktop-live/devuan_ascii_2.0.0_amd64_desktop-live.iso

BASE_ISO_IMAGE_NAME="devuan_ascii_2.0.0_amd64_desktop-live.iso"
BASE_ISO_IMAGE_PATH=~/Downloads/${BASE_ISO_IMAGE_NAME}
if [ ! -e ${BASE_ISO_IMAGE_PATH} ]; then
	wget -O ${BASE_ISO_IMAGE_PATH} https://ftp.fau.de/devuan-cd/devuan_ascii/desktop-live/devuan_ascii_2.0.0_amd64_desktop-live.iso
fi 
sleep 1 
sudo rm -rf ~/custom-img/  || true 


mkdir -p ~/custom-img/
echo "cp ${BASE_ISO_IMAGE_PATH} ~/custom-img/"
cp -v ${BASE_ISO_IMAGE_PATH} ~/custom-img/
cd ~/custom-img
ls -alh 

mkdir mnt
sudo mount -o loop ${BASE_ISO_IMAGE_NAME} mnt

mkdir iso_image_disk

rsync --exclude=/live/filesystem.squashfs -a mnt/ iso_image_disk
ls -alh iso_image_disk/

sudo rm -rf squashfs-root || true 
sudo unsquashfs mnt/live/filesystem.squashfs






sudo rm -rf new_chroot || true 
mv squashfs-root new_chroot

#sudo cp -rv ${BUILD_TOOLS_ROOT}/includes.chroot/* new_chroot/

sudo bash ${BUILD_TOOLS_ROOT}/devuan-customization-script.sh ${BUILD_TOOLS_ROOT}

#????????
sudo cp /etc/resolv.conf new_chroot/etc/

sudo mount --bind /dev/ new_chroot/dev/


sudo chroot new_chroot

mount -t proc none /proc
mount -t sysfs none /sys
mount -t devpts none /dev/pts


export HOME=/root
export LC_ALL=C
dbus-uuidgen > /var/lib/dbus/machine-id
dpkg-divert --local --rename --add /sbin/init
ln -s /bin/true /sbin/init


apt-get update && apt-get -y upgrade

dpkg --configure -a 
apt-get install -f 

apt-get update && apt-get -y upgrade


source /functions.sh
install_custom_packages


apt-get autoremove && apt-get autoclean
rm -rf /tmp/* ~/.bash_history
rm /var/lib/dbus/machine-id
rm /sbin/init
dpkg-divert --rename --remove /sbin/init

#Unmount the directories from the beginning of this guide:

umount /proc || umount -lf /proc
umount /sys
umount /dev/pts
exit
sudo umount new_chroot/dev

###Generate a new file manifest:
#sudo chmod +w iso_image_disk/live/filesystem.manifest ||true 
#sudo chroot new_chroot dpkg-query -W --showformat='${Package} ${Version}\n' | sudo tee iso_image_disk/live/filesystem.manifest
#sudo cp iso_image_disk/live/filesystem.manifest iso_image_disk/live/filesystem.manifest-desktop
#sudo sed -i '/ubiquity/d' iso_image_disk/live/filesystem.manifest-desktop
#sudo sed -i '/live/d' iso_image_disk/live/filesystem.manifest-desktop

#Compress the filesystem:
sudo mksquashfs new_chroot iso_image_disk/live/filesystem.squashfs -b 1048576

#Update filesystem size (needed by the installer):
printf $(sudo du -sx --block-size=1 new_chroot | cut -f1) | sudo tee iso_image_disk/live/filesystem.size

#Delete the old md5sum:
cd iso_image_disk
#sudo rm MD5SUMS

#…and generate a fresh one: (single command, copy and paste in one piece)

#find -type f -print0 | sudo xargs -0 md5sum | grep -v isolinux/boot.cat | sudo tee MD5SUMS

#And finally, create the ISO. This is a single long command, be sure to copy and paste it in one piece and don’t forget the period at the end, it’s important:

DATE_TIME=`date '+%Y-%m-%d_%H%M'`
sudo genisoimage -D -r -V "$IMAGE_NAME" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o ../my-devuan-ldd-xfce-${DATE_TIME}.iso . 


cd ..
ls -alh `pwd`/my-devuan-ldd-xfce-${DATE_TIME}.iso
exit 0 

```


