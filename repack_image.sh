




SCRIPT_PATH="$(readlink -f "$0")"
MAIN_PATH=$(dirname $SCRIPT_PATH)
FOX_PATH=$(readlink -f "$MAIN_PATH/../../..")


cd $FOX_PATH/out/target/product/shiba/
mkdir repack_boot
cd repack_boot
magiskboot unpack ../OrangeFox-R11.3-Unofficial-shiba.img
if [ -f vendor_ramdisk/recovery.cpio ] ; then
    name_ramdisk=recovery
else
    name_ramdisk=ramdisk
fi
magiskboot cpio vendor_ramdisk/$name_ramdisk.cpio \
    "add 644 /twres/pages/advanced.xml $MAIN_PATH/fox_mod_ui/advanced.xml" \
    "add 644 /twres/pages/install.xml $MAIN_PATH/fox_mod_ui/install.xml"
magiskboot repack ../OrangeFox-R11.3-Unofficial-shiba.img
cp -f new-boot.img ../OrangeFox-R11.3-Unofficial-shiba.img

DATE=$(date +"%Y-%d-%m")

if [ "$1" == "move" ] ; then
    cp new-boot.img $MAIN_PATH/releases/OrangeFox-R11.3-Unofficial-shiba-$DATE.img
fi

cd $MAIN_PATH
rm -rf $FOX_PATH/out/target/product/shiba/repack_boot