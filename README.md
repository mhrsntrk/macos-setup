## Step 1: General macOS Settings

#### Turn on Firewall

- `System Preferences` > `Security and Privacy` > `Firewall` > `Turn On Firewall`

#### Turn on FileVault

- `System Preferences` > `Security and Privacy` > `FileVault` > `Turn On FileVault`

#### Show hidden files in Finder

- Open “Finder”
- Press the `Command` + `Shift` + `.` (period) keys at the same time

#### Sort folders first in Finder

- Open "Terminal"
- Run `defaults write com.apple.finder _FXSortFoldersFirst -bool true; killall Finder`

#### Show Path in Finder

- Open "Terminal"
- Run `defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder`

#### Show user in Finder sidebar

- `Finder` > `Preferences` > `Sidebar` > `(Check) <user> on the sidebar`

#### Set the new finder window show

- `Finder` > `Preferences` > `General` > `(Select) user folder from dropdown`

#### Disable autocorrect spelling

- `System Preferences` > `Keyboard` > `Text` > `(Uncheck) Disable “Correct spelling automatically”`

#### Enable fast keystrokes and key repeats

- `System Preferences` > `Keyboard`
- Set “Key Repeat” to “Fast”
- Set Delay Until Repeat” to “Short”

#### Fix trackpad direction

- `System Preferences` > `Trackpad` > `Scroll & Zoom` > `Turn Off Natural Scrolling`

#### Turn off the dictionary look up

- `System Preferences` > `Trackpad` > `Point & Click` > `Turn Off Look up & data detectors`

#### Enable Key Repeat

- Open "Terminal"
- Run `defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false`

## Step 2: Developer Environment Setup

#### Install Rosetta 2

- Open "Terminal"
- Run `/usr/sbin/softwareupdate --install-rosetta --agree-to-license`

#### Create the "Developer" folder

- Open "Finder" (it should navigate to user folder automatically)
- Create a new folder named "Developer"

#### Change the computer name

- `sudo scutil --set ComputerName "newname"`
- `sudo scutil --set LocalHostName "newname"`
- `sudo scutil --set HostName "newname"`

#### Install Xcode command line tools

- Open "Terminal"
- Run `xcode-select --install`

#### Install Homebrew

- Open "Terminal"
- Run `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Run `brew update; brew upgrade; brew cleanup; brew doctor` to make sure it is up-to-date and healthy

#### Apps to install using Homebrew

- `brew install node@18`
- `brew install yarn`
- `brew install go`
- `brew install tree`
- `brew install tmux`
- `brew install cointop`
- `brew install btop`
- `brew install bat`
- `brew install nb`
- `brew install neovim`
- `brew install midnight-commander`
- `brew install --cask iterm2`
- `brew install --cask visual-studio-code`
- `brew install --cask github`
- `brew install --cask docker`
- `brew install --cask postman`
- `brew install --cask burp-suite`

#### Configure git

- `brew install git`
- `git config --global user.name "<username>"`
- `git config --global user.email "<email>"`
- `git config --global color.ui auto`

#### Generate an SSH Key

- Run `ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`

## Step 3: iTerm2 Setup

- Install the [fonts](https://github.com/mhrsntrk/macos-dev-setup/tree/main/iTerm2/Fonts) in this repo
- Open "iTerm2"
- `Preferences` > `Profiles` > `...Other Actions` > `Import JSON Profiles`
- Select the [JSON file](https://github.com/mhrsntrk/macos-dev-setup/blob/main/iTerm2/mhrsntrk.json) in this repo
- Select imported profile and navigate to `Text` sub-menu
- Select `MononokiNerdFont` - `Regular` for primary font
- Select `SymbolsNerdFont` - `Regular` for Non-ASCII font

## Step 4: Oh-My-Zsh Setup

- Run `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` to install Oh-My-Zsh
- Replace the `.zshrc` file with below;

```bash
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

source "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
```

- Install zsh-autosuggestions by using `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
- Install spaceship theme by using `npm install -g spaceship-zsh-theme`

## Step 5: tmux Configuration

- Run `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
- Copy the [.tmux.conf](https://github.com/mhrsntrk/macos-dev-setup/blob/main/.tmux.conf) file in this repo
- Run `source-file ~/.tmux.conf` to load
- On tmux press `[prefix]` + `⇧ Shift` + `i` to install plugins

## Step 6: nvim Configuration

- Run `git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim`
- Open nvim
- Type `N` to install example config
- Press `Space`+`t`+`h` to open theme switcher, and set it to `One Dark`
- Copy the content of the [custom](https://github.com/mhrsntrk/macos-dev-setup/blob/main/custom) folder in this repo into `$HOME/.config/nvim/lua/custom`
- Restart nvim

## Step 7: Install VS Code Extensions

> In case the "Settings Sync" doesn't work

```bash
code --install-extension alexkrechik.cucumberautocomplete
code --install-extension anseki.vscode-color
code --install-extension bradgashler.htmltagwrap
code --install-extension bradlc.vscode-tailwindcss
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension golang.go
code --install-extension GraphQL.vscode-graphql-syntax
code --install-extension heybourn.headwind
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension naumovs.color-highlight
code --install-extension oliversturm.fix-json
code --install-extension pranaygp.vscode-css-peek
code --install-extension Rubymaniac.vscode-paste-and-indent
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension Tyriar.lorem-ipsum
code --install-extension Tyriar.sort-lines
code --install-extension vincaslt.highlight-matching-tag
code --install-extension vscode-icons-team.vscode-icons
code --install-extension zhuangtongfa.material-theme
code --install-extension Zignd.html-css-class-completion
```

## Step 8: Install Essential Apps

#### Using HomeBrew

- `brew install --cask setapp`
- `brew install --cask raycast`
- `brew install --cask cron`
- `brew install --cask brave-browser`
- `brew install --cask slack`
- `brew install --cask discord`
- `brew install --cask zoom`
- `brew install --cask spotify`
- `brew install --cask protonvpn`
- `brew install --cask adobe-creative-cloud`

#### Using SetApp

- IM+
- BetterTouchTool
- iStat Menus
- PDF Squeezer
- CleanShot X
- CleanMyMac X
- TablePlus
- Archiver
- Squash

#### Other Applications

- [Ledger Live](https://www.ledger.com/ledger-live)

## Step 9: Install Brave Extensions

- [Proton Pass](https://chrome.google.com/webstore/detail/proton-pass-free-password/ghmbeldphafepmbegfdlkpapadhbakde)
- [MetaMask](https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn)
- [Polkadot.js](https://chrome.google.com/webstore/detail/polkadot%7Bjs%7D-extension/mopnmbcafieddcagagdcbnhejhlodfdd)
- [Auro Wallet](https://chrome.google.com/webstore/detail/auro-wallet/cnmamaachppnkjgnildpdmkaakejnhae)
- [Grammar & Spell Checker](https://chrome.google.com/webstore/detail/grammar-spell-checker%E2%80%94lan/oldceeleldhonbafppcapldpdifcinji)
- [Loom](https://chrome.google.com/webstore/detail/loom-%E2%80%93-screen-recorder-sc/liecbddmkiiihnedobmlmillhodjkdmb)
- [JSON Viewer](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh)
