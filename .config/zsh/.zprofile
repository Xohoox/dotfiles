[ -f "$HOME/.scripts/shell/generate-envvars" ] && "$HOME/.scripts/shell/generate-envvars"  "posix" | source /dev/stdin

#add to path /home/fynn/.local/bin
# start X
if [[ "$(tty)" = "/dev/tty1" ]]; then
	exec startx $XINITRC
fi
