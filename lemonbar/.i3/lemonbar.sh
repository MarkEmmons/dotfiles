#!/bin/bash

# Get colors set by pywal
color0=$(xrdb -query -all | grep "*color0:" | sed "s/\*color0:\t//")
color1=$(xrdb -query -all | grep "*color1:" | sed "s/\*color1:\t//")
color2=$(xrdb -query -all | grep "*color2:" | sed "s/\*color2:\t//")
color3=$(xrdb -query -all | grep "*color3:" | sed "s/\*color3:\t//")
color4=$(xrdb -query -all | grep "*color4:" | sed "s/\*color4:\t//")
color5=$(xrdb -query -all | grep "*color5:" | sed "s/\*color5:\t//")
color6=$(xrdb -query -all | grep "*color6:" | sed "s/\*color6:\t//")
color7=$(xrdb -query -all | grep "*color7:" | sed "s/\*color7:\t//")
color8=$(xrdb -query -all | grep "*color8:" | sed "s/\*color8:\t//")
color9=$(xrdb -query -all | grep "*color9:" | sed "s/\*color9:\t//")
color10=$(xrdb -query -all | grep "*color10:" | sed "s/\*color10:\t//")
color11=$(xrdb -query -all | grep "*color11:" | sed "s/\*color11:\t//")
color12=$(xrdb -query -all | grep "*color12:" | sed "s/\*color12:\t//")
color13=$(xrdb -query -all | grep "*color13:" | sed "s/\*color13:\t//")
color14=$(xrdb -query -all | grep "*color14:" | sed "s/\*color14:\t//")
color15=$(xrdb -query -all | grep "*color15:" | sed "s/\*color15:\t//")


# IP Address
ip_address() {

    WIRE=$(cat /sys/class/net/enp4s0/operstate)
    WIFI=$(cat /sys/class/net/wlp3s0b1/operstate)

    IP_ADDR=""

    if [[ $WIRE -eq "up" ]]; then
        IP_ADDR+=$(/sbin/ifconfig enp4s0 | grep "inet " | awk '{print $2}')
    fi

    if [[ $WIFI -eq "up" ]]; then

        if [[ $WIRE -eq "up" ]]; then
            IP_ADDR+=" "
        fi

        IP_ADDR+=$(/sbin/ifconfig wlp3s0b1 | grep "inet " | awk '{print $2}')
    fi

    echo -n "%{F$color1}$IP_ADDR"
    echo -n "%{F$color7}  --  "

}

# Updates Available
get_updates() {

    UPDATES=$(checkupdates | wc -l)
    UPDATE_MSG=""

    if [[ $UPDATES -eq 0 ]]; then
        UPDATE_MSG+="Nothing to update"
    elif [[ $UPDATES -eq 0 ]]; then
        UPDATE_MSG+="1 new package"
    else
        UPDATE_MSG+="$UPDATES new packages"
    fi

    echo -n "%{F$color2}$UPDATE_MSG"

}

# Spotify Now Playing
now_playing() {

    echo -n "%{c}%{F$color9}%{R}| $(~/dotfiles/bin/spotify-nowplaying.sh) |%{R}"

}

# Memory Usage
memory_usage() {

    MEM_TOTAL=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
    MEM_USAGE=$(cat /proc/meminfo | grep Active: | awk '{print $2}')

    MEM_T=$(printf %.2f $(perl -e "print ($MEM_TOTAL / 1000000.00)"))
    MEM_U=$(printf %.2f $(perl -e "print ($MEM_USAGE / 1000000.00)"))

    MEM="${MEM_U}/${MEM_T}G"

    echo -n "%{r}%{F$color3}$MEM"
    echo -n "%{F$color7} | "

}

# Battery Level
battery() {

    echo -n "%{F$color4}BAT: $(acpi | cut -d ' ' -f 4) "
    echo -n "%{F$color7}| "

}

# Volume Level
volume() {

    echo -n "%{F$color5}VOL: $(amixer get Master | grep "Mono:" | \
        cut -d ' ' -f 6,8 | sed 's|\[||' | sed 's|\]||') "

    echo -n "%{F$color7}| "

}

# Date and Time
clock() {

    echo -n "%{F$color6}$(date +%m:%d:%y:%H:%M:%S)"

}

# Generate workspaces and bar for each monitor
workspaces() {

    read BAR
    while [[ true ]]; do

        i=0
        WORKSPACES=$(i3-msg -t get_workspaces | jq -r '.[] | "\(.name) \(.output)"')
        MONITORS=$(xrandr | grep " connected" | awk '{print $1}')

        # Generate unique workspaces for each monitor
        for m in $MONITORS; do

            # Specify monitor for output
            echo -n "%{S${i}}%{l}" && i=$(($i + 1))

            # Current monitor's workspaces
            CURRENT_WS=$(echo "$WORKSPACES" | grep "$m" | awk '{print $1}')

            # Generate format string for each workspace
            for w in $CURRENT_WS; do

                # Is this workspace focused or urgent?
                FOCUSED=$(i3-msg -t get_workspaces | jq ".[] | select(.name==\"$w\").focused")
            	URGENT=$(i3-msg -t get_workspaces | jq ".[] | select(.name==\"$w\").urgent")

                # Generate string for focused, urgent, or normal workspace
                if $FOCUSED ; then
            		echo -n "%{B$color4 F$color7} $w %{B$color0 F$color7}"
            	else
            		if $URGENT ; then
            			echo -n "%{B$color7 F$color0}%{A:i3-msg -q workspace number $w:} $w %{A}%{B$color0 F$color7}"
            		else
            			echo -n %{B$color0 F$color4}%{A:"i3-msg -q workspace number $w":} $w %{B$color0 F$color7}%{A}
            		fi
            	fi

            done # End for w in $CURRENT_WS

            # Finish bar for current monitor
            echo -n "%{F$color7}  -- "
            echo -n "$BAR"

        done # End for m in $MONITORS

        echo ""
        sleep 0.1
        read BAR

    done

}

# Functions are called through admiral
case $1 in

    -i|--ip_address)
        ip_address
        ;;

    -u|--updates)
        get_updates
        ;;

    -n|--now_playing)
        now_playing
        ;;

    -m|--memory)
        memory_usage
        ;;

    -b|--battery)
        battery
        ;;

    -v|--volume)
        volume
        ;;

    -c|--clock)
        clock
        ;;

    *)
        # If no args are used we initiate the bar
        admiral -c ~/.i3/admiral.toml | workspaces | lemonbar -B $color0 -F $color7 -g x15 -p | sh
        ;;

esac
