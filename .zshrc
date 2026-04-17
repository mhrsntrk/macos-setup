# =============================================================================
# ~/.zshrc - Zsh configuration
# =============================================================================

# -----------------------------------------------------------------------------
# PERFORMANCE PROFILING (uncomment both lines to benchmark startup)
# -----------------------------------------------------------------------------
# zmodload zsh/zprof

# -----------------------------------------------------------------------------
# OH MY ZSH SETUP
# -----------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

ZSH_THEME="spaceship"

# Plugins - zsh-syntax-highlighting MUST be last
plugins=(
  zsh-autosuggestions
  transfer
  per-directory-history
  sudo
  z
  zsh-syntax-highlighting
)

# Skip OMZ's compfix security check for faster startup
ZSH_DISABLE_COMPFIX=true

# Completion optimization - prevent duplicate compinit on reload
# Only load completions once per shell session
if [[ -z "$_OMZ_COMPINIT_DONE" ]]; then
  # Set flag so we skip this on future reloads
  _OMZ_COMPINIT_DONE=1
  
  # Compile compdump for faster loading (runs once per session)
  if [[ -f ~/.zcompdump ]]; then
    zcompile ~/.zcompdump 2>/dev/null
  fi
fi

source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------
# LOCALE
# -----------------------------------------------------------------------------
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# -----------------------------------------------------------------------------
# FUNCTIONS
# -----------------------------------------------------------------------------

# Extract EXIF data from images to clipboard
exiftract() {
  if [[ -z "$1" ]]; then
    echo "Usage: exiftract <image-file>" >&2
    return 1
  fi
  
  if [[ ! -f "$1" ]]; then
    echo "Error: File not found: $1" >&2
    return 1
  fi
  
  exiftool -Make -Model -LensMake -LensModel \
    -DateTimeOriginal -ApertureValue -FNumber \
    -ExposureMode -ExposureProgram -ExposureTime \
    -ShutterSpeedValue -WhiteBalance -ISO -ISOSpeedRatings "$1" 2>/dev/null | pbcopy
  
  if [[ $? -eq 0 ]]; then
    echo "EXIF data copied to clipboard"
  else
    echo "Error: Failed to extract EXIF data" >&2
    return 1
  fi
}

# Attach to or create tmux session
tmuxon() {
  local session_name="01101101"
  tmux attach -t "$session_name" 2>/dev/null && return
  tmux new -s "$session_name"
}

# -----------------------------------------------------------------------------
# ALIASES
# -----------------------------------------------------------------------------

# System
alias c='clear'
alias e='exit'

# Clipboard - copy file contents (usage: cpf <file>)
alias cpf='pbcopy <'

# Git
alias ga='git add'
alias gc='git commit -m'
alias gs='git status'
alias gp='git pull'
alias gf='git fetch'

# Development
alias vim="nvim"
alias dev="cd ~/developer"
alias zshrc="$EDITOR ~/.zshrc"
alias zshreload='source ~/.zshrc'

# Homebrew
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"

# Networking
alias myip='curl -s http://ipecho.net/plain; echo'

# File management
alias dsdel="find . -name '.DS_Store' -type f -print -delete"

# Hacker News
alias hn="clx -n"

# eza (modern ls replacement)
alias ls='eza --all --long --group-directories-first --icons --header --time-style long-iso --git --hyperlink --color-scale=size --octal-permissions --binary --no-permissions'
alias lt='eza --tree --level=2 --long --icons'

# OpenCode
alias opencodeup='brew upgrade opencode && cd ~/.config/opencode && npm update'
# -----------------------------------------------------------------------------
# TOOL INTEGRATIONS
# -----------------------------------------------------------------------------

# fzf
if command -v fzf &>/dev/null; then
  eval "$(fzf --zsh)"
fi

# -----------------------------------------------------------------------------
# SPACESHIP PROMPT CONFIGURATION
# -----------------------------------------------------------------------------
SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_CHAR_SYMBOL="\uf0e7"
SPACESHIP_CHAR_SUFFIX=("  ")
SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_USER_SHOW="true"
SPACESHIP_TIME_SHOW="true"
SPACESHIP_PROMPT_ASYNC="true"

# -----------------------------------------------------------------------------
# PERFORMANCE PROFILING OUTPUT (uncomment both lines to benchmark startup)
# -----------------------------------------------------------------------------
# zprof

# Created by `pipx` on 2026-04-17 10:25:18
export PATH="$PATH:/Users/mhrsntrk/.local/bin"
