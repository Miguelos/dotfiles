#!/bin/bash

echo "Loading ${HOME}/.bash_profile"

source ~/.bashrc  # get aliases

source ~/.profile # rvm profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
