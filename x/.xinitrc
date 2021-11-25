[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

picom &

feh --bg-scale $HOME/.config/feh/Bulls.jpg
xsetroot -cursor_name left_ptr

sxhkd &
exec bspwm
