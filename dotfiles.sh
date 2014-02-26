#!/bin/bash

#Check if argument is passed
if [ $# -lt 1 ]
then
        echo "Usage ./dotfiles.sh [pull|push]"
        exit
fi

case "$1" in

'push')
  echo "pushing"
  rsync -av --exclude='[^.]*' --exclude='.Trash' --no-perms ~ bash/
  ;;
'pull')
  echo "pull"
  #git pull
  rsync -av --no-perms bash/ ~
  ;;
esac

