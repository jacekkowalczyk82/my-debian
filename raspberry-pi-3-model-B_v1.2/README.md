# How to install Raspbian on Raspberry Pi 3 Model B v1.2 

* Prepare SD  card 
* Use Raspberry Pi [imager application](https://downloads.raspberrypi.org/imager/imager.exe) to install Raspbian to SD card. 
* Connect mouse, keyboard and monitor  to PI. 
* Connect power to boot it. 
* Follow the welcome configuration wizzard to setup language, timezone and WiFi connection. 

* After rebooting update system and install apps:

```
sudo apt install android-tools-adb 
sudo apt install android-tools-fastboot 
sudo apt install usb-modeswitch

```

* Configure `/etc/udev/rules.d/` to be able to connect to Android devices. 

**Unfortunately connecting Android device to pi with raspbian breaks the wifi connection, so no ssh, no internet when android USB device is connected. 
This does not happen for ubuntu server running at Pi. Ubuntu is using different network control mechanism.** 

