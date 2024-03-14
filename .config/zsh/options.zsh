#!/bin/zsh

# ZSH Settings
setopt share_history
setopt inc_append_history
setopt histignorealldups
unsetopt BEEP
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt nomatch
#setopt autocd nomatch menucomplete extendedglob
setopt COMPLETE_ALIASES
