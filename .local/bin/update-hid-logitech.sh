#!/usr/bin/env bash
set -e
cd /home/halli/Dev/personal/new-lg4ff
distrobox-enter default-cli -- make -C /usr/src/kernels/$(uname -r) M=/home/halli/Dev/personal/new-lg4ff modules
mkdir -p ~/.local/kernel_modules && \
mv /var/home/halli/Dev/personal/new-lg4ff/hid-logitech-new.ko ~/.local/kernel_modules
