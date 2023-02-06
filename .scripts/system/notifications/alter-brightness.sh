#!/bin/sh

$(light "$@")

brightness=$(light | cut -f 1 -d '.')

for i in `seq 0 20 80`; do
		if [ $i -lt $brightness ]
		then
				bar="$bar󰄯"
		elif [ $i -ge $brightness ]
		then
				bar="$bar󰄰"
		fi
done

pkill -SIGTRAP bar.bar
# notify-send "$brightness %
# $bar" -h string:x-canonical-private-synchronous:volume
notify-send $bar -h string:x-canonical-private-synchronous:volume
