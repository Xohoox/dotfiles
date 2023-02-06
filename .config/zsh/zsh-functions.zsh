#!/bin/sh

# source: https://github.com/ChristianChiarulli/Machfiles/blob/new/zsh/.config/zsh/zsh-functions

# Function to source files if they exist
function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function zsh_add_plugin_file() {
    [ -f "$XDG_DATA_HOME/zsh/plugins/$1" ] && source "$XDG_DATA_HOME/zsh/plugins/$1"
}

function source_file() {
    [ -f "$1" ] && source "$1"
}

function run_file() {
    [ -f "$1" ] && "$1"
}

function zsh_add_plugin() {
    PLUGIN_NAME=${1#*/}
    if [ -d "$XDG_DATA_HOME/zsh/plugins/$PLUGIN_NAME" ]; then
        # For plugins
        zsh_add_plugin_file "$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_plugin_file "$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$XDG_DATA_HOME/zsh/plugins/$PLUGIN_NAME"
		zsh
    fi
}

# function zsh_add_completion() {
#     PLUGIN_NAME=${1#*/}
#     if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
#         # For completions
# 		completion_file_path=$(ls $ZDOTDIR/plugins/$PLUGIN_NAME/_*)
# 		fpath+="$(dirname "${completion_file_path}")"
#         zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
#     else
#         git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
# 		fpath+=$(ls $ZDOTDIR/plugins/$PLUGIN_NAME/_*)
# 		rm $ZDOTDIR/.zccompdump
#     fi
# 	completion_file="$(basename "${completion_file_path}")"
# 	if [ "$2" = true ] && compinit "${completion_file:1}"
# }
