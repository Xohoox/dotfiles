#!/bin/zsh

# Prompt
autoload -U colors && colors
source $XDG_REPOS_SYS/zsh-git-prompt/zshrc.sh
PROMPT='%n%f@%F{blue}%B%m%f %~%b%f $(git_super_status)󰞷 '
