#!/bin/bash
# טיימר ספירה לאחור
# שימוש: ./timer.sh HH:MM:SS

set -euo pipefail

[[ $# -ne 1 || ! $1 =~ ^([0-9]{2}):([0-9]{2}):([0-9]{2})$ ]] \
  && { echo "שימוש: $0 HH:MM:SS"; exit 1; }

IFS=: read -r h m s <<<"$1"
sec=$((10#$h*3600 + 10#$m*60 + 10#$s))

echo "⏳ $1..."
while (( sec > 0 )); do
  printf "\rנותרו %02d:%02d:%02d " $((sec/3600)) $((sec/60%60)) $((sec%60))
  sleep 1; ((sec--))
done
printf "\r🚨 הזמן עבר!        \n"
