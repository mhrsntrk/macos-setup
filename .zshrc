export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"
EDITOR="nvim"

plugins=(zsh-autosuggestions transfer per-directory-history sudo z)

source $ZSH/oh-my-zsh.sh

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

killport() {
    if [ -z "$1" ]; then
        echo "Usage: killport <port>"
        return 1
    fi
    local port="$1"
    local pids
    pids=$(lsof -ti :"$port")
    if [ -z "$pids" ]; then
        echo "No process found running port $port"
        return 0
    fi
    echo "Found PID(s) using port $port: $pids"
    echo "$pids" | xargs kill
    sleep 3
    pids_still=$(lsof -ti :"$port")
    if [ -z "$pids_still" ]; then
        echo "Process(es) terminated successfully!"
        return 0
    fi
    echo "Force killing remaining PID(s): $pids_still"
    echo "$pids_still" | xargs kill -9
    echo "Done!"
}

exiftract() {
  exiftool -Make -Model -LensMake -LensModel \
    -DateTimeOriginal -ApertureValue -FNumber \
    -ExposureMode -ExposureProgram -ExposureTime \
    -ShutterSpeedValue -WhiteBalance -ISO -ISOSpeedRatings "$1" | pbcopy
    echo "EXIF data successfully copied to clipboard"
}

tmuxon() {
  tmux attach -t 01101101 2>/dev/null \
    && return       # if attach succeeds, stop here
  tmux new -s 01101101
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
alias hn="clx -n"
alias ls='eza --all --long --group-directories-first --icons --header --time-style long-iso --git --hyperlink --color-scale=size --octal-permissions --binary --no-permissions'
alias lt='eza --tree --level=2 --long'
alias opencodeup='brew upgrade opencode && cd ~/.config/opencode && npm update'

eval "$(fzf --zsh)"

source "/$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/mhrsntrk/.lmstudio/bin"
# End of LM Studio CLI section


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export GPG_TTY=$(tty)
