#!/bin/zsh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# envars & aliase & abbr
[ -f "$HOME/.scripts/shell/generate-envvars" ] &&
	"$HOME/.scripts/shell/generate-envvars"  "posix" | source /dev/stdin

[ -f "$XDG_SCRIPTS_HOME/shell/generate-alias" ] &&
	"$XDG_SCRIPTS_HOME/shell/generate-alias" 'posix' | source /dev/stdin

[ -f "$XDG_SCRIPTS_HOME/shell/generate-abbr" ] &&
	"$XDG_SCRIPTS_HOME/shell/generate-abbr" 'zsh' > "$XDG_DATA_HOME/zsh/abbr"

# Functions
[ -f "$ZDOTDIR/zsh-functions.zsh" ] &&
	source "$ZDOTDIR/zsh-functions.zsh"

# plugins
# todo: man parsing
zsh_add_plugin 'jeffreytse/zsh-vi-mode'
zvm_after_init_commands+=('
zsh_add_plugin "zsh-users/zsh-autosuggestions" &&
zsh_add_plugin "unixorn/fzf-zsh-plugin" &&
zsh_add_plugin "skywind3000/z.lua" &&
zsh_add_plugin "Xohoox/sudo.zsh" &&
zsh_add_plugin "zsh-users/zsh-syntax-highlighting" &&
zsh_add_plugin "Xohoox/zsh-abbr-minimal" &&
zsh_add_file   "keybindings.zsh" &&
source_file /usr/share/doc/fzf/examples/key-bindings.zsh
')
# zsh_add_plugin "bobthecow/git-flow-completion"

# Load files
zsh_add_file 'options.zsh'
zsh_add_file 'prompt.zsh'
zsh_add_file 'completion.zsh'
zsh_add_file 'vimMode.zsh'
source_file "$XDG_SCRIPTS_HOME/functions/posix/fuzzy.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
