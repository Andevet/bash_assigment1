#!/bin/bash
# גיבוי תיקייה ל-tar.gz עם בדיקת תלות ב-tar
# שימוש: ./backup_dir.sh <תיקייה> [יעד.tar.gz]

set -euo pipefail

# --- 0. ודא ש-tar מותקן ------------------------------------------------------
if ! command -v tar >/dev/null 2>&1; then
  echo "❗️ tar לא מותקן – מנסה להתקין (sudo) ..."
  if   command -v apt-get >/dev/null 2>&1; then sudo apt-get update && sudo apt-get install -y tar
  elif command -v yum     >/dev/null 2>&1; then sudo yum install -y tar
  else echo "אי-אפשר לזהות מנהל חבילות – עצר"; exit 1; fi
fi

# --- 1. אימות קלט ------------------------------------------------------------
[[ $# -lt 1 ]] && { echo "שימוש: $0 <תיקייה> [יעד.tar.gz]"; exit 1; }

src=$(realpath "$1")
[[ ! -d $src ]] && { echo "תיקייה $src לא קיימת"; exit 1; }

ts=$(date +'%Y-%m-%d_%H-%M-%S')
dest=${2:-"$(basename "$src")_$ts.tar.gz"}

# --- 2. יצירת גיבוי ----------------------------------------------------------
tar -czf "$dest" -C "$(dirname "$src")" "$(basename "$src")"
echo "✔ נוצר גיבוי: $dest"
