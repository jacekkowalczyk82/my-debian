#!/bin/bash 

function installCustomizations() {
    
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
    
    
}
