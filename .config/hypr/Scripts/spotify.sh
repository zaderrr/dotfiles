#!/bin/bash
# ~/.config/hypr/scripts/toggle-scratch.sh
# Usage: toggle-scratch.sh <class>

CLASS="$1"
SPECIAL="special:spotify"

# Check if the special workspace is currently visible
ACTIVE=$(hyprctl monitors -j | jq -r '.[0].specialWorkspace.name')

if [ "$ACTIVE" = "$SPECIAL" ]; then
    # Special is open — move the window back to its original workspace and hide
    ADDR=$(hyprctl clients -j | jq -r ".[] | select(.class == \"$CLASS\") | .address")
    ORIG=$(cat /tmp/scratch-orig-$CLASS 2>/dev/null || echo "1")
    hyprctl dispatch movetoworkspacesilent "$ORIG,address:$ADDR"
    hyprctl dispatch togglespecialworkspace scratch
else
    # Save the window's current workspace, move it to special, show it
    ADDR=$(hyprctl clients -j | jq -r ".[] | select(.class == \"$CLASS\") | .address")
    WS=$(hyprctl clients -j | jq -r ".[] | select(.class == \"$CLASS\") | .workspace.id")
    echo "$WS" > /tmp/scratch-orig-$CLASS
    hyprctl dispatch movetoworkspacesilent "$SPECIAL,address:$ADDR"
    hyprctl dispatch togglespecialworkspace scratch
fi
