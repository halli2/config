for module in "${HOME}"/.config/zsh/alias/*
do
  . "${module}"
done

## File searching utilities
if command_exists exa; then
  alias ls="exa -a --group-directories-first"
fi
if command_exists z; then
  alias cd=z # zoxide
fi
alias fif="_fif" # "look in files"
alias hfif="_hfif"
alias 'cd..'="cd_up" # Function to cange dir

## Miscellaneous.
alias cheat="_cheat"
alias update="_update"

# Flatpaks
alias mpv="flatpak run io.mpv.Mpv"
