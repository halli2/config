for module in "${HOME}"/.config/zsh/alias/*
do
  . "${module}"
done

## File searching utilities
if command_exists lsd; then
  alias ls="lsd -a -X --group-directories-first"
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
