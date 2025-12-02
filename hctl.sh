#!/bin/bash

# SCRIPT NAME -> hctl.sh
# 
# 1. Grab the names (ID) of touchpad, external mouse
# 2. If-not found touchpad -> give ERROR
# 3. If-not found ext. mouse -> set the value of MOUSE variable = NONE
# Print the IDs of touchpad & mouse
# Export the IDs of both to 'mouse_name.txt' and 'touchpad_name.txt'
#


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
echo 
echo
# Write results to TXT
rm -f mouse_name.txt touchpad_name.txt
echo "$TOUCHPAD" > touchpad_name.txt
echo "$MOUSE" > mouse_name.txt

#

