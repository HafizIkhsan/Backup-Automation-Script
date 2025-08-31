#!/bin/bash
# Author: Hafiz
# Created: 31-08-2025
# Description: This script will automate backup of /etc and /var directory with timestamped filenames

# Set current date for naming files
DATE=$(date +%F)

# Define email, backup directory, and log directory
EMAIL="youremail@gmail.com"
DIR="$HOME/backup/"
LOG_DIR="$DIR/logs/"
mkdir -p $DIR $LOG_DIR
LOG="$LOG_DIR/backup-$DATE.log"

# Start backup process for /etc and /var
echo [$DATE] - Starting backup... | tee -a $LOG
echo
tar cvf $DIR/backup-$DATE.tar /etc /var

# Compress backup file with gzip
echo [$DATE] - Compress backup... | tee -a $LOG
echo
gzip $DIR/backup-$DATE.tar


# Verify that backup file was created (last 1 day) and log result
find $DIR/backup-$DATE.tar.gz -mtime -1 -type f -print >> $LOG 2>&1

# Send notification email based on backup result
if [ $? -eq 0 ]
then
	echo "[$DATE] - Backup Succeed: $DIR/backup-$DATE.tar.gz was created"
	echo "[$DATE] - Backup Finish & Succeed" | mail -s "Backup Success at $DATE" $EMAIL
else
	echo "[$DATE] - Backup failed..."
	echo "[$DATE] - Backup Finish & Failed" | mail -s "Backup failed at $DATE" $EMAIL
fi
