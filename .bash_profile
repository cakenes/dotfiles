# ~/.bash_profile

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
export TERMINAL=st
export FILE=dolphin
export AUDIO=deadbeef
export DOTNET_ROOT=/opt/donet
export PATH=$PATH:/opt/dotnet
# export KDEWM=/usr/bin/i3

# autostart i3
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# autostart kde
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x plasmashell >/dev/null && exec startx
