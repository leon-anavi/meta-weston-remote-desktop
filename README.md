This README file contains information on the contents of the meta-weston-rdp layer.

Please see the corresponding sections below for details.

Dependencies
============

  URI: <first dependency>
  branch: <branch name>

  URI: <second dependency>
  branch: <branch name>

  .
  .
  .

Patches
=======

Please submit any patches against the meta-rauc-raspberrypi layer via GitHub pull request on https://github.com/leon-anavi/meta-weston-rdp.

Maintainer: Leon Anavi <leon.anavi@konsulko.com>

Table of Contents
=================

  I. Adding the meta-weston-rdp layer to your build
 II. Misc


I. Adding the meta-weston-rdp layer to your build
=================================================

Run `bitbake-layers add-layer meta-weston-rdp`

II. Misc
========

From another computer in the same network connect to the embedded
device using a Remote Desktop Protocol (RDP) client:

* For Wayland:

```
wlfreerdp /v:<ip>
```

* For X11:

```
xfreerdp /v:<ip>
```

* On the target device generate RDP certificates:

```
winpr-makecert -rdp -path $PWD
```

* Enable automatic startup of RDP screen sharing in `weston.ini`, for example add:

```
[screen-share]
command=/usr/bin/weston --backend=rdp-backend.so --rdp-tls-cert=/etc/freerdp/keys/server.crt --rdp-tls-key=/etc/freerdp/keys/server.key --shell=fullscreen-shell.so --no-clients-resize
start-on-startup=true
```

* Launch weston with `screen-share.so`, for example in Weston systemd service:

```
ExecStart=/usr/bin/weston --modules=systemd-notify.so,screen-share.so --log=/var/log/weston.log
```

