# moustoup (Hyprland)

This script allows you to check if your external mouse is plugged/unplugged.

When mouse is plugged-in, when you press <kbd>SUPER</kbd> + <kbd>F10</kbd>, the touchpad will disable

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;OR

If mouse is unplugged, pressing same keybind will turn on touchpad.


## $ Requirements

- Hyprland
- Packages: `git`, `jq`, `grep` and `sed` (Install with apt/dnf/pacman)
- `hyprctl` is used which comes with Hyprland
- BASH preferred

## $ [Re]Installation

1. Clone this repo:
   ```
   git clone https://github.com/PSGitHubUser1/moustoup
   ```
3. Open the `moustoup/` folder in terminal
4. Run:
   ```
   chmod 755 run.sh
   bash run.sh
   ```
5. If I typed the code perfectly, then it should work

## $ Uninstallation

1. Run:
   ```
   sudo rm -rfv $HOME/.config/moustoup/
   sudo sed -i '/moustoup/d' ~/.config/hypr/hyprland.conf
   ```
2. DONE

