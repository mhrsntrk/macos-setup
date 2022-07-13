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

#### Disable auto correct spelling
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
- Run `brew update; brew upgrade; brew cleanup; brew doctor` to make sure it is up to date and healthy

#### Get essentials using Homebrew
- `brew install node`
- `brew install go`
- `brew install tree`
- `brew install --cask iterm2`
- `brew install --cask visual-studio-code`
- `brew install --cask docker`
- `brew install --cask raycast`
- `brew install --cask cron`
- `brew install --cask brave-browser`
- `brew install --cask notion`
- `brew install --cask slack`

#### Configure git
- `brew install git`
- `git config --global user.name "<usename>"`
- `git config --global user.email "<email>"`
- `git config --global color.ui auto`

#### Install Oh-My-Zsh
- Run `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

#### Generate a SSH Key
- Run `ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`

## Step 3: iTerm2 Setup


## Step 4: Oh-My-Zsh Setup

