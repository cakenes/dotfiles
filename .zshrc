# ~/.zshrc

source ~/.npm_profile

alias vim="nvim"
alias ls="ls --color=auto"
alias df="df -Tha --total"
alias free="free -mt"
alias grep="grep --color=auto"
alias xcode="open -a Xcode"
alias android="open -a Android\ Studio"
alias simulator="open -a Simulator.app"
alias quarantine="xattr -dr com.apple.quarantine"
alias check="yarn format:check && yarn typecheck:partial && yarn lint"

setopt autocd
HISTSIZE=999999999

# Postgresql
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@15/lib/pkgconfig"

export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH
export PATH="/opt/homebrew/sbin:$PATH"
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export PS1=$'\033[01;34m%n\033[01;34m:\033[00m%~\033[m\$ '
export PYENV_ROOT="$HOME/.pyenv"
export NVM_DIR="$HOME/.nvm"
export PATH="$PYENV_ROOT/bin:$PATH"
export EDITOR=nano

export LDFLAGS="-L/opt/homebrew/opt/node@22/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@22/include"

function git-merges() { git --no-pager log $1..$2 --merges --pretty=format:%b; }
alias git-pr="gh search prs --state=open --review-requested=@me"
alias git-pp-local="pushd ~/git/pihlapotilas && arch -x86_64 npx react-native run-ios --scheme 'pihlapotilas local' --simulator='iPhone 15 Pro' && popd"
alias git-pp-local-se="pushd ~/git/pihlapotilas && arch -x86_64 npx react-native run-ios --scheme 'pihlapotilas local' --simulator='iPhone SE (3rd generation)' && popd"
alias git-pp-staging="pushd ~/git/pihlapotilas && arch -x86_64 npx react-native run-ios --scheme 'pihlapotilas staging' --simulator='iPhone 15 Pro' && popd"

source ~/.docker/init-zsh.sh || true # Added by Docker Desktop

eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"

rbenv() {
  unset -f rbenv
  eval "$(rbenv init -)"
  rbenv "$@"
}

pyenv() {
  unset -f pyenv
  eval "$(pyenv init --path)"
  pyenv "$@"
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Used/git/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/Used/git/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Used/git/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/Used/git/google-cloud-sdk/completion.zsh.inc'; fi

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
# fpath=(/Users/Used/.docker/completions $fpath)
# autoload -Uz compinit
# compinit
# End of Docker CLI completions

git-find() {
  if [ -z "$1" ]; then
    echo "Usage: gfindfile <pattern>"
    return 1
  fi

  local pattern="$1"

  git branch -a | sed 's/*//' | while IFS= read -r b; do
    git ls-tree -r --name-only "$b" 2>/dev/null | grep -q "$pattern" && echo "$b"
  done
}

