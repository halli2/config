#!/usr/bin/env zsh

# Don't clutter up home folder
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

if [[ -d "$HOME/.cargo" ]]; then
  . "$HOME/.cargo/env"
fi
