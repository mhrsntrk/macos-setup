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

```bash
brew install node typescript yarn pnpm tmux btop eza fzf gh jq lazygit tree tailscale yazi
```

```bash
brew install --cask github brave-browser zen-browser ghostty obsidian orbstack postman protonvpn raycast zoom slack setapp visual-studio-code rectangle-pro
```

#### Configure git

- `brew install git`
- `git config --global user.name "<username>"`
- `git config --global user.email "<email>"`
- `git config --global color.ui auto`

#### Generate an SSH Key

- Run `ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`

## Step 3: Ghostty Setup

- Open "Ghostty" app
- Press `Command` + `,` to open app preferences
- Paste the below configuration
```
shell-integration = zsh

# Font settings
font-family = Berkeley Mono
font-size = 16

# Cursor settings
mouse-hide-while-typing = true
cursor-style-blink = false
cursor-style = block
adjust-cursor-thickness = 300%

# Don't ask when closing
confirm-close-surface = false

# Always save the state of window when quitting
window-save-state = always
```
- Restart Ghostty app

## Step 4: Oh-My-Zsh Setup

- Run `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` to install Oh-My-Zsh
- Replace the `.zshrc` file in this repo
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