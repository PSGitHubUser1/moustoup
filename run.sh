#!/bin/bash
set -e

SRCPATH="$HOME/.config/moustoup"
CONFIG_FILE="$HOME/.config/hypr/hyprland.conf"

# Create directories (as user, no sudo)
mkdir -p "$SRCPATH"
mkdir -p "$SRCPATH/icons"

# Copy files (as user, no sudo needed - you own the folder)
cp ./{moustoup,hctl}.sh "$SRCPATH/" 2>/dev/null || echo "Warning: No .sh files found"
cp ./icons/*.png "$SRCPATH/icons/" 2>/dev/null || echo "Warning: No icons found"

# Make scripts executable
chmod 755 "$SRCPATH"/*.sh

# Add keybind
BIND_KEY="bind = SUPER, F10, exec, cd $SRCPATH && bash moustoup.sh"
BIND_CHECK="bind = SUPER, F10, exec"

MESSAGE_A=$(cat <<'EOF'

*** Keybind Added! ***

Press SUPER (Windows Key) + F10 to toggle touchpad.

EOF
)

MESSAGE_B=$(cat <<'EOF'

*** Keybind Already Exists! ***

SUPER (Windows Key) + F10 is ready to use.

EOF
)

if ! grep -Fq "$BIND_CHECK" "$CONFIG_FILE"; then
    echo "$BIND_KEY" >> "$CONFIG_FILE"
    echo "$MESSAGE_A"
else
    echo "$MESSAGE_B"
fi

#
