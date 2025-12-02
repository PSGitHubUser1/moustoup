# moustoup (Hyprland)

This script allows you to check if your external mouse is plugged/unplugged.

When mouse is plugged-in, when you press <kbd>SUPER</kbd> + <kbd>F10</kbd>, the touchpad will disable

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;OR

If mouse is unplugged, pressing same keybind will turn on touchpad.


## $ Requirements

- Hyprland
- Packages: `jq`, `hyprctl`, `grep`
- BASH preferred

## $ Installation

1. Clone this repo with `git clone [url of this repo]`
2. Open the `moustoup/` folder in terminal
3. Run:
   ```
   chmod 755 run.sh
   sudo bash run.sh
   ```
4. If I typed the code perfectly, then it should work

## $ Uninstallation

1. Run:
   ```
   sudo rm -rfv $HOME/.config/moustoup/
   ```
2. Go to `~/.config/hypr/hyprland.conf` with `nano`,`vim` etc.
3. Remove the line `bind = SUPER, F10, exec, cd ~/.config/moustoup/ && chmod +x *.sh && bash moustoup.sh`
4. DO NOT COMMENT IT OUT WITH '#', remove the line completely

