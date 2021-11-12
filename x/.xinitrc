[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

feh --bg-scale dotfiles/feh/FoxWallpaper.jpg

sxhkd &
exec bspwm
