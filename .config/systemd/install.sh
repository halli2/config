#!/usr/bin/env bash

systemctl daemon-reload --user

systemctl enable --user flatpak-update.timer
systemctl start --user flatpak-update.timer
