
# Minimal .zshrc (interactive only)
[[ $- != *i* ]] && return

# Basics
export EDITOR='nvim'
export LANG=en_US.UTF-8
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS

# Optional starship (quiet if not installed)
eval "$(starship init zsh 2>/dev/null || true)"

# (Optional) FZF defaults — tweak if you like
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --prompt="History> "'

# Clean Ctrl-R → fzf search (no previews / no markings)
fzf_history_widget() {
  local selected
  # fc -rl 1 : full history reversed; sed removes leading numbers
  selected=$(fc -rl 1 2>/dev/null | sed -E 's/^[[:space:]]*[0-9]+\s+//' | fzf --height 40% --reverse --border --prompt='History> ')
  if [[ -n $selected ]]; then
    BUFFER=$selected
    CURSOR=${#BUFFER}
    zle redisplay
  fi
}
zle -N fzf_history_widget
bindkey '^R' fzf_history_widget

# Small useful aliases
alias ll='ls -lhF --color=auto'
alias la='ls -lahtr --color=auto'
alias g='git'
alias c='clear'

# Load local tweaks if present
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Completion system
autoload -Uz compinit
compinit -i


# Show all processes (not just current user)
zstyle ':completion:*:*:kill:*:processes' command \
  'ps -A -o pid,cmd -w -w'

