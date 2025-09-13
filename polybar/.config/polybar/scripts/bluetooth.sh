#!/usr/bin/env bash
# ~/.config/polybar/scripts/bluetooth.sh

status=$(bluetoothctl show | grep "Powered" | awk '{print $2}')

if [ "$status" == "no" ]; then
    echo "󰂲"
    exit
fi

connected=$(bluetoothctl info | grep "Device" | awk '{print $2}')

if [ -n "$connected" ]; then
    alias=$(bluetoothctl info "$connected" | grep "Alias" | cut -d ' ' -f2-)
    echo "󰂱 $alias"
else
    echo "󰂯 on"
fi

