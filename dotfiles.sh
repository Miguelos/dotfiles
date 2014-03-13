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
  #TODO backup
  rsync -arv --include="/.bash*/" --include=".bash*" --exclude="*" --no-perms ~/ bash
  rsync -arv --include="/.vim/" --include=".vimrc" --exclude="*" --no-perms ~/ vim
  #git commit -am ':shell: dotfiles updated' && git push
  ;;
'pull')
  echo "## Pulling..."
  rsync -zvr --no-perms bash/ ~
  rsync -zvr --no-perms vim/ ~
  #git pull
  ;;
esac

