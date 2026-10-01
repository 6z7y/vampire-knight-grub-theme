#!/usr/bin/env bash
# Vampire Knight GRUB theme installer (run as root: sudo or doas ./install.sh)
set -e
[ "$(id -u)" -eq 0 ] || { echo "Run as root: sudo ./install.sh"; exit 1; }

SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="/boot/grub/themes/vampireknight"
[ -d /boot/grub2 ] && DEST="/boot/grub2/themes/vampireknight"

mkdir -p "$DEST"
cp -r "$SRC"/. "$DEST"/
rm -f "$DEST/install.sh"

CFG=/etc/default/grub
sed -i '/^GRUB_THEME=/d' "$CFG"
echo "GRUB_THEME=\"$DEST/theme.txt\"" >> "$CFG"

# make sure the graphical terminal is on
sed -i 's/^GRUB_TERMINAL_OUTPUT=.*/#&/' "$CFG"

if grep -q '^GRUB_GFXMODE=' "$CFG"; then
  sed -i 's/^GRUB_GFXMODE=.*/GRUB_GFXMODE=1920x1080/' "$CFG"
else
  echo 'GRUB_GFXMODE=1920x1080' >> "$CFG"
fi

if command -v update-grub >/dev/null; then update-grub
elif command -v grub-mkconfig >/dev/null; then grub-mkconfig -o /boot/grub/grub.cfg
elif command -v grub2-mkconfig >/dev/null; then grub2-mkconfig -o /boot/grub2/grub.cfg
else echo "Please regenerate your grub config manually."; fi

echo "Done. Reboot to see the theme."
