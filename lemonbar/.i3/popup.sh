#!/bin/sh

# how long should the popup remain?
duration=3

# define geometry
BAR_W=$(( $(echo "$@" | wc -c) * 7 ))
BAR_H=40

SCREEN_X=$(xrandr | grep \* | head -n1 | cut -d ' ' -f4 | cut -d 'x' -f1)
SCREEN_Y=$(xrandr | grep \* | head -n1 | cut -d ' ' -f4 | cut -d 'x' -f2)

BAR_X=$(($SCREEN_X-${BAR_W}))
BAR_Y=15

# colors
bar_bg='#ff333333'
bar_fg='#ffffffff'

# compute all this
baropt="-d -g ${BAR_W}x${BAR_H}+${BAR_X}+${BAR_Y} -B${bar_bg}"
echo "$baropt"

#Create the popup and make it live for 3 seconds
(echo " $@"; sleep ${duration}) | lemonbar ${baropt}
echo " $@"
