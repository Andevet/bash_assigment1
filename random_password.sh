#!/bin/bash
# סיסמה רנדומלית חזקה
# שימוש: ./random_password.sh [אורך]   (ברירת-מחדל 12)

set -euo pipefail
len=${1:-12}
chars='A-Za-z0-9@#%+=:_'

LC_ALL=C tr -dc "$chars" </dev/urandom | head -c "$len" && echo
