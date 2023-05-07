sudo dnf copr enable -y flekz/helix-git
sudo dnf copr enable -y atim/starship
sudo dnf -y install helix-git zsh zoxide starship procs lsd bat tldr ripgrep \
  gcc pipx sqlite3 fd-find

pipx install "python-lsp-server[all]"
pipx install black
