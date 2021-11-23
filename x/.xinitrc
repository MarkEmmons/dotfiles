[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

#feh --bg-scale dotfiles/feh/forest_fox.jpg
feh --bg-scale saved/Bulls.jpg
xsetroot -cursor_name left_ptr

sxhkd &
exec bspwm
