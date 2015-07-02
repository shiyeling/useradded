#! /bin/sh 
# /etc/init.d/ramdisk.sh
#

case "$1" in
  start)
    echo "Copying files to ramdisk"
    rsync -av /var/ramdisk/ /mnt/ramdisk/
    echo [`date +"%Y-%m-%d %H:%M"`] Ramdisk Synched from HD >> /var/log/ramdisk_sync.log
    ;;
  sync)
    echo "Synching files from ramdisk to Harddisk"
    rsync -av --delete --recursive --force /mnt/ramdisk/ /var/ramdisk/
    echo [`date +"%Y-%m-%d %H:%M"`] Ramdisk Synched to HD >> /var/log/ramdisk_sync.log
    ;;
  stop)
    echo "Synching logfiles from ramdisk to Harddisk"
    echo [`date +"%Y-%m-%d %H:%M"`] Ramdisk Synched to HD >> /var/log/ramdisk_sync.log
    rsync -av --delete --recursive --force /mnt/ramdisk/ /var/ramdisk/
    ;;
  *)
    echo "Usage: /etc/init.d/ramdisk {start|stop|sync}"
    exit 1
    ;;
esac

exit 0
