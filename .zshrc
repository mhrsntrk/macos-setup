export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

ZSH_THEME="spaceship"
EDITOR="nvim"

plugins=(zsh-autosuggestions transfer per-directory-history sudo z)

source $ZSH/oh-my-zsh.sh

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

killport() {
    PID=$(lsof -ti ":$1")
    if [ ! -z "$PID" ]; then
        echo "PORT: $1"
        echo "PID:  $PID"
        kill -9 $PID
        echo "OK!"
    else
        echo "No Process Found running Port $1"
    fi
}

SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_CHAR_SYMBOL="\uf0e7"
SPACESHIP_CHAR_SUFFIX=("  ")
SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_USER_SHOW="true"
SPACESHIP_TIME_SHOW="true"

alias c='clear'
alias e='exit'
alias gp='git pull'
alias gf='git fetch'
alias zshrc="$EDITOR ~/.zshrc"
alias zshreload='source ~/.zshrc'
alias myip='curl http://ipecho.net/plain; echo'
alias dev="cd ~/developer"
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"
alias copyssh="pbcopy < ~/.ssh/id_rsa.pub"
alias dsdel="find . -name '.DS_Store' -type f -print -delete"
alias vim="nvim"
alias cat="bat"

source "/$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
