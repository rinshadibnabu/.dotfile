#!/bin/bash

# Thresholds for battery levels
LOW_BATTERY_LEVEL=20
FULL_BATTERY_LEVEL=95

# Paths to the notification sound files
LOW_BATTERY_SOUND="/path/to/your/low_battery_sound.wav"
FULL_BATTERY_SOUND="/path/to/your/full_battery_sound.wav"

# Function to check battery level and play sound if necessary
check_battery() {
    local battery_info="$1"
    local battery_level=$(echo "$battery_info" | grep -P -o '[0-9]+(?=%)')
    local charging_status=$(echo "$battery_info" | grep -o 'Charging\|Discharging')

    if [ "$charging_status" = "Charging" ]; then
        # Exit the script if the battery is charging
        exit 0
    fi

    if [ "$battery_level" -le "$LOW_BATTERY_LEVEL" ]; then
        paplay "$LOW_BATTERY_SOUND" > /tmp/battery.sh 2>&1
    elif [ "$battery_level" -ge "$FULL_BATTERY_LEVEL" ]; then
        paplay "$FULL_BATTERY_SOUND" > /tmp/battery.sh l 2>&1
    fi
}

