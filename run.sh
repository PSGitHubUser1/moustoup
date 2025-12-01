#!/bin/sh

set -e # Exit on error

mkdir --if-not-exists ~/.config/moustoup/

cp -r hctl.sh ~/.config/moustoup/
cp -r moustoup.sh ~/.config/moustoup/

cd ~/.config/moustoup/

chmod 755 hctl.sh
chmod 755 moustoup.sh

# Add keybind, (SUPER + F10) to toggle touchpad

BIND_CMD="bind = SUPER, F10, exec, bash ~/.config/moustoup/moustoup.sh"
CONFIG_FILE="$HOME/.config/hypr/hyprland.conf"

if ! grep -Fxq "$BIND_CMD" "$CONFIG_FILE"; then
    echo "$BIND_CMD" >> "$CONFIG_FILE"
    clear
    echo
    echo "*** "Keybind added!" ***"
    echo "Through SUPER (Windows Key) + F10,"
    echo "You can automatically disable/enable the touchpad,"
    echo "When a mouse is connected/disconnected."
    echo 
    echo "Restart Hyprland to apply changes."
else
    clear
    echo 
    echo  "*** Keybind already exists! ***"
    echo "Through SUPER (Windows Key) + F10,"
    echo "You can automatically disable/enable the touchpad,"
    echo "When a mouse is connected/disconnected."
    echo 
    echo "Restart Hyprland to apply changes."
fi

# Cleaning up

rm -f *.txt # removes mouse_name.txt & touchpad_name.txt
cd ..
rm -rf moustoup/

# Run the script 
# bash -e moustoup.sh
