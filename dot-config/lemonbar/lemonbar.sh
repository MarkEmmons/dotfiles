#!/bin/bash

# Get colors set by pywal
color0="#0f0f0f"
color1="#48443B"
color2="#333D42"
color3="#39464A"
color4="#485355"
color5="#696A5F"
color6="#4E5D61"
color7="#a2a9aa"
color8="#717676"
color9="#48443B"
color10="#333D42"
color11="#39464A"
color12="#485355"
color13="#696A5F"
color14="#4E5D61"
color15="#a2a9aa"

# IP Address
ip_address() {

	WLAN="wlan0"
	ETH0="enp4s0"

    WIRE=$(cat /sys/class/net/$ETH0/operstate)
    WIFI=$(cat /sys/class/net/$WLAN/operstate)

    IP_ADDR=""

    if [[ $WIRE -eq "up" ]]; then
        IP_ADDR+=$(ip address show $ETH0 | grep "inet " | awk '{print $2}')
    fi

    if [[ $WIFI -eq "up" ]]; then

        if [[ $WIRE -eq "up" ]]; then
            IP_ADDR+=" "
        fi

        IP_ADDR+=$(ip address show $WLAN | grep "inet " | awk '{print $2}')
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

    #echo -n "%{F$color4}BAT: $(acpi | cut -d ' ' -f 4) "
    echo -n "%{F$color4}BAT: $(cat /sys/class/power_supply/BAT0/capacity)% "
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

    echo -n "%{F$color6}$(date +%m:%d:%y::%I:%M:%S)"
}

# Functions are called through admiral
case $1 in

    -i|--ip_address)
        ip_address
        ;;

    -u|--updates)
        get_updates
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
        admiral -c ~/.config/lemonbar/admiral.toml | lemonbar -B $color0 -F $color7 -f "-*-lucidatypewriter-*-*-*-*-26-*-*-*-*-*-*-*" -g x30 -p | sh
        ;;

esac
