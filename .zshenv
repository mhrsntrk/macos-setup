# =============================================================================
# ~/.zshenv - Environment variables for all shell invocations
# =============================================================================

# PATH - Add user-specific binaries
# Add your custom paths here (e.g., LM Studio CLI, local bins)
# export PATH="$PATH:$HOME/.local/bin"

# GPG TTY for proper GPG pinentry
export GPG_TTY=$(tty)

# Prevent duplicate PATH entries
typeset -gU path
