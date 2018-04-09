[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xbindkeys

xrandr | grep "HDMI1 connected" && xrandr --output HDMI1 --auto --right-of LVDS1
wal -i "$(< "${HOME}/.cache/wal/wal")"

exec i3
