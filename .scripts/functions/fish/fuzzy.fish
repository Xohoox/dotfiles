set fzfstyle "--border=rounded"

function vsc 
		[ "$argv[1]" != "" ] && set file (find $HOME/.scripts -type f -printf '%P\n' | fzf -0 -f "$argv[1]" | head -1) || set file (find $XDG_SCRIPTS_HOME -type f -printf '%P\n' | fzf $fzfstyle --prompt="$EDITOR ")
		#set file (find $XDG_SCRIPTS_HOME -type f | fzf $fzfstyle --prompt="$EDITOR ")
		[ "$file" != "" ] && $EDITOR "$HOME/.scripts/$file"
end

function vco
		[ "$argv[1]" != "" ] && set file (find $HOME/.config -type f -printf '%P\n' | fzf -0 -f "$argv[1]" | head -1) || set file (find $XDG_CONFIG_HOME -type f -printf '%P\n' | fzf $fzfstyle --prompt="$EDITOR ")
		[ "$file" != "" ] && $EDITOR "$HOME/.config/$file"
end

function gchf
		[ -d .git ] || return
    git checkout (git branch | fzf $fzfstyle --prompt='git checkout ' | sed 's/^\*//;s/\s*//' | xargs || exit) 
end

function c
	cd (find ./ -type d -printf '%P\n' 2>/dev/null | fzf $fzfstyle --prompt='cd ')
end

function dwmapply
		[ (pwd) != "$XDG_REPOS_HOME/suckless/dwm" ] && return
		git apply (find $XDG_DOWNLOAD_DIR/dwm-patches/ -type f | fzf $fzfstyle --prompt='git apply ' || exit)
end

function stapply
		[ (pwd) != "$XDG_REPOS_HOME/suckless/st" ] && return
		git apply (find $XDG_DOWNLOAD_DIR/st-patches/ -type f | fzf $fzfstyle --prompt='git apply ' || exit)
end
