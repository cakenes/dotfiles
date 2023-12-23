# ~/.zshrc

alias ls="ls --color=auto"
alias df="df -Tha --total"
alias free="free -mt"
alias grep="grep --color=auto"
alias xcode="open -a Xcode"
alias android="open -a Android\ Studio"
alias simulator="open -a Simulator.app"

setopt autocd
HISTSIZE=999999999

# Postgresql
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@15/lib/pkgconfig"

export PATH=/opt/homebrew/bin:$PATH
export PATH="/opt/homebrew/sbin:$PATH"
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export PS1=$'\033[01;34m%n\033[01;34m:\033[00m%~\033[m\$ '
export PYENV_ROOT="$HOME/.pyenv"
export NVM_DIR="$HOME/.nvm"
export PATH="$PYENV_ROOT/bin:$PATH"

alias run-pihlapotilas="cd ~/git/pihlapotilas && yarn start"
alias run-pihlaserver="cd ~/git/pihla-server && yarn run local"
alias run-prosecco="cd ~/git/prosecco && yarn local"
alias run-pihladoctor="cd ~/git/pihla-doctor && yarn local"

alias check="yarn format:check && yarn typecheck:partial && yarn lint"

alias git-pr="gh search prs --state=open --review-requested=@me"
#alias git-changes="git log --oneline --ancestry-path '$1'..'$2' | grep 'Merge'"
#function git-changes() { "git log --oneline --ancestry-path "$1".."$2" | grep 'Merge'" }
alias git-pp-local="pushd ~/git/pihlapotilas && arch -x86_64 npx react-native run-ios --scheme 'pihlapotilas local' --simulator='iPhone 15 Pro' && popd"
alias git-pp-local-se="pushd ~/git/pihlapotilas && arch -x86_64 npx react-native run-ios --scheme 'pihlapotilas local' --simulator='iPhone SE (3rd generation)' && popd"
alias git-pp-staging="pushd ~/git/pihlapotilas && arch -x86_64 npx react-native run-ios --scheme 'pihlapotilas staging' --simulator='iPhone 15 Pro' && popd"

[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Automatic nvmrc
autoload -U add-zsh-hook

load-nvmrc() {
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
       local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

        if [ "$nvmrc_node_version" = "N/A" ]; then
            nvm install
        elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
            nvm use
        fi
    fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

source ~/.docker/init-zsh.sh || true # Added by Docker Desktop

eval "$(starship init zsh)"
eval "$(rbenv init - )"
eval "$(pyenv init --path)"
