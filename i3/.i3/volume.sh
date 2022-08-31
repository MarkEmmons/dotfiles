#!/bin/bash

color0=$(xrdb -query -all | grep "*color0:" | sed "s/\*color0:\t//")
color1=$(xrdb -query -all | grep "*color1:" | sed "s/\*color1:\t//")
color2=$(xrdb -query -all | grep "*color2:" | sed "s/\*color2:\t//")
color3=$(xrdb -query -all | grep "*color3:" | sed "s/\*color3:\t//")
color4=$(xrdb -query -all | grep "*color4:" | sed "s/\*color4:\t//")
color5=$(xrdb -query -all | grep "*color5:" | sed "s/\*color5:\t//")
color6=$(xrdb -query -all | grep "*color6:" | sed "s/\*color6:\t//")
color7=$(xrdb -query -all | grep "*color7:" | sed "s/\*color7:\t//")
color8=$(xrdb -query -all | grep "*color8:" | sed "s/\*color8:\t//")
color9=$(xrdb -query -all | grep "*color9:" | sed "s/\*color9:\t//")
color10=$(xrdb -query -all | grep "*color10:" | sed "s/\*color10:\t//")
color11=$(xrdb -query -all | grep "*color11:" | sed "s/\*color11:\t//")
color12=$(xrdb -query -all | grep "*color12:" | sed "s/\*color12:\t//")
color13=$(xrdb -query -all | grep "*color13:" | sed "s/\*color13:\t//")
color14=$(xrdb -query -all | grep "*color14:" | sed "s/\*color14:\t//")
color15=$(xrdb -query -all | grep "*color15:" | sed "s/\*color15:\t//")

BAR_W=140
BAR_H=30

SCREEN_X=$(xrandr | grep \* | head -n1 | cut -d ' ' -f4 | cut -d 'x' -f1)

BAR_X=$(perl -e "print (($SCREEN_X / 2) - ($BAR_W / 2))")
BAR_Y=20

case $1 in
    +)
        echo "Raise volume"
        amixer -q sset Master 3%+
        ;;
    -)
        echo "Lower volume"
        amixer -q sset Master 3%-
        ;;
    *)
        echo "ERROR: Unknown argument $1"
        exit 1
        ;;
esac

VOL=$(amixer get Master | grep "Mono:" | cut -d ' ' -f6 | sed 's|\[||' | sed 's|%\]||')

ON=$(perl -e "print '|' x int($VOL / 5)")
OFF=$(perl -e "print '|' x (20 - int($VOL / 5))")

VOLUME="${c}  $ON%{F$color0}$OFF"

(echo "$VOLUME";sleep 6) | lemonbar -d -B $color1 -F $color7 -g ${BAR_W}x${BAR_H}+${BAR_X}+${BAR_Y}
