## How to Setup DWM from suckless at Kali Linux / Debian Testing 

* Install packages and get dev libraries

```
sudo apt install dwm suckless-tools
sudo apt install stterm

mkdir /opt
cd /opt

git clone git://git.suckless.org/dwm
cd dwm

sudo apt install libx11-dev libxft-dev libxinerama-dev

```

* make changes in source files:

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
diff --git a/config.mk b/config.mk
index 25e2685..b599bf2 100644
--- a/config.mk
+++ b/config.mk
@@ -7,8 +7,8 @@ VERSION = 6.1
 PREFIX = /usr/local
 MANPREFIX = ${PREFIX}/share/man
 
-X11INC = /usr/X11R6/include
-X11LIB = /usr/X11R6/lib
+X11INC = /usr/include/X11
+X11LIB = /usr/lib/X11
 
 # Xinerama, comment if you don't want it
 XINERAMALIBS  = -lXinerama

```
create file ~/.xinitrc

```
exec nitrogen --restore &
while true ; do xsetroot -name "`date '+%Y-%m-%d %H:%M.%S'` `uptime |sed 's/.*,//'`"; sleep 1 ; done &
exec /opt/dwm/dwm

```

ln -s ~/.xinitrc ~/.xsession
chmod 755 ~/.xinitrc

create file /usr/share/xsessions/custom-dwm.desktop
```
[Desktop Entry]
Name=Kowalczy-DWM
Exec=/etc/X11/Xsession
```


