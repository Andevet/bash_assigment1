# bash_assigment1
כל הקבצים ב master 
#  – מדריך הפעלה

ברוכים הבאים! מאגר זה כולל ארבעה סקריפטים שימושיים בבאש:

| סקריפט                           | תיאור קצר                             |
|----------------------------------|---------------------------------------|
| `script/backup_dir.sh`           | גיבוי תיקייה לקובץ ‎`.tar.gz`‎         |
| `script/random_password.sh`      | יצירת סיסמה רנדומלית חזקה            |
| `script/timer.sh`                | טיימר ספירה לאחור                   |
| `script/screenshot_at_time.sh`   | צילום-מסך בשעה מסוימת               |

---

## 1. שכפול (Clone) והתקנה ראשונית

```bash
# SSH (מומלץ – אחרי שהוספתם SSH-key ב-GitHub)
git clone git@github.com:YOUR_USER/bash-assignment.git

# או HTTPS (ידרוש PAT במקום סיסמה)
# git clone https://github.com/YOUR_USER/bash-assignment.git

cd bash-assignment

# ודאו שהקבצים כבר ניתנים להרצה; אם לא:
chmod +x script/*.sh


1.1 תלות חיצוניות
תלות	התקנה באובונטו / דביאן	                                 למה צריך
tar	sudo apt update && sudo apt install -y tar  	אריזה לגיבוי
scrot	sudo apt install -y scrot	                               צילום-מסך

הסקריפטים עצמם מזהים אוטומטית אם tar או scrot חסרים ומנסים להתקין,
אך מומלץ לסגור עניין מראש.
2. הפעלת הסקריפטים (עם דוגמאות)
2.1 ‎backup_dir.sh – גיבוי תיקייה
# תחביר
./script/backup_dir.sh < <נתיב_תיקייה > [שם_קובץ_יעד[.tar.gz.

# דוגמה
./script/backup_dir.sh ~/Documents
# ייצור קובץ בשם Documents_2025-06-27_20-35-12.tar.gz  בתקייה הנוכחית


2.2 ‎random_password.sh – סיסמה רנדומלית

# תחביר
 ./script/random_password.sh [אורך] 

# דוגמאות
 #ברירת-מחדל 12 תווים./script/random_password.sh 
סיסמה באורך 20#
./script/random_password.sh 20 


2.3 ‎timer.sh – טיימר ספירה לאחור
# תחביר
./script/timer.sh HH:MM:SS

# דוגמה
./script/timer.sh 00:05:00   #  ספירה לאחור ל-5 דקות

2.4 ‎screenshot_at_time.sh – צילום-מסך מתוזמן
# תחביר
./script/screenshot_at_time.sh HH:MM[:SS]

# דוגמאות
./script/screenshot_at_time.sh 23:30   יחכה לשעה 23:30 היום (או מחר אם עבר)#
./script/screenshot_at_time.sh 07:15:00  # עם שניות מוגדרות
# בסיום ייווצר קובץ: screenshot_YYYY-MM-DD_HH-MM-SS.png

