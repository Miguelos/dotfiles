#!/bin/bash

#Check if argument is passed
if [ $# -lt 1 ]
then
  echo "Usage ./dotfiles.sh [pull|push]"
  exit
fi

case "$1" in

'push')
  echo "## Pushing..."
  rsync -nrv --include="bash*" --exclude="*" --no-perms ~ bash/
  #git commit -am ':shell: dotfiles updated' && git push
  ;;
'pull')
  echo "## Pulling..."
  #git pull
  rsync -zvr --no-perms bash/ ~
  ;;
esac

