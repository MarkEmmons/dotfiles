[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

sxhkd &
exec bspwm
