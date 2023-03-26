# Completion
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' # Case insensitive, UNLESS usage of upper case
zstyle ':completion:*' menu select
zstyle ':completion:*kill:*' command 'procs'
autoload -U compinit; compinit
## Fzf
source "$HOME/.config/zsh/fzf/key-bindings.zsh"
source "$HOME/.config/zsh/fzf/completions.zsh"
source "$HOME/.config/zsh/fzf/fzf-tab/fzf-tab.plugin.zsh"

# Binds
source "$HOME/.config/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
function my_zvm_after_lazy_keybindings() {
    zvm_bindkey vicmd 'gh' beginning-of-line
    zvm_bindkey vicmd 'gl' end-of-line
}
zvm_after_lazy_keybindings_commands+=(my_zvm_after_lazy_keybindings)


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
