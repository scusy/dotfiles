#bin/sh

xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keysym Caps_Lock = F10"
xmodmap -e "add Lock = Caps_Lock"
