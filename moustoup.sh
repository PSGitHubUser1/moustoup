#!/usr/bin/env bash

# SCRIPT NAME -> moustoup.sh
#
# 1. Will callout hctl.sh
# 2. Grab the names of mouse & touchpad
# 3. If mouse [Dis]connected, it will enable/disable touchpad 
# 4. Send notification to inform user
#



bash -e hctl.sh # Runs hctl.sh to detect devices

set -e # Exit on error
# Device names
TP_NAME="$(cat touchpad_name.txt)"
MOUSE_NAME="$(cat mouse_name.txt)"

# Check if mouse is listed in Hyprland devices
if hyprctl devices | grep -q "$MOUSE_NAME"; then
    # Mouse is plugged -> Disable Touchpad
    hyprctl keyword "device[$TP_NAME]:enabled" false #hyprctl keyword device:"$TP_NAME:enabled" false
    notify-send -u low "Touchpad Disabled" "Mouse detected."
    
# TESTING FOR ICONS IN THE NOTIFICATION

#   ICON_PATH="$HOME/.config/moustoup/icon.png"
#   notify-send -u low -i "$ICON_PATH" "Touchpad Manager" "Touchpad is now $STATUS"

else
    # No mouse -> Enable Touchpad
    hyprctl keyword "device[$TP_NAME]:enabled" true #hyprctl keyword device:"$TP_NAME:enabled" true
    notify-send -u low "Touchpad Enabled" "Mouse disconnected."
fi

#
