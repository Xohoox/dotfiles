#!/bin/sh

fzfstyle="--border=rounded"

vsc()
{
	file=$(find $XDG_SCRIPTS_HOME -type f -printf '%P\n' | fzf $fzfstyle --prompt="$EDITOR ")
	[ "$file" != "" ] && $EDITOR "$XDG_SCRIPTS_HOME/$file"
}

vco()
{
	file=$(find "$XDG_CONFIG_HOME" -type f -printf '%P\n' | grep -vFf $XDG_CONFIG_HOME/fzf/exclude.conf  | fzf $fzfstyle --prompt="$EDITOR ")
	[ "$file" != "" ] && $EDITOR "$XDG_CONFIG_HOME/$file"
}


gchf()
{
	[ -d .git ] || return
	git checkout $(git branch | fzf $fzfstyle --prompt='git checkout ' || return)
}

sshf()
{
	host=$(cat $HOME/.ssh/hosts | fzf $fzfstyle --prompt="$ssh ")
	[ "$host" != "" ] && ssh $(echo "$host" | cut -f2 -d ' ')
}

gmf()
{
	[ -d .git ] || return
	git merge $(git branch | fzf $fzfstyle --prompt='git merge ' || return)
}

c()
{
	cd $(find -type d | fzf $fzfstyle --prompt='cd ' || return)
}

dwmapply()
{
	[ "$(pwd)" != "$XDG_REPOS_HOME/suckless/dwm" ] && return
	git apply $(find "$XDG_DOWNLOAD_DIR/dwm-patches/" -type f | fzf "$fzfstyle" --prompt='git apply ' || return)
}
