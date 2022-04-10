# ~/.bash_profile

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export TERM=linux
export FILE=thunars
export AUDIO=lollypop
export EDITOR=nano
export DOTNET_ROOT=/usr/share/dotnet
export PATH=$PATH:/usr/share/dotnet
export JDK_HOME=/usr/lib/jvm/java-14-openjdk

#export GDK_SCALE=2
#export GTK_DPI_SCALE=0.5
#export QT_QPA_PLATFORMTHEME="qt5ct"
#export QT_AUTO_SCREEN_SCALE_FACTOR=0
#export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
#export QT_SCALE_FACTOR=2
#export QT_FONT_DPI=96
#export ELM_SCALE=2

export DOTNET_CLI_TELEMETRY_OPTOUT=1
export VDPAU_DRIVER=va_gl
export LVM_SUPPRESS_FD_WARNINGS=1

# autostart xfce
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x xfce4-session >/dev/null && exec startx

# autostart i3
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# autostart kde
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x plasmashell >/dev/null && exec startx
