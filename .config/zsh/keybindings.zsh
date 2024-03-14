#!/bin/zsh

# ls in current directory with alt+l
function myls {
    [[ "$CONTEXT" = cont ]] && return
    zle push-input
    zle -R
    zle accept-line
	echo
    l
}

zle -N myls
bindkey -- '^[l' myls

autoload -z edit-command-line
zle -N edit-command-line

bindkey '^e' edit-command-line

function mycd {
    [[ "$CONTEXT" = cont ]] && return
    zle push-input
    zle -R
    zle accept-line
    cd ..
}
zle -N mycd
bindkey -- '^[h' mycd
