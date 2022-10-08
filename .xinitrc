#!/bin/bash
# ~/.xinitrc

# defaults
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

<<<<<<< HEAD
# merge defaults
if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
=======

# merge defaults
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
>>>>>>> 059399a893ce41726188a7ed79f1bf213922d112
fi

# autostart
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
<<<<<<< HEAD
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# start wm / de
=======
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# start wm / de

>>>>>>> 059399a893ce41726188a7ed79f1bf213922d112
exec xfce4-session

# support for screen off
xset s off
xset -dpms
<<<<<<< HEAD
xset s nblank
=======
xset s noblank
>>>>>>> 059399a893ce41726188a7ed79f1bf213922d112
