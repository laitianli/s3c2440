#!/bin/sh

SDCARD_MOUNT_PATH=/root/Documents/sdcard
UDISK_MOUNT_PATH=/root/Documents/udisk

case $1 in
sdcard)
	MOUNT_PATH=$SDCARD_MOUNT_PATH
        ;;
udisk)
	MOUNT_PATH=$UDISK_MOUNT_PATH
        ;;
*)
        exit 0
        ;;
esac

case $2 in
umount)
        /bin/umount -f $MOUNT_PATH
	echo "umount $1 from $MOUNT_PATH"
       	;;
mount)
       	/bin/mkdir -p $MOUNT_PATH
        /bin/mount -o sync -o noatime -o nodiratime -t vfat /dev/$1 $MOUNT_PATH
	echo "mount $1 to $MOUNT_PATH"
       	;;
*)
        exit 0
        ;;
esac

exit 0
