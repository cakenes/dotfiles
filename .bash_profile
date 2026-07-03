# ~/.bash_profile

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export TERM=linux
export FILE=thunar
export EDITOR=/usr/bin/nano

export DOTNET_ROOT=/usr/share/dotnet
export PATH=$PATH:/usr/share/dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=1

export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export ANDROID_SDK_ROOT=/opt/android-sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export CAPACITOR_ANDROID_STUDIO_PATH=/opt/android-studio/bin/studio

export QT_STYLE_OVERIDE=GTK+
export QT_QPA_PLATFORMTHEME=gtk3
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES=$HOME/.config/gtk-2.0/.gtkrc-2.0
export GTK_THEME=Arc-Dark
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons

export LIBVA_DRIVER_NAME=nvidia
export DXVK_FRAME_RATE=120

export HISTSIZE=
export HISTFILESIZE=
export HISTCONTROL=ignoredups:erasedups
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export DOCKER_HOST=unix:///var/run/docker.sock
export DESKTOP_SESSION=i3wm

export PATH="$PATH:/home/used/.lmstudio/bin"

# wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=1

# autostart xfce
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x xfce4-session >/dev/null && exec startx

# autostart i3
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# autostart kde
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x plasmashell >/dev/null && exec startx

# autostart sway
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x sway >/dev/null && exec sway --unsupported-gpu
