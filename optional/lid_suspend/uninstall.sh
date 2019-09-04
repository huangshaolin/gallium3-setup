#!/bin/bash

set -o errexit
set -o nounset

cd "$(dirname "${BASH_SOURCE[0]}")"
DIR=$(pwd)

[ -d "$HOME/.local/mike_lid" ] && rm -ri "$HOME/.local/mike_lid/"
sudo rm -i /etc/acpi/events/lm_lid
sudo rm -i /etc/acpi/mike_lid.sh

sudo /etc/init.d/acpid restart

