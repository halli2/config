for module in "${HOME}"/.config/zsh/alias/*
do
  . "${module}"
done

## File searching utilities
alias ls="lsd -a -X --group-directories-first"
alias fif="_fif" # "look in files"
alias hfif="_hfif"
alias cd=z # zoxide
alias 'cd..'="cd_up" # Function to cange dir

## Miscellaneous.
alias cheat="_cheat"
alias update="_update"
