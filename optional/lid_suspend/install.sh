#!/bin/bash

set -o errexit
set -o nounset

cd "$(dirname "${BASH_SOURCE[0]}")"
DIR=$(pwd)

[ ! -d "$HOME/.local/mike_lid" ] && mkdir -p "$HOME/.local/mike_lid"
cp -i ./suspend-on-lid-close.conf "$HOME/.local/mike_lid/"
sudo cp -i ./lm_lid /etc/acpi/events/lm_lid
sudo cp -i ./mike_lid.sh /etc/acpi/mike_lid.sh
sudo chmod +x /etc/acpi/mike_lid.sh

sudo /etc/init.d/acpid restart

