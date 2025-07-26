


device="$1"
need_repack="$2"



case $device in

    shiba|husky|akita)
        echo "- Сборка начата"
    ;;
    *)
        echo "- Утройтсво выбрано не корректно, нужно husky,shiba,akita"
        exit 222
    ;;


esac


for dev in shiba husky akita ; do
    if [[ "$dev" == "$device" ]]; then
        if [[ -f device/google/$dev/bak_vendorsetup.sh ]]; then
            mv device/google/$dev/bak_vendorsetup.sh device/google/$dev/vendorsetup.sh
        fi
    else
        if [[ -f device/google/$dev/vendorsetup.sh ]]; then
            mv device/google/$dev/vendorsetup.sh device/google/$dev/bak_vendorsetup.sh
        fi
    fi
done

. ./build/envsetup.sh;  
lunch twrp_${device}-ap2a-eng
mka adbd vendorbootimage
if [[ -n "$need_repack" ]]; then
    device/google/$device/repack_image.sh move
else
    device/google/$device/repack_image.sh
fi

for dev in shiba husky akita ; do

    if [[ -f device/google/$dev/bak_vendorsetup.sh ]]; then
        mv device/google/$dev/bak_vendorsetup.sh device/google/$dev/vendorsetup.sh
    fi

done