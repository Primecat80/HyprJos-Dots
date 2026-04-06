#!/bin/bash
BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

if [ "$BATTERY_LEVEL" -le 20 ] && [ "$STATUS" = "Discharging" ]; then
    powerprofilesctl set power-saver
else
    powerprofilesctl set balanced
fi
