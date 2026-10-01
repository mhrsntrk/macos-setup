# macos-setup

My macOS setup: system settings, Homebrew packages, dotfiles, and Claude Code configuration.

```
Brewfile                 Homebrew formulae, casks, taps + npm/uv/go/cargo globals
.zshrc .zshenv           Zsh config (Oh My Zsh + spaceship)
.zshrc.local.example     Template for machine-local aliases/secrets (never committed)
.tmux.conf               tmux config
ghostty/config           Ghostty config
nvim/                    LazyVim overrides (colorscheme + extras)
claude/                  Claude Code settings, global CLAUDE.md, plugin + skill installers
RectangleProConfig.json  Rectangle Pro
*.bttpreset              BetterTouchTool preset
```

## Step 1: General macOS Settings

#### Turn on Firewall

- `System Settings` > `Network` > `Firewall` > `Turn On`

#### Turn on FileVault

- `System Settings` > `Privacy & Security` > `FileVault` > `Turn On`

#### Show hidden files in Finder

- Open "Finder"
- Press `Command` + `Shift` + `.` (period)

#### Finder tweaks

```bash
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
killall Finder
```

- `Finder` > `Settings` > `Sidebar` > check your user folder
- `Finder` > `Settings` > `General` > "New Finder windows show" > your user folder

#### Keyboard

- `System Settings` > `Keyboard` > "Key repeat rate" to Fast, "Delay until repeat" to Short
- `System Settings` > `Keyboard` > `Text Input` > `Edit` > turn off "Correct spelling automatically"
- Enable key repeat in all apps (instead of the accent popup):

```bash
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
```

#### Trackpad

- `System Settings` > `Trackpad` > `Scroll & Zoom` > turn off "Natural scrolling"
- `System Settings` > `Trackpad` > `Point & Click` > turn off "Look up & data detectors"

#### Keep the Mac awake on power (Tailscale / remote sessions)

Idle sleep on AC drops the machine off the tailnet. Disable sleep on charger only:

```bash
sudo pmset -c sleep 0
```

## Step 2: Developer Environment

#### Command line tools, Rosetta, Developer folder

```bash
xcode-select --install
/usr/sbin/softwareupdate --install-rosetta --agree-to-license
mkdir -p ~/Developer
```

Install full Xcode from the App Store (needed for iOS work and `sourcekit-lsp`).

#### Computer name

```bash
sudo scutil --set ComputerName "newname"
sudo scutil --set LocalHostName "newname"
sudo scutil --set HostName "newname"
```

#### Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Clone this repo and install everything

```bash
git clone https://github.com/mhrsntrk/macos-setup ~/Developer/macos-setup
brew bundle install --file=~/Developer/macos-setup/Brewfile
```

The Brewfile also installs global npm packages, uv tools, Go tools, and cargo crates.
Check for drift later with `brew bundle check --verbose --file=~/Developer/macos-setup/Brewfile`.

#### Bun

```bash
curl -fsSL https://bun.sh/install | bash
```

#### Apps not in Homebrew

Install manually (App Store or vendor site):

- **App Store:** Xcode, Final Cut Pro, Logic Pro, Motion, Keynote, Pages, Numbers, TestFlight, Telegram, Keepa
- **Vendor:** Obsidian, Signal, Rectangle Pro, Proton Drive, Ledger Wallet, Logi Options+, Jabra Direct, NuPhyIO, Bambu Studio, Steam, Adobe CC, Affinity Designer 2, ON1 Photo RAW, LanguageTool, Monodraw, Reflector 4, VMware Fusion, Raspberry Pi Imager, qFlipper
- **Fonts:** Berkeley Mono (licensed) into `~/Library/Fonts`

## Step 3: Git, GPG, SSH

#### Git

```bash
git config --global user.name "<username>"
git config --global user.email "<email>"
git config --global color.ui auto
git lfs install
gh auth login          # also sets gh as the GitHub credential helper
gh auth setup-git
```

#### GPG commit signing

```bash
gpg --full-generate-key                    # or import an existing key
gpg --list-secret-keys --keyid-format=long # copy the key id
git config --global user.signingkey <KEY_ID>
git config --global commit.gpgsign true
echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
gpgconf --kill gpg-agent
gpg --armor --export <KEY_ID> | pbcopy     # add to GitHub > Settings > SSH and GPG keys
```

#### SSH key

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

## Step 4: Shell (Oh My Zsh)

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

(`spaceship-zsh-theme` is installed by the Brewfile's npm section.)

Copy the dotfiles:

```bash
cd ~/Developer/macos-setup
cp .zshrc .zshenv .tmux.conf ~/
cp .zshrc.local.example ~/.zshrc.local   # then fill in server aliases
```

`~/.zshrc.local` holds machine-specific aliases (server IPs, key names). It is sourced at the end of `.zshrc` and never committed.

## Step 5: Ghostty

```bash
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
cp ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
```

Restart Ghostty.

## Step 6: tmux

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source-file ~/.tmux.conf
```

Inside tmux press `prefix` (`Ctrl-A`) + `Shift` + `I` to install plugins.

Helpers in `.zshrc`: `tmuxon` attaches to the main session, `tmuxc [dir]` opens a Claude Code window in it.

## Step 7: Neovim (LazyVim)

```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
cp nvim/lazyvim.json ~/.config/nvim/
cp nvim/lua/plugins/colorscheme.lua ~/.config/nvim/lua/plugins/
nvim
```

LazyVim installs plugins on first launch. Theme is One Dark (`onedarkpro.nvim`); enabled extras are in `lazyvim.json`.

## Step 8: Claude Code

The `claude-code@latest` cask is installed by the Brewfile. Log in once with `claude`, then:

```bash
mkdir -p ~/.claude
cp claude/settings.json claude/CLAUDE.md claude/RTK.md ~/.claude/
./claude/plugins.sh   # marketplaces + plugins
./claude/skills.sh    # standalone skills
```

**settings.json** sets the `rtk` Bash hook (token savings), the caveman statusline, high effort, fullscreen TUI, and notifications.

#### Plugins

| Plugin | Marketplace | What for |
|---|---|---|
| code-review, security-guidance | claude-plugins-official | PR review, security warnings |
| context7 | claude-plugins-official | Up-to-date library docs |
| frontend-design | claude-plugins-official | UI design guidance |
| playwright | claude-plugins-official | Browser automation |
| ralph-loop | claude-plugins-official | Long-running iterative loops |
| stripe | claude-plugins-official | Stripe integration |
| typescript-lsp, gopls-lsp, swift-lsp | claude-plugins-official | Code intelligence |
| paddle | anthropics/claude-plugins-community | Paddle billing |
| caveman | JuliusBrussee/caveman | Terse output, statusline |
| andrej-karpathy-skills | forrestchang/andrej-karpathy-skills | Coding guidelines |
| impeccable | pbakaus/impeccable | Frontend design and polish |
| tui-design | gfargo/tui-design-skill | Terminal UI design |
| agent-gateway-skills | choosemission/agent-gateway-skills | Affinidi agent gateway |

#### Skills

| Skill | Source |
|---|---|
| ui-ux-pro-max | nextlevelbuilder/ui-ux-pro-max-skill |
| hallmark | Nutlope/hallmark |
| copywriting, seo-audit, content-strategy | coreyhaines31/marketingskills |
| ascelerate, app-store-screenshots | keremerkan/ascelerate |
| cloudflare, wrangler, workers-best-practices, agents-sdk, durable-objects, cloudflare-email-service, turnstile-spin, web-perf, sandbox-stable | cloudflare/skills |
| find-skills | vercel-labs/skills |
| affinidi-agent-surfaces | choosemission/agent-gateway-skills |
| graphify | `graphify install --platform claude` (uv tool `graphifyy`) |
| frankenstein | private, copy manually |

## Step 9: App configs

- **Rectangle Pro:** `Settings` > `Import` > `RectangleProConfig.json`
- **BetterTouchTool:** `Presets` > `Import` > `mhrsntrk.bttpreset`
