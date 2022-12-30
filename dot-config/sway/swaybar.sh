#!/bin/bash

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

    echo -n "$IP_ADDR"
    echo -n "  --  "

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

    echo -n "$UPDATE_MSG"
	echo -n "           "
	echo -n "           "
	echo -n "           "
	echo -n "           "
	echo -n "           "
	echo -n "           "
	echo -n "           "
	echo -n "           "
	echo -n "           "
	echo -n "           "
	echo -n "           "
	echo -n "           "
	echo -n "           "
	echo -n "         "

}

# Memory Usage
memory_usage() {

    MEM_TOTAL=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
    MEM_USAGE=$(cat /proc/meminfo | grep Active: | awk '{print $2}')

    MEM_T=$(printf %.2f $(perl -e "print ($MEM_TOTAL / 1000000.00)"))
    MEM_U=$(printf %.2f $(perl -e "print ($MEM_USAGE / 1000000.00)"))

    MEM="${MEM_U}/${MEM_T}G"

    echo -n "$MEM"
    echo -n " | "

}

# Battery Level
battery() {

    #echo -n "%{F$color4}BAT: $(acpi | cut -d ' ' -f 4) "
    echo -n "BAT: $(cat /sys/class/power_supply/BAT0/capacity)% "
    echo -n "| "

}

# Volume Level
volume() {

    echo -n "VOL: $(amixer get Master | grep "Mono:" | \
        cut -d ' ' -f 6,8 | sed 's|\[||' | sed 's|\]||') "

    echo -n "| "

}

# Date and Time
clock() {

    echo -n "$(date +%m:%d:%y::%I:%M:%S)"
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
        admiral -c ~/.config/sway/admiral.toml
        ;;

esac
