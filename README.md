# Vampire Knight GRUB Theme

![Preview](theme_preview.png)

## Install

### Option 1: Script

```bash
git clone https://github.com/6z7y/vampire-knight-grub-theme.git
cd vampire-knight-grub-theme/vampireknight
sudo ./install.sh        # or: doas ./install.sh
```

Then reboot.

### Option 2: Manual

1. Copy the theme folder:

   ```bash
   sudo mkdir -p /boot/grub/themes
   sudo cp -r vampireknight /boot/grub/themes/
   ```

2. Edit `/etc/default/grub` and set:

   ```
   GRUB_THEME="/boot/grub/themes/vampireknight/theme.txt"
   GRUB_GFXMODE=1920x1080
   ```

   Make sure `GRUB_TERMINAL_OUTPUT=console` is commented out (`#` at the start).

3. Regenerate the GRUB config:

   | Distro | Command |
   |---|---|
   | Ubuntu / Debian | `sudo update-grub` |
   | Arch / Void / others | `sudo grub-mkconfig -o /boot/grub/grub.cfg` |
   | Fedora | `sudo grub2-mkconfig -o /boot/grub2/grub.cfg` |

4. Reboot.
