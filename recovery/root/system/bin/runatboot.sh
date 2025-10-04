#!/sbin/bash
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2024 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

declare -A tegu_value_prop=(
        ["ro.quick_start.device_id"]="tegu"
        ["ro.lineage.device"]="tegu"
        ["ro.crdroid.device"]="tegu"
        ["ro.product.system.device"]="tegu"
        ["ro.product.system.model"]="Pixel 9a"
        ["ro.product.system.name"]="tegu"
        ["ro.system.build.fingerprint"]="google/tegu/tegu:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.build.display.id"]="tegu-eng 99.87.36 AP3A.241005.015 eng.leegar.20240907.130349 test-keys"
        ["ro.build.flavor"]="tegu-eng"
        ["ro.build.product"]="tegu"
        ["ro.build.description"]="tegu-user 15 AP3A.241005.015 12366759 release-keys"
        ["ro.display.series"]="Pixel 9a"
        ["ro.product.vendor.device"]="tegu"
        ["ro.product.vendor.model"]="Pixel 9a"
        ["ro.product.vendor.name"]="tegu"
        ["ro.product.model"]="Pixel 9a"
        ["ro.vendor.build.fingerprint"]="google/tegu/tegu:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.board"]="tegu"
        ["ro.product.odm.device"]="tegu"
        ["ro.product.odm.model"]="Pixel 9a"
        ["ro.product.odm.name"]="tegu"
        ["ro.odm.build.fingerprint"]="google/tegu/tegu:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.product.device"]="tegu"
        ["ro.product.product.model"]="Pixel 9a"
        ["ro.product.product.name"]="tegu"
        ["ro.product.build.fingerprint"]="google/tegu/tegu:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.system_ext.device"]="tegu"
        ["ro.product.system_ext.model"]="Pixel 9a"
        ["ro.product.system_ext.name"]="tegu"
        ["ro.system_ext.build.fingerprint"]="google/tegu/tegu:15/AP3A.241005.015/12366759:user/release-keys"
		["ro.product.device"]="tegu"
		["ro.product.name"]="tegu"
        ["ro.soc.model"]="Tensor G4"
)


declare -A caiman_value_prop=(
        ["ro.quick_start.device_id"]="caiman"
        ["ro.lineage.device"]="caiman"
        ["ro.crdroid.device"]="caiman"
        ["ro.product.system.device"]="caiman"
        ["ro.product.system.model"]="Pixel 9 Pro"
        ["ro.product.system.name"]="caiman"
        ["ro.system.build.fingerprint"]="google/caiman/caiman:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.build.display.id"]="caiman-eng 99.87.36 AP3A.241005.015 eng.leegar.20240907.130349 test-keys"
        ["ro.build.flavor"]="caiman-eng"
        ["ro.build.product"]="caiman"
        ["ro.build.description"]="caiman-user 15 AP3A.241005.015 12366759 release-keys"
        ["ro.display.series"]="Pixel 9 Pro"
        ["ro.product.vendor.device"]="caiman"
        ["ro.product.vendor.model"]="Pixel 9 Pro"
        ["ro.product.vendor.name"]="caiman"
        ["ro.product.model"]="Pixel 9 Pro"
        ["ro.vendor.build.fingerprint"]="google/caiman/caiman:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.board"]="caiman"
        ["ro.product.odm.device"]="caiman"
        ["ro.product.odm.model"]="Pixel 9 Pro"
        ["ro.product.odm.name"]="caiman"
        ["ro.odm.build.fingerprint"]="google/caiman/caiman:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.product.device"]="caiman"
        ["ro.product.product.model"]="Pixel 9 Pro"
        ["ro.product.product.name"]="caiman"
        ["ro.product.build.fingerprint"]="google/caiman/caiman:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.system_ext.device"]="caiman"
        ["ro.product.system_ext.model"]="Pixel 9 Pro"
        ["ro.product.system_ext.name"]="caiman"
        ["ro.system_ext.build.fingerprint"]="google/caiman/caiman:15/AP3A.241005.015/12366759:user/release-keys"
		["ro.product.device"]="caiman"
		["ro.product.name"]="caiman"
        ["ro.soc.model"]="Tensor G4"
)

declare -A tokay_value_prop=(
        ["ro.quick_start.device_id"]="tokay"
        ["ro.lineage.device"]="tokay"
        ["ro.crdroid.device"]="tokay"
        ["ro.product.system.device"]="tokay"
        ["ro.product.system.model"]="Pixel 9"
        ["ro.product.system.name"]="tokay"
        ["ro.system.build.fingerprint"]="google/tokay/tokay:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.build.display.id"]="tokay-eng 99.87.36 AP3A.241005.015 eng.leegar.20240907.130349 test-keys"
        ["ro.build.flavor"]="tokay-eng"
        ["ro.build.product"]="tokay"
        ["ro.build.description"]="tokay-user 15 AP3A.241005.015 12366759 release-keys"
        ["ro.display.series"]="Pixel 9"
        ["ro.product.vendor.device"]="tokay"
        ["ro.product.vendor.model"]="Pixel 9"
        ["ro.product.vendor.name"]="tokay"
        ["ro.product.model"]="Pixel 9"
        ["ro.vendor.build.fingerprint"]="google/tokay/tokay:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.board"]="tokay"
        ["ro.product.odm.device"]="tokay"
        ["ro.product.odm.model"]="Pixel 9"
        ["ro.product.odm.name"]="tokay"
        ["ro.odm.build.fingerprint"]="google/tokay/tokay:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.product.device"]="tokay"
        ["ro.product.product.model"]="Pixel 9"
        ["ro.product.product.name"]="tokay"
        ["ro.product.build.fingerprint"]="google/tokay/tokay:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.system_ext.device"]="tokay"
        ["ro.product.system_ext.model"]="Pixel 9"
        ["ro.product.system_ext.name"]="tokay"
        ["ro.system_ext.build.fingerprint"]="google/tokay/tokay:15/AP3A.241005.015/12366759:user/release-keys"
		["ro.product.device"]="tokay"
		["ro.product.name"]="tokay"
        ["ro.soc.model"]="Tensor G4"
)


declare -A komodo_value_prop=(
        ["ro.quick_start.device_id"]="komodo"
        ["ro.lineage.device"]="komodo"
        ["ro.crdroid.device"]="komodo"
        ["ro.product.system.device"]="komodo"
        ["ro.product.system.model"]="Pixel 9 Pro XL"
        ["ro.product.system.name"]="komodo"
        ["ro.system.build.fingerprint"]="google/komodo/komodo:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.build.display.id"]="komodo-eng 99.87.36 AP3A.241005.015 eng.leegar.20240907.130349 test-keys"
        ["ro.build.flavor"]="komodo-eng"
        ["ro.build.product"]="komodo"
        ["ro.build.description"]="komodo-user 15 AP3A.241005.015 12366759 release-keys"
        ["ro.display.series"]="Pixel 9 Pro XL"
        ["ro.product.vendor.device"]="komodo"
        ["ro.product.vendor.model"]="Pixel 9 Pro XL"
        ["ro.product.vendor.name"]="komodo"
        ["ro.product.model"]="Pixel 9 Pro XL"
        ["ro.vendor.build.fingerprint"]="google/komodo/komodo:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.board"]="komodo"
        ["ro.product.odm.device"]="komodo"
        ["ro.product.odm.model"]="Pixel 9 Pro XL"
        ["ro.product.odm.name"]="komodo"
        ["ro.odm.build.fingerprint"]="google/komodo/komodo:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.product.device"]="komodo"
        ["ro.product.product.model"]="Pixel 9 Pro XL"
        ["ro.product.product.name"]="komodo"
        ["ro.product.build.fingerprint"]="google/komodo/komodo:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.system_ext.device"]="komodo"
        ["ro.product.system_ext.model"]="Pixel 9 Pro XL"
        ["ro.product.system_ext.name"]="komodo"
        ["ro.system_ext.build.fingerprint"]="google/komodo/komodo:15/AP3A.241005.015/12366759:user/release-keys"
		["ro.product.device"]="komodo"
		["ro.product.name"]="komodo"
        ["ro.soc.model"]="Tensor G4"
)


declare -A general_value_props=(
		["persist.wm.extensions.enabled"]="true"
        ["ro.com.google.ime.kb_pad_port_b"]="8"
        ["ro.support_hide_display_cutout"]="true"
        ["ro.opa.eligible_device"]="true"
        ["persist.sys.usb.config"]="mtp,adb"
        ["ro.incremental.enable"]="true"
        ["persist.vendor.enable.thermal.genl"]="true"
        ["vendor.pktrouter"]="1"
        ["ro.product.ab_ota_partitions"]="abl,bl1,bl2,bl31,boot,dtbo,gcf,gsa,gsa_bl1,init_boot,ldfw,modem,pbl,product,pvmfw,system,system_dlkm,system_ext,tzsw,vbmeta,vbmeta_vendor,vendor,vendor_boot,vendor_dlkm,vendor_kernel_boot"
        ["ro.frp.pst"]="/dev/block/by-name/frp"
        ["ro.hardware.keystore"]="trusty"
        ["ro.hardware.gatekeeper"]="trusty"
        ["ro.hardware.keystore_desede"]="true"
        ["debug.stagefright.c2inputsurface"]="-1"
        ["ro.vendor.ddk.set.afbc"]="1"
        ["ro.vendor.gpu.dataspace"]="1"
        ["dalvik.vm.isa.arm64.variant"]="cortex-a76"
        ["ro.bionic.cpu_variant"]="cortex-a76"
        ["drm.service.enabled"]="true"
        ["media.mediadrmservice.enable"]="true"
        ["ro.vendor.fingerprint.ta.name"]="g7.app"
        ["persist.vendor.ril.ecc.use.xml"]="1"
        ["persist.vendor.ril.support_nr_ds"]="1"
        ["persist.vendor.ril.use_radio_hal"]="2.1"
        ["ro.vendor.config.build_carrier"]="europen"
        ["vendor.rild.libpath"]="libsitril.so"
        ["vendor.debug.ssrdump.type"]="sscoredump"
        ["ro.soc.model"]="Tensor G3"
		["dumpstate.strict_run"]="false"
        ["persist.vendor.testing_battery_profile"]="2"
        ["masterclear.allow_retain_esim_profiles_after_fdr"]="true"
        ["ro.thermal_warmreset"]="true"
        ["ro.preventative_fsck"]="1"
        ["ro.crypto.volume.options"]=""
        ["ro.arm64.memtag.bootctl_supported"]="1"
        ["persist.arm64.memtag.app.com.android.se"]="off"
        ["persist.arm64.memtag.app.com.android.nfc"]="off"
        ["persist.arm64.memtag.system_server"]="off"
        ["ro.support_one_handed_mode"]="true"
        ["ro.quick_start.oem_id"]="00e0"
		["vendor.display.lbe.supported"]="0"
        ["debug.sf.treat_170m_as_sRGB"]="0"
        ["ro.surface_flinger.supports_background_blur"]="false"
        ["ro.surface_flinger.has_wide_color_display"]="false"
        ["ro.surface_flinger.has_HDR_display"]="false"
        ["vendor.usb.use_ffs_mtp"]="1"
        ["ro.build.selinux"]="0"
        ["ro.boot.selinux"]="permissive"
)

declare -A shiba_value_prop=(
        ["ro.quick_start.device_id"]="shiba"
        ["ro.lineage.device"]="shiba"
        ["ro.crdroid.device"]="shiba"
        ["ro.product.system.device"]="shiba"
        ["ro.product.system.model"]="Pixel 8"
        ["ro.product.system.name"]="shiba"
        ["ro.system.build.fingerprint"]="google/shiba/shiba:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.build.display.id"]="shiba-userdebug 99.87.36 AP3A.241005.015 eng.leegar.20240907.130349 test-keys"
        ["ro.build.flavor"]="shiba-userdebug"
        ["ro.build.product"]="shiba"
        ["ro.build.description"]="shiba-user 15 AP3A.241005.015 12366759 release-keys"
        ["ro.display.series"]="Pixel 8"
        ["ro.product.vendor.device"]="shiba"
        ["ro.product.vendor.model"]="Pixel 8"
        ["ro.product.vendor.name"]="shiba"
        ["ro.vendor.build.fingerprint"]="google/shiba/shiba:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.board"]="shiba"
        ["ro.product.odm.device"]="shiba"
        ["ro.product.odm.model"]="Pixel 8"
        ["ro.product.odm.name"]="shiba"
        ["ro.product.model"]="Pixel 8"
        ["ro.odm.build.fingerprint"]="google/shiba/shiba:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.product.device"]="shiba"
        ["ro.product.product.model"]="Pixel 8"
        ["ro.product.product.name"]="shiba"
        ["ro.product.build.fingerprint"]="google/shiba/shiba:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.system_ext.device"]="shiba"
        ["ro.product.system_ext.model"]="Pixel 8"
        ["ro.product.system_ext.name"]="shiba"
        ["ro.system_ext.build.fingerprint"]="google/shiba/shiba:15/AP3A.241005.015/12366759:user/release-keys"
		["ro.product.device"]="shiba"
		["ro.product.name"]="shiba"
)

declare -A husky_value_prop=(
        ["ro.quick_start.device_id"]="husky"
        ["ro.lineage.device"]="husky"
        ["ro.crdroid.device"]="husky"
        ["ro.product.system.device"]="husky"
        ["ro.product.system.model"]="Pixel 8 Pro"
        ["ro.product.system.name"]="husky"
        ["ro.system.build.fingerprint"]="google/husky/husky:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.build.display.id"]="husky-eng 99.87.36 AP3A.241005.015 eng.leegar.20240907.130349 test-keys"
        ["ro.build.flavor"]="husky-eng"
        ["ro.build.product"]="husky"
        ["ro.build.description"]="husky-user 15 AP3A.241005.015 12366759 release-keys"
        ["ro.display.series"]="Pixel 8 Pro"
        ["ro.product.vendor.device"]="husky"
        ["ro.product.vendor.model"]="Pixel 8 Pro"
        ["ro.product.vendor.name"]="husky"
        ["ro.product.model"]="Pixel 8 Pro"
        ["ro.vendor.build.fingerprint"]="google/husky/husky:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.board"]="husky"
        ["ro.product.odm.device"]="husky"
        ["ro.product.odm.model"]="Pixel 8 Pro"
        ["ro.product.odm.name"]="husky"
        ["ro.odm.build.fingerprint"]="google/husky/husky:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.product.device"]="husky"
        ["ro.product.product.model"]="Pixel 8 Pro"
        ["ro.product.product.name"]="husky"
        ["ro.product.build.fingerprint"]="google/husky/husky:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.system_ext.device"]="husky"
        ["ro.product.system_ext.model"]="Pixel 8 Pro"
        ["ro.product.system_ext.name"]="husky"
        ["ro.system_ext.build.fingerprint"]="google/husky/husky:15/AP3A.241005.015/12366759:user/release-keys"
		["ro.product.device"]="husky"
		["ro.product.name"]="husky"
)
declare -A akita_value_prop=(
        ["ro.quick_start.device_id"]="akita"
        ["ro.lineage.device"]="akita"
        ["ro.crdroid.device"]="akita"
        ["ro.product.system.device"]="akita"
        ["ro.product.system.model"]="Pixel 8a"
        ["ro.product.system.name"]="akita"
        ["ro.system.build.fingerprint"]="google/akita/akita:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.build.display.id"]="akita-eng 99.87.36 AP3A.241005.015 eng.leegar.20240907.130349 test-keys"
        ["ro.build.flavor"]="akita-eng"
        ["ro.build.product"]="akita"
        ["ro.build.description"]="akita-user 15 AP3A.241005.015 12366759 release-keys"
        ["ro.display.series"]="Pixel 8a"
        ["ro.product.vendor.device"]="akita"
        ["ro.product.vendor.model"]="Pixel 8a"
        ["ro.product.vendor.name"]="akita"
        ["ro.product.model"]="Pixel 8a"
        ["ro.vendor.build.fingerprint"]="google/akita/akita:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.board"]="akita"
        ["ro.product.odm.device"]="akita"
        ["ro.product.odm.model"]="Pixel 8a"
        ["ro.product.odm.name"]="akita"
        ["ro.odm.build.fingerprint"]="google/akita/akita:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.product.device"]="akita"
        ["ro.product.product.model"]="Pixel 8a"
        ["ro.product.product.name"]="akita"
        ["ro.product.build.fingerprint"]="google/akita/akita:15/AP3A.241005.015/12366759:user/release-keys"
        ["ro.product.system_ext.device"]="akita"
        ["ro.product.system_ext.model"]="Pixel 8a"
        ["ro.product.system_ext.name"]="akita"
        ["ro.system_ext.build.fingerprint"]="google/akita/akita:15/AP3A.241005.015/12366759:user/release-keys"
		["ro.product.device"]="akita"
		["ro.product.name"]="akita"
)

update_keys_in_file() {
    declare -n key_value_pairs="$1"
    for key in "${!key_value_pairs[@]}"; do
		resetprop "$key" "${key_value_pairs[$key]}"
    done
}

fix_bootcontrol_and_SPL_downgrade_wipe(){
    # setprop servicemanager.ready true
    # resetprop servicemanager.ready true
    resetprop ro.build.version.security_patch ""
}

slot_detect(){
    suffix=`getprop ro.boot.slot_suffix`;
    [[ -z $suffix ]] && suffix=`bootctl get-current-slot | xargs bootctl get-suffix`;
    case $suffix in
        _a) 
            unsuffix=_b
            slot=0
            unslot=1
            
            ;;
        _b) unsuffix=_a 
            slot=1
            unslot=0
            ;;
    esac
}


modules_touch_install(){
    mkdir -vp \
        /dev/modules_inject/vendor_dlkm_a \
        /dev/modules_inject/vendor_dlkm_b

    try_load_modules_from_path() {
        local path="$1"
        local loaded_any=0
        local missing_modules=()
        for module in $modules_touch; do
            files_finded=$(find "$path" 2>/dev/null | grep "${module}.ko$")
            if [ -z "$files_finded" ]; then
                missing_modules+=("$module")
                continue
            fi
            for f in $files_finded; do
                insmod "$f" 2>>$LOGF
                if [ $? -eq 0 ]; then
                    echo "I:modules: $module loaded successfully from $f" >> $LOGF
                    loaded_any=1
                else
                    echo "E:modules: Cannot load $module from $f" >> $LOGF
                    missing_modules+=("$module")
                fi
            done
        done
        echo "${missing_modules[*]}"
        return $loaded_any
    }

    check_modules_loaded() {
        local missing=()
        for module in $modules_touch; do
            if ! lsmod | grep -q "$module"; then
                missing+=("$module")
            fi
        done
        if [ ${#missing[@]} -gt 0 ]; then
            echo "E:modules: Missing modules: ${missing[*]}" >> $LOGF
            return 1
        else
            echo "I:modules: All modules loaded successfully" >> $LOGF
            return 0
        fi
    }

    # --- функция попытки монтирования и загрузки ---
    try_slot() {
        local blk="$1"
        local mnt="$2"
        local slot_name="$3"
        local slot_num="$4"

        if [ ! -b "$blk" ]; then
            echo "W:modules: $blk not found, trying to map..." >> $LOGF
            if ! lptools_new --slot "$slot_num" --suffix "$slot_name" --map vendor_dlkm"$slot_name" ; then
                echo "E:modules: Failed to map $blk" >> $LOGF
                return 1
            fi
        fi

        if mount -r "$blk" "$mnt"; then
            echo "I:modules: Mounted $blk on $mnt" >> $LOGF
            missing=$(try_load_modules_from_path "$mnt")
            umount "$mnt"
            echo "I:modules: Unmounted $mnt" >> $LOGF
            [ -z "$missing" ] && return 0  # все модули загружены
            echo "W:modules: Missing modules after $slot_name slot attempt: $missing" >> $LOGF
            return 1
        else
            echo "E:modules: Cannot mount $blk" >> $LOGF
            return 1
        fi
    }

    # --- основной алгоритм ---

    echo "I:modules: Trying current slot $suffix" >> $LOGF
    try_slot "/dev/block/mapper/vendor_dlkm$suffix" "/dev/modules_inject/vendor_dlkm$suffix" "$suffix" "$slot"
    res=$?

    if [ $res -ne 0 ]; then
        echo "I:modules: Trying opposite slot $unsuffix" >> $LOGF
        try_slot "/dev/block/mapper/vendor_dlkm$unsuffix" "/dev/modules_inject/vendor_dlkm$unsuffix" "$unsuffix" "$unslot"
        res=$?
    fi

    # Если все равно что-то не загружено — пробуем чисто /system/modules_touch
    check_modules_loaded || {
        echo "I:modules: Trying fallback /system/modules_touch" >> $LOGF
        missing=$(try_load_modules_from_path "/system/modules_touch")
        check_modules_loaded || {
            echo "E:modules: Final failure, modules still missing: $missing" >> $LOGF
            echo "I:modules: Currently loaded modules:" >> $LOGF
            lsmod >> $LOGF
        }
    }
}

fix_kerror7(){
    if ! mountpoint /metadata ; then
        mount /metadata
    fi
    if [ -d /metadata/ota ]; then
        rm -rf /metadata/ota
    fi
    umount /metadata
}

magisk_link_to_OF_FILES(){
    mkdir -p /FFiles/OF_Magisk/ /sdcard/Fox/FoxFiles
    cp -f /system/bin/Magisk-29.zip /FFiles/OF_Magisk/Magisk.zip
    cp -f /system/bin/Magisk-29.zip /FFiles/OF_Magisk/uninstall.zip
    cp -f /system/bin/Magisk-29.zip /sdcard/Fox/FoxFiles/Magisk.zip
    cp -f /system/bin/Magisk-29.zip /sdcard/Fox/FoxFiles/uninstall.zip
}

unzip_magiskboot_binary(){
    mkdir -p /tmp/magisk_unzip
    cd /tmp/magisk_unzip
    unzip /system/bin/Magisk-29.zip
    cp lib/arm64-v8a/libmagiskboot.so /system/bin/magiskboot_29
    chmod 777 /system/bin/magiskboot_29
    cd /tmp
    rm -rf magisk_unzip
}


setenforce 0
LOGF=/tmp/recovery.log;
device_code=`getprop ro.hardware`;



fix_bootcontrol_and_SPL_downgrade_wipe
slot_detect
declare -A touch_modules_devices=(
    [shiba]="goodixfp heatmap goog_touch_interface sec_touch ftm5 goodix_brl_touch"
    [husky]="goodixfp heatmap goog_touch_interface sec_touch ftm5 goodix_brl_touch"
    [akita]="goodixfp heatmap goog_touch_interface goodix_brl_touch fps_touch_handler"
    [tokay]="heatmap goog_touch_interface sec_touch syna_touch fps_touch_handler"
    [komodo]="qbt_handler heatmap goog_touch_interface sec_touch syna_touch"
    [caiman]="heatmap goog_touch_interface sec_touch syna_touch fps_touch_handler"
    [tegu]="heatmap goog_touch_interface syna_touch fps_touch_handler"
)
modules_touch="${touch_modules_devices[$device_code]}"
modules_touch_install
resetprop vendor.all.modules.ready 1
resetprop ro.vendor.build.version.sdk 36
resetprop ro.vendor.build.security_patch 2024-05-05
mount -t tracefs tracefs /sys/kernel/tracing
fix_kerror7
update_keys_in_file general_value_props;
update_keys_in_file ${device_code}_value_prop;
ln -s /system/bin/vndservicemanager /vendor/bin/vndservicemanager






# magisk_link_to_OF_FILES
# unzip_magiskboot_binary
exit 0;

