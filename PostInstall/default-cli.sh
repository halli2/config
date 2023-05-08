#!/usr/bin/env bash

sudo dnf install -y zathura zathura-pdf-mupdf

# Export apps
mkdir -p $HOME/.local/bin
distrobox-export -b $(which hx) -ep $HOME/.local/bin
distrobox-export -b $(which fd) -ep $HOME/.local/bin
distrobox-export -b $(which zathura) -ep $HOME/.local/bin

sudo dnf install -y cmake
cargo install bat du-dust fd-find ripgrep zoxide exa starship procs
