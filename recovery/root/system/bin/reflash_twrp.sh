#!/sbin/sh


# echo "empty for C++ code"
FD=$1

ui_print(){

    echo -e "ui_print $1\nui_print" >>"/proc/self/fd/$FD"
}
ui_print "- Starting reflash current recovery"

folder=/tmp/relfash_recovery

mkdir -p $folder/vendor_ramdisk

echo androidboot.usbcontroller=11210000.dwc3 >> $folder/bootconfig
echo androidboot.boot_devices=13200000.ufs >> $folder/bootconfig
echo androidboot.load_modules_parallel=true >> $folder/bootconfig
if ! [ -f /FFiles/check_dfe_and_reflash ] && ! [ -f /sdcard/Fox/check_dfe_and_reflash ]; then
    for f in /first_stage_ramdisk/system/etc/fstab*; do
        [ -f "$f" ] || continue
        if grep -q "/vendor/etc/init/hw" "$f"; then
            sed -i '/\/vendor\/etc\/init\/hw/d' "$f"
        fi
    done
fi

if [ -f /sdcard/Fox/check_dfe_and_reflash ] ; then
    touch /FFiles/check_dfe_and_reflash
    if ! grep -q "/FFiles/check_dfe_and_reflash" "/ramdisk-files.txt"; then
        echo /FFiles/check_dfe_and_reflash >> /ramdisk-files.txt
    fi
fi

if [ -f /FFiles/check_dfe_and_reflash ] ; then
    echo /FFiles/check_dfe_and_reflash >> /ramdisk-files.txt
else
    if grep -q "/FFiles/check_dfe_and_reflash" "/ramdisk-files.txt"; then
        sed -i '/\/FFiles\/check_dfe_and_reflash/d' "/ramdisk-files.txt"
    fi
fi
cd /

cat /ramdisk-files.txt | cpio -H newc -o > $folder/vendor_ramdisk/recovery.cpio
cat /first_stage-ramdisk-files.txt | cpio -H newc -o > $folder/vendor_ramdisk/ramdisk.cpio
cd $folder
magiskboot_29 decompress /system/bin/nboot.lz4 ./empty.img
magiskboot_29 repack ./empty.img
cat new-boot.img > /dev/block/by-name/vendor_boot_a
cat new-boot.img > /dev/block/by-name/vendor_boot_b

exit 0