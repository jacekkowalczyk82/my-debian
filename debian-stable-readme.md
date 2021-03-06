# How to Create a Custom Debian Stable ISO


![Debian Buster 10 Custom DWM screenshot](./screenshots/debian/2019-05-29-134757_1920x975_scrot.png)

## Install required packages to build and configure DWM

```
sudo apt install dwm suckless-tools stterm libx11-dev libxft-dev libxinerama-dev nitrogen feh 
```

## Install DWM at the production host machine

```
mkdir -p /opt/  && cd /opt
git clone git://git.suckless.org/dwm
cd dwm
```

* follow https://gitlab.com/jacekkowalczyk82/my-debian/blob/master/debian-dwm.md to modify the config.def.h file in dwm sources. 
* made changes:

```
diff --git a/config.def.h b/config.def.h
index 1c0b587..fc42d00 100644
--- a/config.def.h
+++ b/config.def.h
@@ -44,7 +44,7 @@ static const Layout layouts[] = {
 };

 /* key definitions */
-#define MODKEY Mod1Mask
+#define MODKEY Mod4Mask
 #define TAGKEYS(KEY,TAG) \
        { MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
        { MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
@@ -57,7 +57,7 @@ static const Layout layouts[] = {
 /* commands */
 static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
 static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
-static const char *termcmd[]  = { "st", NULL };
+static const char *termcmd[]  = { "stterm", NULL };

 static Key keys[] = {
        /* modifier                     key        function        argument */

```

* Build DWM

```
cd /opt/dwm/
sudo make clean install 
```

* create file ~/.xinitrc

```
#~/.xinitrc
#exec nitrogen --restore &
#exec feh --bg-scale /usr/share/desktop-base/spacefun-theme/wallpaper/contents/images/3840x2160.svg  &
exec feh --bg-scale /opt/backgrounds/futureprototype_login.png & 
#exec compton -b &
dropbox_status_string=""
while true ; do 
#    dropbox_status=$(dropbox-cli status | head -n 1)
#    if [ "$dropbox_status" == "Up to date" ]; then 
#        dropbox_status_string="Dropbox: "$(echo $dropbox_status)
#    else 
#        dropbox_status_string="Dropbox: "$(echo $dropbox_status|awk -F " " '{print $1}')
#    fi 

    load=$(cat /proc/loadavg |cut -d " " -f 3 )
    uptime=$(uptime -p)
    load_uptime="Load15: ${load}; ${uptime}"

    xsetroot -name "`date '+%Y-%m-%d %H:%M.%S' ` $load_uptime $dropbox_status_string "; sleep 1; 
done &
#exec /usr/bin/dropbox & 
exec /opt/dwm/dwm

```

* Set permissions and create xsession link

```
ln -s ~/.xinitrc ~/.xsession
chmod 755 ~/.xinitrc
```

* create file /usr/share/xsessions/custom-dwm.desktop

```
[Desktop Entry]
Name=Kowalczy-DWM
Exec=/etc/X11/Xsession

```

## Install packages for building ISO 

```
#sudo apt install xorriso 
sudo apt install curl git live-build debootstrap 

```

## Build Live ISO image for Stretch

```
cd my-debian/live-build-stretch
sudo lb config --debian-installer live -d stretch
#add your packages to config/package-lists/live.list.chroot
#add your customization files to config/includes.chroot/
#when rebuilding run also clean
sudo lb clean --purge

#build ISO
sudo lb build --debug --verbose 2>&1 |tee lb-build-stretch-`date '+%Y-%m-%d_%H%M%S'`.log
```

## Build Live ISO image for Buster with hack

```
cd my-debian/live-build-buster
sudo lb config --debian-installer live -d buster
#add your packages to config/package-lists/live.list.chroot
#add your customization files to config/includes.chroot/
#when rebuilding run also clean
sudo lb clean --purge

#build ISO
sudo lb build --debug --verbose 2>&1 |tee lb-build-buster-`date '+%Y-%m-%d_%H%M%S'`.log

sudo apt install genisoimage
mkdir hack
cd hack 
mkdir iso
mkdir hackediso
#assuming the lb generated debian-buster-dwm-live-amd64.hybrid.iso file
mv ../debian-buster-dwm-live-amd64.hybrid.iso ./
sudo mount -t iso9660 -o loop debian-buster-dwm-live-amd64.hybrid.iso  iso

cp -r iso/ hackediso/
# replace vmlinuz  and initrd.gz and gtk directory in hackediso/install/ with the correct debian installer daily image 
# from https://d-i.debian.org/daily-images/amd64/20190529-00:24/cdrom/

#rebuild iso again
cd hackediso
sudo genisoimage -o ../debian-buster-dwm-live-20190529-amd64.hybrid.hacked-2.iso -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-info-table -boot-load-size 4 ./


```

## Build Live ISO image for Buster

```
cd my-debian/live-build-buster
sudo lb config --debian-installer live -d buster --debian-installer-distribution daily
#add your packages to config/package-lists/live.list.chroot
#add your customization files to config/includes.chroot/
#when rebuilding run also clean
sudo lb clean --purge

#build ISO
sudo lb build --debug --verbose 2>&1 |tee lb-build-buster-`date '+%Y-%m-%d_%H%M%S'`.log

```

## Post install actions 

* When I installed the generated Debian Buster and logged in to XFCE desktop  I had some issues with themes and icons 

```
sudo gtk-update-icon-cache /usr/share/icons/Papirus/
sudo gtk-update-icon-cache /usr/share/icons/Numix/
sudo gtk-update-icon-cache /usr/share/icons/Tango/
sudo gtk-update-icon-cache /usr/share/icons/Moka/
sudo gtk-update-icon-cache /usr/share/icons/Faba/
sudo gtk-update-icon-cache /usr/share/icons/Papirus-Light/
sudo gtk-update-icon-cache /usr/share/icons/Numix-Light/
sudo gtk-update-icon-cache /usr/share/icons/Faenza/

```

## Live-Wrpper - next generation of debian libe build tools

* https://live-wrapper.readthedocs.io/en/latest/quickstart.html
* https://salsa.debian.org/live-team/live-wrapper

## Web Resources 

* https://live-wrapper.readthedocs.io/en/latest/quickstart.html
* https://live-team.pages.debian.net/live-manual/html/live-manual/index.pl.html
* https://live-team.pages.debian.net/live-manual/html/live-manual/index.en.html

* https://dug.net.pl/tekst/243/budowa_spersonalizowanego_systemu_debian_live/
* https://dug.net.pl/tekst/341/wlasny_debian_liveusb/

* https://live-team.pages.debian.net/live-manual/html/live-manual/the-basics.en.html#179
* https://live-team.pages.debian.net/live-manual/html/live-manual/customizing-contents.en.html#517
* 
* https://willhaley.com/blog/custom-debian-live-environment/
* https://www.opengeeks.me/2015/04/build-your-hybrid-debian-distro-with-xorriso/
* http://www.linuxandubuntu.com/home/make-your-very-own-customized-linux-distro-from-your-current-installation
* https://www.linux-live.org/#download
* https://marvin.im/post/a-suckless-debian/
* https://www.debian.org/devel/debian-desktop/
* http://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/
* https://www.debian.org/CD/live/
* https://wiki.debian.org/DebianLive
* https://www.google.pl/search?q=live%20systems%20debian%20builder&ie=utf-8&oe=utf-8&client=firefox-b&gfe_rd=cr&dcr=0&ei=v1POWrq_K8TX8gfJt7yYBw&authuser=0


