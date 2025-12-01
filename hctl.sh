#!/bin/bash

# htcl - Get touchpad and mouse names using hyprctl and jq

set -e # Exit on error

# Search JSON for ANY device with "touchpad" in the name
TOUCHPAD=$(hyprctl devices -j | jq -r '.mice[] | select(.name | contains("touchpad")) | .name' 2>/dev/null | head -n1)

if [[ -z "$TOUCHPAD" ]]; then
    echo "ERROR: No touchpad found!"
    exit 1
fi

# Search JSON for devices with "mouse" but EXCLUDE internal touchpad brands
MOUSE=$(hyprctl devices -j | jq -r '.mice[] | select(.name | test("mouse"; "i")) | select(.name | test("touchpad|elan|synaptics|keyboard|virtual"; "i") | not) | .name' 2>/dev/null | head -n1)

# If no mouse found, set to NONE
if [[ -z "$MOUSE" ]]; then
    MOUSE="NONE"
fi

# Print results
echo "========================="
echo "TOUCHPAD: $TOUCHPAD"
echo "MOUSE:    $MOUSE"
echo "========================="

# Write results to TXT
rm -f mouse_name.txt touchpad_name.txt
echo "$TOUCHPAD" > touchpad_name.txt
echo "$MOUSE" > mouse_name.txt

