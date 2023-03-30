# Update system packages
sudo dnf update -y

# Install packages
## Dev
if [ !-d "$HOME/.cargo" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi
sudo dnf copr enable -y flekz/helix-git
## Shell
sudo dnf copr enable -y atim/nushell
sudo dnf copr enable -y atim/starship

sudo dnf copr enable peterwu/iosevka

sudo dnf install -y zsh nushell zoxide starship procs lsd bat tldr ripgrep \
  helix-git git iosevka-term-ss11-fonts

# Configure git
git config --global init.defaultBranch main

# Clean up cache
sudo dnf clean all

# set defaults
chsh -s $(which zsh)

