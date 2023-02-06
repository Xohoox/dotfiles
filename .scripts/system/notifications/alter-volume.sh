#!/bin/sh

sink=$(pacmd list-sinks  | grep -e '* index:' | cut -d' ' -f5)
[ $1 = "toggle" ] && pactl set-sink-mute $sink toggle || pactl set-sink-volume $sink $1

volume="$($XDG_SCRIPTS_HOME/bar/modules/volume)"

VOL=$(amixer get Master | grep -E -o '[0-9]{0,3}%' | grep -E -o '[0-9]{0,3}' | sort -u)
mute=$(amixer get Master | grep -E -o '(\[off\])' | sort -u)
for i in `seq 0 10 90`; do
		if [ $(( $i + 5 )) -eq $VOL ]
		then
				[ $mute ] && bar="$bar󰰱" || bar="$bar󱎖"
		elif [ $i -lt $VOL ]
		then
				[ $mute ] && bar="$bar󰰱" || bar="$bar󰄯"
		elif [ $i -ge $VOL ]
		then
				[ "$mute" ] && bar="$bar󰰲" || bar="$bar󰄰"
		fi
done

pkill -SIGTRAP bar.bar
notify-send "$volume
$bar" -h string:x-canonical-private-synchronous:volume
