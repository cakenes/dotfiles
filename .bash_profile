# ~/.bash_profile

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

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

export HISTSIZE=
export HISTFILESIZE=
export HISTCONTROL=ignoredups:erasedups
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export DOCKER_HOST=unix:///var/run/docker.sock
