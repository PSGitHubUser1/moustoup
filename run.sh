#!/bin/sh

set -e # Exit on error

# Removing the old folder & keybinds
sed -i '/moustoup/d' ~/.config/hypr/hyprland.conf
rm -rf ~/.config/moustoup/

# Copy & Creating 
mkdir -p ~/.config/moustoup/

cp -r hctl.sh ~/.config/moustoup/
cp -r moustoup.sh ~/.config/moustoup/

cd ~/.config/moustoup/

chmod 755 hctl.sh
chmod 755 moustoup.sh

# Add keybind, (SUPER + F10) to toggle touchpad (on checking)

BIND_KEY="bind = SUPER, F10, exec, cd ~/.config/moustoup/ && chmod +x *.sh && bash moustoup.sh"
BIND_CHECK="bind = SUPER, F10"
SRC_PATH="$HOME/.config/hypr/hyprland.conf"


MESSAGE_A=$(cat <<'EOF'

*** Keybind added! ***

Through SUPER (Windows Key) + F10,
You can automatically disable/enable the touchpad,
When a mouse is connected/disconnected.

EOF
)

MESSAGE_B=$(cat <<'EOF'

*** Keybind already exists! ***

You can use SUPER (Windows Key) + F10,  
You can automatically disable/enable the touchpad,
When a mouse is connected/disconnected.

EOF
)


if ! grep -Fq "$BIND_CHECK" "$SRC_PATH" ; then
    echo "$BIND_KEY" >> "$SRC_PATH"
    clear
    echo "$MESSAGE_A"
else
    clear
    echo "$MESSAGE_B"
fi

