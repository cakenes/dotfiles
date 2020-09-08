# ~/.bash_profile

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export TERMINAL=alacritty
export FILE=dolphin
export AUDIO=lollypop
export EDITOR=nano
export DOTNET_ROOT=/usr/share/dotnet
export PATH=$PATH:/usr/share/dotnet

export GDK_SCALE=2
export GTK_DPI_SCALE=0.5
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_SCALE_FACTOR=2
export QT_FONT_DPI=96
export ELM_SCALE=2

# autostart xfce
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x xfce4-session >/dev/null && exec startx

# autostart i3
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# autostart kde
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x plasmashell >/dev/null && exec startx
