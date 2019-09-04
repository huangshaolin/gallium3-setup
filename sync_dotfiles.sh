#!/bin/bash


set -o errexit
set -o nounset


cd "$(dirname "${BASH_SOURCE[0]}")"
DIR=$(pwd)

rsync -avh ./dotfiles/ ~/

