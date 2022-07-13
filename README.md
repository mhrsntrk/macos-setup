## Step 1: General macOS Settings

#### Turn on Firewall
- `System Preferences` > `Security and Privacy` > `Firewall` > `Turn On Firewall`

#### Turn on FileVault
- `System Preferences` > `Security and Privacy` > `FileVault` > `Turn On FileVault`

#### Show hidden files in Finder
- Open “Finder”
- Press the Command + Shift + . (period) keys at the same time

#### Show status bar in Finder
- Open “Finder”
- `View` > `Show Path Bar`

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

## Step 2: Developer Environment Setup

#### Create the "Developer" folder
- Open “Finder” (it should navigate to user folder automatically)
- Create a new folder named "Developer"

#### Install Xcode command line tools
- Open "Terminal" 
- Run `xcode-select --install`

#### Install Homebrew
- Open "Terminal" 
- Run `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Run `brew update; brew upgrade; brew cleanup; brew doctor` to make sure it is up-to-date and healthy

#### Get essentials using Homebrew
- `brew install node`
- `brew install yarn`
- `brew install go`
- `brew install tree`
- `brew install --cask iterm2`
- `brew install --cask visual-studio-code`
- `brew install --cask docker`
- `brew install --cask raycast`
- `brew install --cask cron`
- `brew install --cask fig`
- `brew install --cask brave-browser`
- `brew install --cask notion`
- `brew install --cask slack`

#### Configure git
- `brew install git`
- `git config --global user.name "<usename>"`
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
- Select `mononoki Nerd Font` - `Regular` for primary font
- Select `Overpass Nerd Font Mono` - `Bold` for Non-ASCII font

## Step 4: Oh-My-Zsh Setup
- Run `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` to install Oh-My-Zsh
- Replace the `.zshrc` file with below;

```bash
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(zsh-autosuggestions transfer per-directory-history sudo z)

source $ZSH/oh-my-zsh.sh

SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_CHAR_SYMBOL="\uf0e7"
SPACESHIP_CHAR_SUFFIX=("  ")
SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_USER_SHOW="true"
SPACESHIP_TIME_SHOW="true"

alias zshconfig="code ~/.zshrc"
alias zshreload='source ~/.zshrc'
alias myip='curl http://ipecho.net/plain; echo'
alias dev="cd ~/developer"
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"
alias copyssh="pbcopy < ~/.ssh/id_rsa.pub"
```

- Install zsh-autosuggestions by using `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
- Install spaceship theme by using `npm install -g spaceship-zsh-theme`

