#!/bin/sh

[ "$1" ] || { echo "missing argument!" && exit 128; }

yml="$XDG_CONFIG_HOME/alacritty/alacritty.yml"
opacity=$(cat $yml | grep "^  opacity" | cut -d' ' -f2)

# evaluate new opacity
[ "$1" = "+" -o "$1" = "-" ] &&
newOpacity="$(echo "scale=1;$opacity $1 1/10" | bc)" ||
{ echo "wrong argument! valid: + -" && exit 128; }

# check if opacity doesnt exceed 0-1
echo $newOpacity
[ "$newOpacity" != "1.1" -a "$newOpacity" != "-.1" ] ||
{ echo "out of boundary 0-1!" && exit 78; }

# replace opacity
sed -i "s/^  opacity: .*/  opacity: $newOpacity/" $yml
