#!/bin/sh
LOGS_DIRECTORY="/home/jetty/jetty/logs"
LOG_ARCHIVE_PATH="/u10/jetty_logs/"
OLDER_THAN=2
LOG_ROTATE_LOG=/var/log/logrotate.log
FILES_TO_ARCHIVE=/tmp/files.tomove

echo -e `date` >> $LOG_ROTATE_LOG
find $LOGS_DIRECTORY/* -mtime +$OLDER_THAN > $FILES_TO_ARCHIVE | tee -a -i $LOG_ROTATE_LOG

cd $LOGS_DIRECTORY

for i in `cat $FILES_TO_ARCHIVE`; do nice -n 19 gzip -v -9 < $i > $i.gz | tee -a -i $LOG_ROTATE_LOG ; rm -vf $i | tee -a -i $LOG_ROTATE_LOG ; done
mv *.gz $LOG_ARCHIVE_PATH
