#!/usr/bin/env bash

set -ouxe pipefail

# Allow google chrome to creat PWAs for user
flatpak override --system com.google.Chrome --filesystem=~/.local/share
