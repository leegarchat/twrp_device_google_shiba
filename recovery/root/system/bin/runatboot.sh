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
        ["ro.build.display.id"]="shiba-userdebug 99.87.36 AP3A.241005.015 eng.trijal.20240907.130349 test-keys"
        ["ro.build.flavor"]="shiba-userdebug"
        ["ro.build.product"]="shiba"
        ["ro.build.description"]="shiba-user 14 AP2A.240805.005 12025142 release-keys"
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
        ["ro.build.display.id"]="husky-eng 99.87.36 AP3A.241005.015 eng.trijal.20240907.130349 test-keys"
        ["ro.build.flavor"]="husky-eng"
        ["ro.build.product"]="husky"
        ["ro.build.description"]="husky-user 14 AP2A.240805.005 12025142 release-keys"
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

update_keys_in_file() {
    declare -n key_value_pairs="$1"
    for key in "${!key_value_pairs[@]}"; do
		resetprop "$key" "${key_value_pairs[$key]}"
    done
}

fix_bootcontrol_and_SPL_downgrade_wipe(){
    setprop servicemanager.ready true
    resetprop servicemanager.ready true
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
    modules_touch="goodixfp heatmap goog_touch_interface sec_touch ftm5 goodix_brl_touch"

    mkdir -vp \
        /dev/modules_inject/vendor_dlkm_a \
        /dev/modules_inject/vendor_dlkm_b

    if mount -r /dev/block/mapper/vendor_dlkm$suffix /dev/modules_inject/vendor_dlkm$suffix ; then 
        for module in $modules_touch ; do
            files_finded=$(find /dev/modules_inject/vendor_dlkm$suffix /modules_touch | grep "${module}.ko" )
            for f in $files_finded; do
                insmod $f;
                if [ $? -eq 0 ]; then
                    echo "I:modules_fix1: $module unloaded successfully!" >> $LOGF;
                else
                    echo "E:modules_fix1: Cannot unload $module!" >> $LOGF;
                fi
            done
        done
    else
        if lptools_new --slot $unslot --suffix $unsuffix --map vendor_dlkm$unsuffix ; then
            if mount -r /dev/block/mapper/vendor_dlkm$unsuffix /dev/modules_inject/vendor_dlkm$unsuffix ; then
                for module in $modules_touch ; do
                    files_finded=$(find /dev/modules_inject/vendor_dlkm$unsuffix /modules_touch | grep "${module}.ko" )
                    for f in $files_finded; do
                        insmod $f;
                        if [ $? -eq 0 ]; then
                            echo "I:modules_fix1: $module unloaded successfully!" >> $LOGF;
                        else
                            echo "E:modules_fix1: Cannot unload $module!" >> $LOGF;
                        fi
                    done
                done
            else
                echo "E:modules_fix1: Cannot mount /dev/block/mapper/vendor_dlkm$unsuffix!" >> $LOGF;
            fi
        else
            echo "E:modules_fix1: Cannot map /dev/block/mapper/vendor_dlkm$unsuffix!" >> $LOGF;
        fi
    fi
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
modules_touch_install
fix_kerror7
update_keys_in_file general_value_props;
update_keys_in_file ${device_code}_value_prop;
magisk_link_to_OF_FILES
unzip_magiskboot_binary
exit 0;

