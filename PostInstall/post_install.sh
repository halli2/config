# Update system packages
sudo dnf update -y

# Install common packages
sudo dnf install -y git

# Install packages
## Dev
sudo dnf copr enable -y flekz/helix-git
sudo dnf install -y helix-git rust cargo rustfmt
## Shell
sudo dnf copr enable -y atim/nushell
sudo dnf copr enable -y atim/starship
# skim is a fzf alternative
sudo dnf install -y zsh nushell zoxide starship procs lsd bat tldr ripgrep

# Configure git
git config --global init.defaultBranch main

# Clean up cache
sudo dnf clean all

# set defaults
chsh -s $(which zsh)
