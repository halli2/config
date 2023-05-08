#!/usr/bin/env bash

set -e
echo "Updating default-cli distrobox"
distrobox-upgrade default-cli
distrobox-enter default-cli -- pipx upgrade-all