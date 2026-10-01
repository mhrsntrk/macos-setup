#!/usr/bin/env bash
# Install Claude Code plugin marketplaces + plugins (user scope).
# Idempotent: re-running skips what is already installed.
set -euo pipefail

marketplaces=(
  anthropics/claude-plugins-official
  anthropics/claude-plugins-community
  JuliusBrussee/caveman
  forrestchang/andrej-karpathy-skills
  pbakaus/impeccable
  gfargo/tui-design-skill
  choosemission/agent-gateway-skills
)

plugins=(
  # Official
  code-review@claude-plugins-official
  context7@claude-plugins-official
  frontend-design@claude-plugins-official
  playwright@claude-plugins-official
  ralph-loop@claude-plugins-official
  security-guidance@claude-plugins-official
  stripe@claude-plugins-official
  # LSPs (need the language servers from the Brewfile: typescript-language-server, gopls, Xcode for sourcekit-lsp)
  typescript-lsp@claude-plugins-official
  gopls-lsp@claude-plugins-official
  swift-lsp@claude-plugins-official
  # Community
  paddle@claude-community
  caveman@caveman
  andrej-karpathy-skills@karpathy-skills
  impeccable@impeccable
  tui-design@tui-design-marketplace
  agent-gateway-skills@agent-gateway-skills
)

for m in "${marketplaces[@]}"; do
  claude plugin marketplace add "$m" || true
done

for p in "${plugins[@]}"; do
  claude plugin install "$p" --scope user || true
done
