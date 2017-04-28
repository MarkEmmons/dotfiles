#!/bin/bash

[ -e connected.txt ] && rm connected.txt
[ -e disconnected.txt ] && rm disconnected.txt

STATUS=$(expressvpn status)

if [ "$STATUS" == "Not connected." ]; then
    echo "$STATUS" >> $HOME/dotfiles/bin/disconnected.txt
else
    echo "$STATUS" | cut -c14- >> $HOME/.bin/connected.txt
    cat $HOME/dotfiles/bin/connected.txt
fi