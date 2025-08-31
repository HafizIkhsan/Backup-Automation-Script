# Linux Backup Automation Script

This repository contains a simple **Bash script** that automates the backup process of important Linux system directories (`/etc` and `/var`).  
It creates a timestamped backup, compresses it, stores logs, and (optionally) sends a notification email.

---

## ⚙️ Features
- 📦 Backup `/etc` and `/var` directories into a `.tar.gz` file
- 🕒 Timestamped filenames for easy tracking
- 📝 Logging system for every backup run
- 📧 Email notification (requires mail service installed)
- ⏰ Cron job support for scheduling automatic backups

---

## 📂 Project Structure
```
 .
 ├── backup-script.sh # Main backup script <br>
 ├── cronjob.txt # Example cron job configuration <br>
 └── logs/ # Logs directory (auto-created after running the script)
```

## 🚀 Run the script
### 1. Clone this repository
```bash
git clone https://github.com/HafizIkhsan/Backup-Automation-Script.git
cd Backup-Automation-Script
```
### 2. Make the script executable
```bash
chmod a+x backup-script.sh
```
### 3. Run the script
```bash
./backup-script.sh
```
---
## ⏰ Automating with Cron
To run the backup automatically every midnight, add this to your crontab:
```
0 0 * * * /<yourdirectory>/Backup-Automation-Script/backup-script.sh > <yourdirectory>/Backup-Automation-Script/backup.txt 2>&1
```
This will create *backup.txt* everytime the job run

---
## 📌 NOTE

### 📧 Email Notification
This script includes email notifications using the `mail` command:

- ⚠️ If **`mailutils` is not installed**, the script will still run but show  
  `mail: command not found` at the end.
- ℹ️ If **`mailutils` is installed but not configured**, the backup will succeed,  
  but **no email will be sent**.
- ✅ To fully enable email notifications, install and configure a mail service  
  (e.g., `mailutils`, `postfix`, or an SMTP relay).

---

### 📂 Directory and Mail Settings
Make sure to set the **email address** and **backup directory** as you want in `backup-script.sh`:

```bash
EMAIL="youremail@gmail.com"
DIR="$HOME/backup/"
LOG_DIR="$DIR/logs/"
mkdir -p $DIR $LOG_DIR
LOG="$LOG_DIR/backup-$DATE.log"
```

---

## 🧑‍💻 About This Project
This script was created as part of my **Linux & DevOps learning journey**  
and is included in my **personal portfolio projects**.  

I built it to practice:
- 📂 Filesystem backup & automation
- ⏰ Cron job scheduling
- 📧 Email notification integration
- 📝 Documentation & open-source workflow

If you have feedback or suggestions, feel free to open an issue or connect with me!

---

## 👨‍🎓 Author
- Hafiz – [GitHub](https://github.com/<your-username>) | [Medium](https://medium.com/@<your-medium>)
