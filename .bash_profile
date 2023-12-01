# ~/.bash_profile

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export TERM=linux
export FILE=thunar
export AUDIO=lollypop
export EDITOR=/usr/bin/nano
export DOTNET_ROOT=/usr/share/dotnet
export PATH=$PATH:/usr/share/dotnet

export ANDROID_SDK_ROOT=/opt/android-sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES=$HOME/.gtkrc-2.0

export DOTNET_CLI_TELEMETRY_OPTOUT=1
export LVM_SUPPRESS_FD_WARNINGS=1
export GTK_THEME=Arc-Dark

export LIBVA_DRIVER_NAME=nvidia

# autostart xfce
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x xfce4-session >/dev/null && exec startx

# autostart i3
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# autostart kde
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x plasmashell >/dev/null && exec startx
