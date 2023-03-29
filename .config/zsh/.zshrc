# Completion
# Update rust comps
rustup completions zsh > "$ZDOTDIR/completions/_rustup"
rustup completions zsh cargo > "$ZDOTDIR/completions/_cargo"
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' # Case insensitive, UNLESS usage of upper case
zstyle ':completion:*' menu select
zstyle ':completion:*kill:*' command 'procs'
fpath+="$ZDOTDIR/zsh-completions/src"
fpath+="$ZDOTDIR/completions"
autoload -U compinit; compinit

# Misc. Plugins
source "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
## Fzf
source "$ZDOTDIR/fzf/key-bindings.zsh"
source "$ZDOTDIR/fzf/completions.zsh"
source "$ZDOTDIR/fzf/fzf-tab/fzf-tab.plugin.zsh"
source "$ZDOTDIR/fzf/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh"

# Binds
source "$ZDOTDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
function my_zvm_after_lazy_keybindings() {
    zvm_bindkey vicmd 'gh' beginning-of-line
    zvm_bindkey vicmd 'gl' end-of-line
}
function zvm_after_init() {
    zvm_bindkey viins '^R' fzf-history-widget
}
zvm_after_lazy_keybindings_commands+=(my_zvm_after_lazy_keybindings)
zvm_after_init_commands+=(zvm_after_init)


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
