eval "$(starship init zsh)"
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

bindkey -e

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

setopt inc_append_history

alias vim="nvim"

export PATH="$PATH:/opt/nvim/"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
