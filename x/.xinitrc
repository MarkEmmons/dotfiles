[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xbindkeys

sh ~/.fehbg &

exec i3
