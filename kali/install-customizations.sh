#!/bin/bash 

function installPackages() {
    
    ## DWM 
    sudo apt install dwm suckless-tools stterm libx11-dev libxft-dev libxinerama-dev 
    
    ## i3
    sudo apt install i3 i3lock i3status conky 

    ## Openbox
    sudo apt install openbox obconf openbox-menu obsession tint2 menu

    sudo apt install lightdm compton nitrogen feh scrot fonts-dejavu

    # accessories
    sudo apt install gpicview evince lxrandr lxinput galculator xarchiver libreoffice 

    # terminals 
    sudo apt install xterm terminator rxvt-unicode sakura

    # web browsers
    sudo apt install firefox-esr

    sudo apt install youtube-dl    

    # dev tools
    sudo apt install meld geany 

    # file manager
    sudo apt install  ranger xfe thunar

    #sudo apt install greybird-gtk-theme tango-icon-theme oxygen-icon-theme obsidian-icon-theme adwaita-icon-theme hicolor-icon-theme breeze-icon-theme faba-icon-theme faenza-icon-theme moka-icon-theme tango-icon-theme numix-icon-theme papirus-icon-theme 

    # systray apps
    sudo apt install pulseaudio pavucontrol pasystray udiskie network-manager network-manager-gnome clipit xscreensaver plank 

    # utilities
    sudo apt install sudo git git-gui curl mc vim htop openssh-server apt-transport-https screenfetch neofetch gmrun 

#live-build
#cdebootstrap

    # printers
    sudo apt install system-config-printer

    # multimedia 
    sudo apt install vlc mpv mplayer smplayer audacious audacious-plugins 

    # packages for virtualbox guest additions
    sudo apt install  build-essential module-assistant 	

    # resue tools for passwords and disks
    sudo apt install ntfs-3g mtools gparted fdisk e2fsprogs chntpw

}

function installConfigs() {
    
    # sudo apt install git 
    # cd ~/
    # git clone https://gitlab.com/jacekkowalczyk82/my-debian.git
    # cd my-debian/kali
    # ./install-customizations.sh
    
MY_DEBIAN_ROOT_DIR="~/my-debian"
CUSTOMIZATIONS_DIR="xfce_dwm_openbox_i3"

sudo mkdir -p /etc/skel/.config/
mkdir -p ~/.config/
sudo mkdir -p /usr/local/bin/
sudo mkdir -p /usr/share/xsessions/

sudo cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.openbox_conkyrc /etc/skel/.openbox_conkyrc
cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.openbox_conkyrc ~/.openbox_conkyrc

sudo cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.i3wm_conkyrc /etc/skel/.i3wm_conkyrc
cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.i3wm_conkyrc ~/.i3wm_conkyrc

sudo cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.config /etc/skel/
cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/.config ~/

#sudo cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/openbox_xinitrc /etc/skel/.xinitrc
#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/openbox_xinitrc ~/.xinitrc

#sudo cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/start*.sh /etc/skel/
#sudo cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/dwm_xinitrc /etc/skel/
#sudo cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/openbox_xinitrc /etc/skel/
#sudo cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/i3_xinitrc /etc/skel/

#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/start*.sh ~/
#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/dwm_xinitrc ~/
#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/openbox_xinitrc ~/
#cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/skel/i3_xinitrc ~/


#Custom Xsession 
sudo cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/custom-dwm.desktop /usr/share/xsessions/
sudo cp -v ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/usr/local/bin/startgui /usr/local/bin/startgui

sudo chmod 755 /usr/local/bin/startgui
sudo cp -v -r ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/etc/motd /etc/motd

#/etc/systemd/system/default.target -> multi-user.target
sudo systemctl set-default multi-user.target


# DWM REPO and compiled binaries
#cp -v -r /opt/dwm ${LIVE_BUILD_ROOT_DIR}/kali-config/common/includes.chroot/opt/
sudo cp -rv ${MY_DEBIAN_ROOT_DIR}/suckless.org/dwm /opt/
sudo cp -rv ${MY_DEBIAN_ROOT_DIR}/live-build-buster/config/includes.chroot/opt/backgrounds /opt/

#i3lock 
sudo cp -v -r  ${MY_DEBIAN_ROOT_DIR}/kali/${CUSTOMIZATIONS_DIR}/kali-lock.sh /usr/local/bin/kali-lock.sh
sudo chmod 755 /usr/local/bin/kali-lock.sh
}

installPackages
installConfigs


