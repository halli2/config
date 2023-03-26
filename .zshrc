# Completion
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' # Case insensitive, UNLESS usage of upper case
zstyle ':completion:*' menu select
zstyle ':completion:*kill:*' command 'procs'
autoload -U compinit; compinit

source "$HOME/.config/zsh/fzf/key-bindings.zsh"
source "$HOME/.config/zsh/fzf/completions.zsh"
source "$HOME/.config/zsh/fzf/fzf-tab/fzf-tab.plugin.zsh"

# Init
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

for module in "${HOME}"/.config/zsh/*
do
  if [ -f "${module}" ]; then
    . "${module}"
  fi
done
