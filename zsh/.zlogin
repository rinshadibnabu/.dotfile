
# Add this to ~/.zlogin:
if [[ -z "$DISPLAY" ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
   startx
fi
