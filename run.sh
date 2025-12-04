#!/bin/sh

# SCRIPT NAME -> run.sh
#
# 1. THIS SCRIPT WILL RUN OTHER SCRIPTS WITH PROPER RIGHTS
# 2. WILL MAKE A KEYBIND (SUPER + F10) IF NOT EXISTS
# 3. CAN BE USED TO INSTALL/REINSTALL 
# 4. DISPLAY MESSAGE ON [NOT]COMPLETION
#

set -e # Exit on error

# Removing the old folder & keybind
sed -i '/moustoup/d' $HOME/.config/hypr/hyprland.conf
sudo rm -rf $HOME/.config/moustoup/

# Copy & Creating 
mkdir -p $HOME/.config/moustoup/

cp -r *.{sh,png} $HOME/.config/moustoup/

# cd & make .sh executable
cd $HOME/.config/moustoup/

chmod 755 hctl.sh
chmod 755 moustoup.sh

# Add keybind, (SUPER + F10) to toggle touchpad (on checking)

BIND_KEY="bind = SUPER, F10, exec, cd $HOME/.config/moustoup/ && chmod +x *.sh && bash moustoup.sh"
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

#

