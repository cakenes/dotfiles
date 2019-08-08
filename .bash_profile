# ~/.bash_profile

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export IMAGE="feh"
export EDITOR="st -e nano"
export TERMINAL="st"
export BROWSER="firefox"
export READER="evince"
export FILE="ranger"
export AUDIO="/deadbeef"
export DOTNET_ROOT="/opt/donet"

# Start i3 on tty1 if i3 is not running
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
