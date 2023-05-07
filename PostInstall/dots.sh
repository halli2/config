git clone --bare git@github.com:halli2/config $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config submodule update --init
config config --local status.showUntrackedFiles no