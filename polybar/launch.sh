#!/usr/bin/env bash

# Terminate already running bar instances (if IPC enabled)
polybar-msg cmd quit

# Launch mybar with overridden monitor
echo "---" | tee -a /tmp/mybar.log
MONITOR=eDP-1 polybar mybar 2>&1 | tee -a /tmp/mybar.log & disown

echo "Bar launched..."

