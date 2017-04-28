#!/bin/bash
INT="LVDS1"
EXT="VGA1"

if [ `xrandr | grep -c "$EXT connected 1440"` -gt 0 ]; then
	xrandr --output $EXT --off 
else
	xrandr --output $EXT --auto --right-of $INT
	sh $HOME/.fehbg
fi