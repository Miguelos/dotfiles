## git aliases
if [ -x /usr/bin/git ]; then
	if [ -x  /usr/local/bin/hub ]; then
		alias git=hub
	fi
	alias gpl='git pull --verbose'
	alias gps='git push --verbose'
	alias gb='git branch -a -v'
	alias gbu='git branch --set-upstream-to' # needs the name of an upstream branch, sets up remote tracking for the local branch (really useful with `gcb` above
	alias gs='git status'
	alias ga='git add -A'
	alias gau='git add -u'
	alias gr='git ls-files --deleted -z | xargs -0 git rm'
	alias gd='git diff --color=always'
	alias gco='git commit --verbose -m'
	alias gca='git commit --all --verbose -m' # commits everything (except brand new files and removed files), even unstaged changes
	alias gaco='git commit --amend -am' # Stage modified and deleted files adding them to the last commit with a new message 
	alias gcl='git clean -n -d -x' # Trash the ignored files and directories (option -d) from git
	alias gap='git add --patch' # goes through each section of diffs and lets you add, skip, edit, split (and more) the lines changed
	alias gfh='git fetch --verbose --prune' # verbose gives you more information about what was fetched; prune removes any remote tracking branches which have been removed from the remote
	alias gmg='git merge' # use when you can fast-forward anyway or when you're actually merging 2 different branches together
	alias grb='git rebase --verbose' # use when you're pulling down changes from a remote or when pulling in changes to a local-only branch from the branch it branched off of (like from master into a feature branch)
	alias gsh='git stash' # stashes all changes so that your local repo is clean and ready for a merge or rebase
	alias gsp='git stash pop' # attempts to pop the most recent stash off the stash stack and apply it to your current local repo; if it fails (due to conflicts) it doesn't remove the stash from the stack
	alias gsd='git stash drop' # so in those cases you might need to do this after manually fixing the conflicts :)

	# gc      => git checkout master
	# gc bugs => git checkout bugs
	function gc {
	  if [ -z "$1" ]; then
	    git checkout master
	  else
	    git checkout $1
	  fi
	}
fi
