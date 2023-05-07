#!/usr/bin/env bash

systemctl daemon-reload --user

systemctl enable --user flatpak-update.timer
systemctl start --user flatpak-update.timer
systemctl enable --user cli-update.timer
systemctl start --user cli-update.timer
systemctl enable --user rustup.timer
systemctl start --user rustup.timer
