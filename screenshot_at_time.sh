#!/bin/bash
# צילום מסך בשעה נתונה (HH:MM או HH:MM:SS).
# שימוש: ./screenshot_at_time.sh 23:45[:00]
# אם השעה כבר חלפה היום – ימתין עד למועד מחר באותה שעה.

set -euo pipefail

# --- 0. ווידוא שתוכנת scrot קיימת (או התקנה) -------------------------------
if ! command -v scrot >/dev/null 2>&1; then
  echo "❗️ scrot לא מותקנת – מתקין (sudo)…"
  if   command -v apt-get >/dev/null 2>&1;  then sudo apt-get update && sudo apt-get install -y scrot
  elif command -v yum     >/dev/null 2>&1;  then sudo yum install -y scrot
  else echo "לא זוהה מנהל חבילות מתאים, עצר."; exit 1; fi
fi

# --- 1. בדיקת פרמטר זמן ------------------------------------------------------
[[ $# -ne 1 || ! $1 =~ ^([0-9]{2}):([0-9]{2})(:[0-9]{2})?$ ]] && {
  echo "שימוש: $0 HH:MM[:SS]"; exit 1; }

TARGET="$1"

# --- 2. חישוב כמה לישון -------------------------------------------------------
now_epoch=$(date +%s)
target_epoch=$(date -d "today $TARGET" +%s 2>/dev/null \
            || date -d "$TARGET" +%s)         # סתימת חור למקרי קצה

if (( target_epoch <= now_epoch )); then
  target_epoch=$(date -d "tomorrow $TARGET" +%s)
fi

sleep_sec=$(( target_epoch - now_epoch ))
printf "⏳ ממתין %d שניות (≈ %d דקות)…\n" "$sleep_sec" $((sleep_sec/60))

sleep "$sleep_sec"

# --- 3. צילום מסך ------------------------------------------------------------
outfile="screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"
scrot "$outfile"

echo "📸 נוצר קובץ: $outfile"
