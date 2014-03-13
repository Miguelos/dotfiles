# If not running interactively, don't do anything
case $- in
		*i*) ;;
			*) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
		debian_chroot=$(cat /etc/debian_chroot)
fi

#Custom programmes paths
PATH=$PATH:"~/programmes/programming/eclipse/"

function include_d {
		dir=$1
		if [ -d $HOME/.$dir.d -a -r $HOME/.$dir.d -a -x $HOME/.$dir.d ]; then
				for i in $HOME/.$dir.d/*.sh; do
						 . $i
				done
		fi
}

if [ -d $HOME/pear/bin ]; then
	PATH=$PATH:$HOME/pear/bin # Add pear to PATH
fi

# Bash custom prompt
include_d bash_prompt

# Bash completion
include_d bash_completion

# Alias definitions.
include_d bash_aliases

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
