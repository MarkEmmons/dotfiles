[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

feh --bg-scale dotfiles/feh/forest_fox.jpg

sxhkd &
exec bspwm
