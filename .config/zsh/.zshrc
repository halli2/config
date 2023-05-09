_command_exists() {
  command -v "$1" >/dev/null 2>&1
}
if [[ -d "$HOME/.cargo" ]]; then
  . "$HOME/.cargo/env"
fi
# Completion
# Update rust comps
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' # Case insensitive, UNLESS usage of upper case
zstyle ':completion:*' menu select
zstyle ':completion:*kill:*' command 'procs'
fpath+="$ZDOTDIR/zsh-completions/src"
fpath+="$ZDOTDIR/completions"
autoload -U compinit; compinit

source "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

if _command_exists sk; then
    for module in "$ZDOTDIR"/skim/*
    do
      . "${module}"
    done

    # Use the fzf tab completion plugin with skim
    source "$ZDOTDIR/fzf/fzf-tab/fzf-tab.plugin.zsh"
    zstyle ':fzf-tab:*' fzf-command sk
    zstyle ':fzf-tab:complete:*options' sk --preview "preview.sh {}"
    function sk_lazy() {
        zvm_bindkey viins '^T' skim-file-widget
    }
fi
if ! _command_exists sk; then
    function sk_lazy() {}
fi

# History database
if _command_exists atuin; then
    eval "$(atuin init zsh)"
    function zvm_after_init() {
        zvm_bindkey viins '^R' _atuin_search_widget
        zvm_bindkey viins '^[[A' _atuin_up_search_widget
        zvm_bindkey viins '^[OA' _atuin_up_search_widget
        # Needs to be sourced at the end
        source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
    }
fi
if ! _command_exists atuin; then
    function zvm_after_init() {
        # Needs to be sourced at the end
        source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
    }
fi


# Binds
source "$ZDOTDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
function my_zvm_after_lazy_keybindings() {
    zvm_bindkey vicmd 'gh' beginning-of-line
    zvm_bindkey vicmd 'gl' end-of-line
}
zvm_after_lazy_keybindings_commands+=(my_zvm_after_lazy_keybindings)
zvm_after_init_commands+=(sk_lazy)
zvm_after_init_commands+=(zvm_after_init)


# Init
if _command_exists starship; then
    eval "$(starship init zsh)"
fi
if _command_exists zoxide; then
    eval "$(zoxide init zsh)"
fi

# Dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

. "$ZDOTDIR/env.zsh"
. "$ZDOTDIR/path.zsh"
. "$ZDOTDIR/core.zsh"
. "$ZDOTDIR/hook.zsh"
. "$ZDOTDIR/alias.zsh"
# . "$ZDOTDIR/fzf.zsh"
. "$ZDOTDIR/path.zsh"


# Toolboxes
if [ -f /run/.containerenv ]; then
    source /run/.containerenv
    if [[ "$name" = "default-cli" ]]; then
        alias imv="distrobox-host-exec imv"
        alias flatpak="distrobox-host-exec flatpak"
        alias mpv="flatpak run io.mpv.Mpv"
    fi
    starship config container.format "[\$symbol \[$name\]](\$style)"
	# if [[ $name = "f38-rust" ]]; then
	# 	# export PATH=$PATH:/usr/local/
	# 	export PATH=$PATH
	# fi
fi
