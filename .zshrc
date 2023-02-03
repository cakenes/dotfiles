# ~/.zshrc

alias ls="ls --color=auto"
alias df="df -Tha --total"
alias free="free -mt"
alias grep="grep --color=auto"
alias xcode="open -a Xcode"
alias android="open -a Android\ Studio"
alias simulator="open -a Simulator.app"
alias simulator2="open -a Simuatlor.app"

setopt autocd
HISTSIZE=999999999

export PATH=/opt/homebrew/bin:$PATH
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export PS1=$'\033[01;34m%n\033[01;34m:\033[00m%~\033[m\$ '
export PYENV_ROOT="$HOME/.pyenv"
export NVM_DIR="$HOME/.nvm"
export PATH="$PYENV_ROOT/bin:$PATH"

alias run-pihlapotilas="cd ~/git/pihlapotilas && yarn start"
alias run-pihlaserver="cd ~/git/pihla-server && yarn run local"
alias run-prosecco="cd ~/git/prosecco && yarn local"
alias run-pihladoctor="cd ~/git/pihla-doctor && yarn local"

alias git-pp-local="pushd ~/git/pihlapotilas && arch -x86_64 npx react-native run-ios --scheme 'pihlapotilas local' --simulator='iPhone 14 Pro' && popd"
alias git-pp-local-se="pushd ~/git/pihlapotilas && arch -x86_64 npx react-native run-ios --scheme 'pihlapotilas local' --simulator='iPhone SE' && popd"
alias git-pp-staging="pushd ~/git/pihlapotilas && arch -x86_64 npx react-native run-ios --scheme 'pihlapotilas staging' --simulator='iPhone 14 Pro' && popd"

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

source /Users/Used/.docker/init-zsh.sh || true # Added by Docker Desktop

eval "$(starship init zsh)"
eval "$(rbenv init - )"
