#!/bin/bash

[ -e connected.txt ] && rm connected.txt
[ -e disconnected.txt ] && rm disconnected.txt

STATUS=$(expressvpn status)

if [ "$STATUS" == "Not connected." ]; then
    echo "$STATUS" >> ~/.bin/disconnected.txt
else
    echo "$STATUS" | cut -c14- >> ~/.bin/connected.txt
    cat ~/.bin/connected.txt
fi
