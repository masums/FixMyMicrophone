#!/bin/bash -x
#UnmuteMic

usable_source_numbers=$(pactl list short sources | grep input | sed 's/\([0-9]*\).*/\1/')

for i in $usable_source_numbers; do
	pactl suspend-source $i 0
	pactl set-source-volume $i 100%
	pactl set-source-mute $i 0
done
