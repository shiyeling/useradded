#! /bin/sh
# /etc/init.d/ramdisk-lzop.sh
#
function ramToHdd {
echo [`date +"%Y-%m-%d %H:%M"`] Ramdisk Synched to HD >> /var/log/ramdisk_sync.log
mv -f /var/ramdisk-backup.tar.lzop /var/ramdisk-backup-old.tar.lzop
tar --lzop -cf /var/ramdisk-backup.tar.lzop /mnt/ramdisk
}

function hddToRam {
cd /
tar --lzop -xf /var/ramdisk-backup.tar.lzop
echo [`date +"%Y-%m-%d %H:%M"`] Ramdisk Synched from HD >> /var/log/ramdisk_sync.log
}

RAM_DU=0

case "$1" in
  start)
    echo "Copying files to ramdisk"
    hddToRam
    let RAM_DU=`du --max-depth=0 /mnt/ramdisk | awk '{print $1}'`
    while true; do
      sleep 60s
      let RAM_DU_NOW=`du --max-depth=0 /mnt/ramdisk | awk '{print $1}'`
     if [ "$RAM_DU_NOW" -ne "$RAM_DU" ]
     then
       let RAM_DU=$RAM_DU_NOW
        echo [`date +"%Y-%m-%d %H:%M"`] Ramdisk usage changed to $RAM_DU_NOW >> /var/log/ramdisk_sync.log
        ramToHdd
     fi
    done
    ;;
  sync)
    echo "Synching files from ramdisk to Harddisk"
    ramToHdd
    ;;
  stop)
    echo "Synching logfiles from ramdisk to Harddisk"
    ramToHdd
    ;;
  *)
    echo "Usage: /etc/init.d/ramdisk {start|stop|sync}" >> /var/log/ramdisk_sync.log
    exit 1
    ;;
esac

exit 0
