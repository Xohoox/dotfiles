#!/bin/zsh

# zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'
zmodload zsh/complist

## Auto Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# zsh parameter completion for the dotnet CLI
# _dotnet_zsh_complete()
# {
#   local completions=("$(dotnet complete "$words")")
#   reply=( "${(ps:\n:)completions}" )
# }
# compctl -K _dotnet_zsh_complete dotnet

# [ -f "$XDG_REPOS_SYS/fzf/shell/completion.zsh" ] && source "$XDG_REPOS_SYS/fzf/shell/completion.zsh"
