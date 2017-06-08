[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xbindkeys

wal -i "$(< "${HOME}/.cache/wal/wal")"

exec i3
