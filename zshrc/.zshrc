eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

setopt inc_append_history

alias vim="nvim"
alias ls="eza"
alias cd="z"

export PATH="$PATH:/opt/nvim/"
export PATH="$PATH:/opt/typst/"

# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#   tmux attach-session -t default || tmux new-session -s default
# fi

new_tmux () {
  session_dir=$(zoxide query --list | fzf)
  session_name=$(basename "$session_dir")

  if tmux has-session -t $session_name 2>/dev/null; then
    if [ -n "$TMUX" ]; then
      tmux switch-client -t "$session_name"
    else
      tmux attach -t "$session_name"
    fi
    notification="tmux attached to $session_name"
  else
    if [ -n "$TMUX" ]; then
      tmux new-session -d -c "$session_dir" -s "$session_name" && tmux switch-client -t "$session_name"
      notification="new tmux session INSIDE TMUX: $session_name"
    else
      tmux new-session -c "$session_dir" -s "$session_name"
      notification="new tmux session: $session_name"
    fi
  fi

  if [ -s "$session_name" ]; then
    notify-send "$notification"
  fi
}

alias tm=new_tmux
