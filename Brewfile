# Install everything: brew bundle install --file=~/Developer/macos-setup/Brewfile
# Check drift:        brew bundle check --verbose --file=~/Developer/macos-setup/Brewfile
# Find extras:        brew bundle cleanup --file=~/Developer/macos-setup/Brewfile

# -----------------------------------------------------------------------------
# Taps
# -----------------------------------------------------------------------------
tap "abue-ammar/tinycast"
tap "anomalyco/tap"
tap "goreleaser/tap"
tap "keremerkan/tap"
tap "mhrsntrk/ask-master"
tap "mhrsntrk/portflix"
tap "mhrsntrk/tap"
tap "mhrsntrk/venaqui"
tap "stripe/stripe-cli"
tap "vcmi/vcmi"

# -----------------------------------------------------------------------------
# CLI: shell & terminal
# -----------------------------------------------------------------------------
brew "bat"
brew "btop"
brew "eza"
brew "figlet"
brew "fx"
brew "fzf"
brew "jq"
brew "lazygit"
brew "ripgrep"
brew "rtk"          # token-saving CLI proxy for Claude Code (hooked in claude/settings.json)
brew "tmux"
brew "tree"
brew "yazi"
brew "circumflex"   # Hacker News (alias hn)

# -----------------------------------------------------------------------------
# CLI: git & security
# -----------------------------------------------------------------------------
brew "age"
brew "gh"
brew "git"
brew "git-lfs"
brew "pinentry-mac" # GPG commit signing
brew "subversion"

# -----------------------------------------------------------------------------
# Languages & toolchains
# -----------------------------------------------------------------------------
brew "go"
brew "maven"
brew "pipx"
brew "pnpm"
brew "python@3.11"
brew "rust"
brew "typescript"
brew "uv"
brew "yarn"

# -----------------------------------------------------------------------------
# LSPs & linters
# -----------------------------------------------------------------------------
brew "jdtls"
brew "shellcheck"
brew "typescript-language-server"

# -----------------------------------------------------------------------------
# Apple / mobile
# -----------------------------------------------------------------------------
brew "cocoapods"
brew "xcodegen"
brew "keremerkan/tap/ascelerate" # App Store Connect CLI

# -----------------------------------------------------------------------------
# Network & infra
# -----------------------------------------------------------------------------
brew "aria2"
brew "cloudflared"
brew "hcloud"
brew "mosh"
brew "tailscale"
brew "testssl"
brew "unbound"
brew "stripe/stripe-cli/stripe"

# -----------------------------------------------------------------------------
# Media & misc
# -----------------------------------------------------------------------------
brew "exiftool"
brew "ffmpeg"
brew "neovim"
brew "platformio"
brew "playwright-cli"
brew "ta-lib"
brew "vips"

# -----------------------------------------------------------------------------
# Own & third-party taps
# -----------------------------------------------------------------------------
brew "anomalyco/tap/opencode"
brew "mhrsntrk/ask-master/ask-master"
brew "mhrsntrk/portflix/portflix"
brew "mhrsntrk/tap/landline"
brew "mhrsntrk/venaqui/venaqui"

# -----------------------------------------------------------------------------
# Casks
# -----------------------------------------------------------------------------
# AI
cask "claude"
cask "claude-code@latest"
cask "codex"
cask "codex-app"
cask "lm-studio"

# Browsers
cask "brave-browser"
cask "helium-browser"
cask "zen"

# Dev
cask "ghostty"
cask "github"
cask "goreleaser/tap/goreleaser"
cask "mitmproxy"
cask "orbstack"
cask "postman"
cask "zed"

# Network
cask "cloudflare-warp"
cask "protonvpn"
cask "syncthing-app"  # run the app, NOT `brew services` (no TCC for iCloud folders)
cask "tailscale-app"

# Productivity & comms
cask "abue-ammar/tinycast/tinycast"
cask "blip"
cask "raycast"
cask "setapp"
cask "slack"
cask "zoom"

# Media & misc
cask "balenaetcher"
cask "spotify"
cask "vcmi/vcmi/vcmi"
cask "vlc"

# Fonts (Berkeley Mono is licensed: install manually into ~/Library/Fonts)
cask "font-inter"
cask "font-jetbrains-mono"

# -----------------------------------------------------------------------------
# Language-level global tools (brew bundle installs these too)
# -----------------------------------------------------------------------------
npm "@biomejs/biome"
npm "@expo/ngrok"
npm "@forge/cli"
npm "@google/design.md"
npm "bash-language-server"
npm "caprover"
npm "oh-my-opencode-darwin-arm64"
npm "spaceship-zsh-theme"
npm "wrangler"

uv "graphifyy"  # provides `graphify`; then run `graphify install --platform claude`
uv "weasyprint"

go "golang.org/x/tools/gopls"
go "golang.org/x/tools/cmd/deadcode"
go "honnef.co/go/tools/cmd/staticcheck"

cargo "cargo-deb"
