echo "Testing .zshenv sourcing" > /tmp/zshenv_test.log
# User-specific directories for XDG Base Directory Specification
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$UID}"
export XDG_BIN_HOME="${XDG_BIN_HOME:-$HOME/.local/bin}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/etc/xdg}"

# PATH modifications
export PATH="$XDG_BIN_HOME:$PATH"  # Add .local/bin
export PATH="$HOME/workspace:$PATH"  # Add workspace

# pnpm
export PNPM_HOME="/home/rinshad/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Add npm global bin to PATH if it exists
if [ -d "$HOME/.npm-global/bin" ]; then
    export PATH="$HOME/.npm-global/bin:$PATH"
fi
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  
. "/home/rinshad/.deno/env"

# bun completions
[ -s "/home/rinshad/.bun/_bun" ] && source "/home/rinshad/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
