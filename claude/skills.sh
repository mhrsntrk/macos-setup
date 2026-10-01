#!/usr/bin/env bash
# Install standalone Claude Code skills (not shipped as plugins).
# `npx skills` installs into ~/.agents/skills and symlinks into ~/.claude/skills.
set -euo pipefail

add() { npx -y skills add "$@" -g -a claude-code -y; }

# Design & UI
add nextlevelbuilder/ui-ux-pro-max-skill --skill ui-ux-pro-max
add Nutlope/hallmark

# Marketing
add coreyhaines31/marketingskills --skill copywriting --skill seo-audit --skill content-strategy

# App Store
add keremerkan/ascelerate --skill ascelerate --skill app-store-screenshots

# Cloudflare
add cloudflare/skills \
  --skill cloudflare --skill wrangler --skill workers-best-practices \
  --skill agents-sdk --skill durable-objects --skill cloudflare-email-service \
  --skill turnstile-spin --skill web-perf --skill sandbox-stable

# Misc
add vercel-labs/skills --skill find-skills
add choosemission/agent-gateway-skills --skill affinidi-agent-surfaces

# Private skill, not public: copy manually from a backup or the frankenstein repo
# ~/.claude/skills/frankenstein/SKILL.md  (needs the `frankenstein` binary in ~/.local/bin)
