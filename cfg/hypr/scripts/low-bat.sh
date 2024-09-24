#!/usr/bin/env sh

# set battery limit
LIMIT=1

while true; do
    # check battery level
    BATTERY_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')

    #execute if condition is met
    if [ "$BATTERY_LEVEL" -le "$LIMIT" ]; then
        playerctl pause 
        hyprlock -q &
        sleep 1
        systemctl suspend

        break
    fi

    # Wait until next check
    sleep 60
done
