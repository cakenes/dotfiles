# ~/.bash_profile

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export TERMINAL=konsole
export FILE=dolphin
export AUDIO=deadbeef
export DOTNET_ROOT=/opt/dotnet
export PATH=$PATH:/opt/dotnet

# autostart kde
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x plasmashell >/dev/null && exec startx
