[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

feh --bg-scale dotfiles/feh/Bulls.jpg
xsetroot -cursor_name left_ptr

sxhkd &
exec bspwm
