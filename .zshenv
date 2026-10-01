# =============================================================================
# ~/.zshenv - Environment variables for all shell invocations
# =============================================================================

# PATH - Add LM Studio CLI
export PATH="$PATH:$HOME/.lmstudio/bin"

# GPG TTY for proper GPG pinentry
export GPG_TTY=$(tty)

# Prevent duplicate PATH entries
typeset -gU path
