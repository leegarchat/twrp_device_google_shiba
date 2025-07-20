#
#
#
#
#


export OF_SCREEN_H=2400
# Назначение: Задаёт высоту экрана в пикселях для интерфейса рекавери. Для Pixel 8 с дисплеем 2400x1080 (Full HD+ AMOLED) это соответствует разрешению экрана.
# Необходимость: Обязательно для корректного отображения интерфейса на экране Pixel 8.
# Примечание: Значение 2400 подходит для Pixel 8, так как его дисплей имеет высоту 2400 пикселей. Убедитесь, что разрешение указано верно в BoardConfig.mk (например, TW_THEME=portrait_hdpi).

export OF_STATUS_H=130
# Назначение: Определяет высоту статусной строки (status bar) в пикселях, где отображаются индикаторы батареи, времени и т.д.
# Необходимость: Полезно для настройки интерфейса. Значение 100 — стандартное для современных устройств с высоким разрешением.
# Примечание: Если интерфейс выглядит корректно, оставьте. Можно протестировать меньшие значения (например, 80), чтобы увеличить рабочую область.

export OF_STATUS_INDENT_LEFT=80
# Назначение: Задаёт отступ слева для элементов статусной строки (например, иконок или текста).
# Необходимость: Опционально, влияет на визуальное расположение элементов. Значение 56 подходит для большинства устройств.
# Примечание: Можно протестировать меньшие или большие значения для настройки UI под ваши предпочтения.

export OF_STATUS_INDENT_RIGHT=80
# Назначение: Задаёт отступ справа для элементов статусной строки.
# Необходимость: Опционально, аналогично OF_STATUS_INDENT_LEFT.
# Примечание: Убедитесь, что отступы не обрезают элементы интерфейса. Протестируйте, если хотите оптимизировать.

export OF_HIDE_NOTCH=1
# Назначение: Скрывает вырез (notch) или отверстие камеры на экране в рекавери, чтобы интерфейс выглядел более цельным. Pixel 8 имеет отверстие для фронтальной камеры.
# Необходимость: Опционально. Зависит от эстетических предпочтений и того, мешает ли вырез интерфейсу.
# Примечание: Если вы хотите, чтобы интерфейс учитывал вырез, установите OF_HIDE_NOTCH=0 и протестируйте. На Pixel 8 вырез небольшой, так что параметр можно отключить.

export OF_ALLOW_DISABLE_NAVBAR=0
# OF_ALLOW_DISABLE_NAVBAR: Запрещает отключение навигационной панели в UI.


export OF_CLOCK_POS=1
# Назначение: Определяет положение часов в статусной строке (1 = справа, 0 = слева).
# Необходимость: Опционально, влияет только на визуальное оформление.
# Примечание: Значение 1 — стандартное для большинства сборок. Можно изменить на 0 для теста.

export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
# Назначение: Игнорирует ошибки монтирования логических разделов (logical partitions), таких как system, vendor, product в динамических разделах. Это полезно для устройств с Virtual A/B, где монтирование может быть проблематичным.
# Необходимость: Рекомендуется для Pixel 8, так как он использует динамические разделы и Virtual A/B. Помогает избежать сбоев при монтировании.
# Примечание: Оставьте, чтобы предотвратить ошибки монтирования, особенно при работе с super разделом.

export OF_USE_GREEN_LED=0
# Назначение: Отключает использование зелёного светодиода для индикации состояния (например, зарядки или активности). Pixel 8 не имеет светодиода, поэтому параметр отключён.
# Необходимость: Не нужен, так как Pixel 8 не поддерживает LED-индикаторы.
# Примечание: Можно оставить как 0 или удалить, так как это значение по умолчанию.

export OF_QUICK_BACKUP_LIST="/boot;/vendor_boot;/data;"
# Назначение: Определяет список разделов для быстрого резервного копирования в OrangeFox. Указаны /boot (загрузочный образ) и /data (пользовательские данные).
# Необходимость: Полезно для упрощения резервного копирования ключевых разделов.
# Примечание: Для Pixel 8 рекомендуется добавить /vendor_boot, так как рекавери находится в этом разделе. Например: OF_QUICK_BACKUP_LIST=/boot;/vendor_boot;/data;. Проверьте, чтобы список соответствовал вашим потребностям.

export OF_ENABLE_LPTOOLS=1
# Назначение: Включает lptools от phhusson в сборку, которые используются для управления логическими разделами (logical partitions) в динамических суперпартциях.
# Необходимость: Очень полезно для Pixel 8, так как он использует динамические разделы. Помогает в управлении разделами system, vendor, product.
# Примечание: Оставьте, так как это улучшает совместимость с динамическими разделами. Убедитесь, что lptools корректно интегрированы в сборку.

export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
# Назначение: Отключает проверку совместимости с Project Treble, что позволяет рекавери работать без строгого соответствия Treble требованиям.
# Необходимость: Полезно для Pixel 8, так как Google использует специфичную реализацию Treble, и отключение проверки упрощает сборку.
# Примечание: Оставьте, чтобы избежать ошибок, связанных с Treble. Это особенно актуально для кастомных рекавери.

export OF_DYNAMIC_FULL_SIZE=8531214336
# - This is for Virtual A/B devices only
# - Use this to specify the actual space of the "super" partition for ROM installations (instead of using update_engine's calculated allocatable space)
# - It is only useful if flashing a stock ROM fails, with an error "The maximum size of all groups for the target slot ... has exceeded allocatable space for dynamic partitions..."
# - The exact size of "super" partition (in kb) should be used
# - The size *must* be ascertained correctly (possibly, by running "fastboot getvar partition-size:super", and then converting the result from hex to decimal)
# - Do *NOT* use this var unless you are absolutely sure of what you are doing; it is your responsibility to ensure that the value supplied is correct
# - For most devices, it should not be needed at all
# -
# - 	eg, "export OF_DYNAMIC_FULL_SIZE=9126805504"
# -
# - default = none

export OF_OPTIONS_LIST_NUM=6
# - This can be used to override the default number of items on the "options" listbox (when flashing a zip) before a scrollbar is created
# - This should NOT be used on devices with a 16:9 screen
# - It is your responsibility to test the results of any value you use
# - The new number must be between 5 and 8, else the default will be used
# - Example:
# -   "export OF_OPTIONS_LIST_NUM=6"
# - default = 4

export OF_UNBIND_SDCARD_F2FS=1
# - Set to 1 to try to unbind /sdcard if it is still bind-mounted, before data format or repair
# - This is only needed if there are problems with formatting data
# - default = 0

# export OF_WIPE_METADATA_AFTER_DATAFORMAT=1
# - Set to 1 to automatically wipe /metadata after formatting the data partition
# - Use with care: use only if the device/ROM has a metadata partition - and - formatting /data doesn't automatically wipe it
# - It is up to you to verify for yourself that this is needed in the first place, and if used, that it works as expected
# - default = 0

export OF_BIND_MOUNT_SDCARD_ON_FORMAT=1
# - Set to 1 to automatically bind-mount /sdcard to /data/media/0 after formatting data, to resolve MTP issues
# - Note that such bind-mounting can break encryption; so only use this if it is absolutely necessary
# - This is a HIGHLY EXPERIMENTAL feature, which may have bugs; use with EXTREME caution, and with lots of testing, especially with lockscreen PINs/passwords
# - default = 0


# export OF_REFRESH_ENCRYPTION_PROPS_BEFORE_FORMAT=1
# Назначение: Обновляет свойства шифрования перед форматированием /data, чтобы обеспечить корректное удаление данных шифрования.
# Необходимость: Полезно для устройств с FBE, таких как Pixel 8, но закомментировано, что указывает на неуверенность в необходимости.
# Примечание: Раскомментируйте и протестируйте. Если форматирование /data проходит без ошибок, флаг можно оставить закомментированным. Если возникают проблемы с шифрованием, включите его.

export OF_USE_LZ4_COMPRESSION=1
# - set this to 1 if (for whatever reason) you want to use lz4 compression for your ramdisk;
# - * this requires you to have an up-to-date lz4 binary in your build system, and
# - * set this in your BoardConfig (it will be set automatically if you don't set it yourself):
# -     BOARD_RAMDISK_USE_LZ4=true
# - * your kernel must also have built-in lz4 compression support
# - default = 0 (meaning use standard gzip compression, which provides better compression anyway)

export OF_DEFAULT_KEYMASTER_VERSION=4.1
# - Use this to specify the default version for the keymaster services used for decryption
# - The value given to this will be used if the keymaster version cannot be determined automatically
# - If you use this, you should make sure that you are specifying the correct keymaster version provided by your device tree
# - eg, "export OF_DEFAULT_KEYMASTER_VERSION=4.0" (meaning using keymaster version 4.0 by default)
# - This var is equivalent to setting a value for the "keymaster_ver" prop in system.prop or device.mk
# - If the installed ROM uses a different keymaster version, that will be used instead and will override whatever is specified here
# - If you do not want your specified value to be overridden, then set "TW_FORCE_KEYMASTER_VER=true" in your BoardConfig.mk or device.mk
# - default = empty

export TARGET_DEVICE_ALT="husky,shiba,shusky"
# - Use this if the device has more than one code name, so that the OrangeFox zip
# - installer can support the alternative code name without just bombing out
# - eg, export TARGET_DEVICE_ALT="kate" (for kenzo/kate)
# -     export TARGET_DEVICE_ALT="willow" (for ginkgo/willow)
# -     export TARGET_DEVICE_ALT="blue, green, yellow, orange" (for multiple alt devices)
# - default = nothing

export FOX_TARGET_DEVICES="husky,shiba,shusky"
# - Use this if the device has more than one code name, but ROMs and other zip installers
# - never check for all code names, therefore always causing "E3004 error 7" problems (eg, raphael/raphaelin)
# - What this does is to cause OrangeFox to temporarily switch devices names to prevent error 7 from happening
# - Note that this is temporary work-around that lasts until the recovery is rebooted.
# - You should list all the valid code names for the device.
# - eg, export FOX_TARGET_DEVICES="raphaelin,raphael"
# -
# - NOTE: the purpose of this is quite different from TARGET_DEVICE_ALT (which only impacts on the creation of
# - the OrangeFox zip installer). This variable actually impacts on the operation of OrangeFox while flashing
# - a zip with OrangeFox. This is why it is mapped out to a separate build variable. It is deliberate done,
# - so that it can trigger all these impacts in the live recovery session. You should only deploy a
# - build using this variable after plenty of testing in all possible scenarios

export FOX_VARIANT=default
# Назначение: Указывает вариант сборки OrangeFox (например, default, beta, stable). default — стандартная сборка без специфичных модификаций.
# Необходимость: Полезно для идентификации типа сборки.
# Перенос в .mk: Рекомендуется перенести в fox_shiba.mk:makefile

export OF_MAINTAINER=LeeGarChat
# OF_MAINTAINER_AVATAR="device/google/shusky/maintainer.png"
# Назначение: Указывает имя мейнтейнера и (опционально) путь к аватару для отображения в интерфейсе OrangeFox.
# Необходимость: Опционально, влияет только на UI.
# Перенос в .mk: Рекомендуется перенести в fox_shiba.mk:makefile
# Примечание: Раскомментируйте и добавьте OF_MAINTAINER_AVATAR, если хотите отображать аватар. Иначе удалите закомментированную строку.

export FOX_VENDOR_BOOT_RECOVERY=1
# - Set to 1 to build a recovery for a vendor_boot-as-recovery (hdr4) device (normally, hdr4 devices are also Virtual A/B devices)
# - Do *NOT* make a vendor_boot-as-recovery build, unless you know what you are doing! Bootloops and bricks are *very* possible!
# - There are currently issues with vendor_boot-as-recovery, and custom recoveries are at an early stage of development
# - If this variable is enabled, the following features will automatically be removed
#    	* Changing the OrangeFox splash image/logo
#    	* "Flash Current OrangeFox"
#    	* "Reflash OrangeFox after flashing a ROM"
# - The zip installer that is created will also include the recovery ramdisk image ("vendor_ramdisk_recovery.cpio")
# - If this is enabled, the proper way to flash the built recovery is to reboot an installed working recovery to "fastbootd" mode,
# - and extract the zip, and flash the recovery ramdisk image by running the command: "fastboot flash vendor_boot:recovery vendor_ramdisk_recovery.cpio"
# - (or by by running the "flash-ramdisk" script bundled with the zip)
# - Do not flash the zip installer itself, unless you have both of your ROM's original boot.img and vendor_boot.img, *and* know how to recover the device from bootloops or bricks
# - This is because the outcome of flashing the recovery.img is *unpredictable* - it might be fine, or brick the device, or make the ROM unbootable; any of these is equally possible
# - You really SHOULD stay away from using this variable unless you are a *highly technical risk-taker*, and you can fix any problem *on your own*. You have been warned!
# - default = 0

export FOX_VIRTUAL_AB_DEVICE=1
# - Set to 1 to signify that the device is definitely a native Android 11+ Virtual A/B ("VAB") device
# - If this is set, some other relevant variables are enabled automatically (eg, "FOX_AB_DEVICE" "FOX_VANILLA_BUILD", etc)
# - default = 0

export FOX_AB_DEVICE=1
# - whether the device is an A/B device
# - set to 1 if your device is an A/B device (** make sure that it really is **)
# - default = 0

export FOX_RECOVERY_VENDOR_BOOT_PARTITION="/dev/block/platform/13200000.ufs/by-name/vendor_boot"
# - this is for vendor_boot builds only; it should normally BE LEFT WELL ALONE !!!
# - set this ONLY if your device's vendor_boot partition is in a location that is
# 	different from the default "/dev/block/by-name/vendor_boot"
# - default = "/dev/block/by-name/vendor_boot"

# export OF_USE_MAGISKBOOT=1
# - set to 1 to use magiskboot for patching the ROM's boot image

# export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
# - set to 1 to use magiskboot for all patching of boot images *and* recovery images

export FOX_PATCH_VBMETA_FLAG=1
# - Set to 1 to instruct magiskboot v24+ to always patch the vbmeta header when patching the recovery/boot image
# - It should not be necessary to use this variable under normal circumstances
# - Do *NOT* use this variable unless you are sure of what you are doing (and only if you are getting bootloops after flashing OrangeFox or Magisk or after changing the splash image)
# - This is *experimental* and should be considered as work-in-progress. You should test your builds thoroughly to make sure that everything works as expected
# - default = 0

export FOX_USE_BASH_SHELL=1
# - set this to 1 if you want bash to be the default shell, instead of "sh"
# - default = 0
# - if not set, bash will still be copied, but it will not replace "sh"

export FOX_USE_TAR_BINARY=1
# - set this to 1 if you want the gnu tar binary to be added (/sbin/gnutar)
# - this must be set in a shell script, or at the command line, before building
# - this will add about 420kb to the size of the recovery image
# - default = 0

export FOX_USE_XZ_UTILS=1
# - set this to 1 if you want the XZ Utils (lzma, xz) to be added to the build (the binary is about 260kb in size)
# - default = 0

export FOX_USE_LZ4_BINARY=1
# - set this to 1 if you want the prebuilt lz4 binary to be added (/sbin/lz4)
# - this must be set in a shell script, or at the command line, before building
# - default = 0


export FOX_USE_SED_BINARY=1
# - set this to 1 if you want the gnu sed binary to be added (/sbin/gnused)
# - this must be set in a shell script, or at the command line, before building
# - this will add about 200kb to the size of the recovery image
# - default = 0

export FOX_USE_ZSTD_BINARY=1
# - set this to 1 if you want the zstd binary to be added (/sbin/zstd)
# - this must be set in a shell script, or at the command line, before building
# - default = 0


export OF_USE_LEGACY_BATTERY_SERVICES=1
# - Set to 1 if the battery percentage in the status bar is not working properly (eg, if it shows 100% at all times)
# - default = 0


export FOX_VANILLA_BUILD=0
# - Set this to 1 to make a plain build that skips all the OrangeFox (mostly MIUI-related) patches
# - You should probably enable it for A/B devices, for non-Xiaomi devices (and for all builds for Xiaomi devices, if you are not supporting MIUI)
# - If this is enabled, a whole lot of other variables are also enabled automatically to disable various 
# OrangeFox extras, including "OF_SKIP_ORANGEFOX_PROCESS" above (see bootable/recovery/orangefox.mk for details)
# - On older A-only Xiaomi devices, if this is enabled, it is very possible (even likely) that OrangeFox will be 
# overwritten by MIUI stock recovery, so the user may well need to flash some kind of "fcrypt" zip and/or magisk
# - default = 0


export FOX_ENABLE_APP_MANAGER=1
# - set this to 1 to enable the OrangeFox App Manager (now disabled by default)
# - sometimes there are issues with the App Manager, especially with Android 11 and higher - if you don't care, then use this variable to enable it
# - default = 0


export FOX_DELETE_AROMAFM=1
# - set to 1 to delete AromaFM from the zip installer (for devices where it doesn't work)
# - default = 0


export OF_DONT_KEEP_LOG_HISTORY=0
# - Time-stamped copies of the recovery.log (in .zip format) will now be kept (in /sdcard/Fox/logs/)
# - this means that the previously saved recovery logs will not be overwritten
# - these will be in .zip format; users might need to clear them out periodically
# - enable this to turn off this feature (meaning that lastrecoverylog.log will be overwritten each time the recovery is rebooted)
# - default = 0


# export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=0
# - Set this to 1 to enable support for block-based incremental OTA on custom ROMs that have this feature
# - If enabled, flashing a custom ROM will run the same OTA_BAK/OTA_RES processes as with MIUI
# - This setting is incompatible with OF_DISABLE_MIUI_SPECIFIC_FEATURES/OF_TWRP_COMPATIBILITY_MODE/FOX_VANILLA_BUILD
# - The default position is to support block-based incremental OTA in MIUI ROMs only
# - default = 0

export FOX_INSTALLER_DISABLE_AUTOREBOOT=1
# - Set this to 1 to prevent the OrangeFox installer from rebooting to recovery automatically after installing OrangeFox
# - Do NOT use in release builds!
# - This should only be used for pre-release testing purposes, and even then, only if absolutely necessary
# - The installer already does not perform an autoreboot when appropriate (eg, vAB/AB devices) if flashing from OrangeFox, so it should not be necessary to use this setting
# - default = 0


export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
# - set either of them to 1 to enable stock TWRP-compatibility mode 
# - in this mode, MIUI OTA will be disabled
# - default = 0



# export OF_ENABLE_FS_COMPRESSION=1
# - Set this to 1 to enable f2fs filesystem compression
# - This requires support in your kernel, and the appropriate fstab flags
# - Do not use - unless you know what you are doing, and you also know that every ROM that you will use supports fscompression
# - default = 0


# export OF_SKIP_FBE_DECRYPTION=1
# - set to 1 to skip the FBE decryption routines (prevents hanging at the Fox logo or Redmi/Mi logo)
# - default = 0


export FOX_USE_DATA_RECOVERY_FOR_SETTINGS=0
# - Set this to 1 to use /data/recovery/Fox/ for storage, instead of /sdcard/Fox/
# - This has only one advantage - because /data/recovery/ is always available, settings can be saved and used even when decryption fails
# - The big disadvantage is that /data/recovery/ is erased every time you wipe the data partition - and so the settings will be lost even if don't format data
# - This feature is HIGHLY EXPERIMENTAL! - do NOT use it without prolonged and deep testing in every possible scenario!
# - default = 0


export FOX_REPLACE_TOOLBOX_GETPROP=1
# - set to 1 to replace the (stripped down) toolbox version of the "getprop" command
# - if this is defined, the toolbox "getprop" command will be replaced by a fuller version (resetprop)
# - default = 0


export FOX_BASH_TO_SYSTEM_BIN=1
# - Set this to 1 to install the prebuilt bash binary in /system/bin/, instead of the standard /sbin/ (at build time)
# - If this is used, a symlink is created in /sbin/ to the binary in /system/bin/
# - default = 0

# export FOX_USE_UPDATED_MAGISKBOOT=1
# - Set to 1 to use a newer (2024+) magiskboot binary. This may be required for very new devices.
# - This should be tested vigorously, because the updated magiskboot binaries can cause issues (eg, with changing the slash screen).
# - If using this is required on a device, but it causes issues with changing the splash screen, then you might need to
# - disable changing the splash screen with "OF_NO_SPLASH_CHANGE".
# - default = 0

export FOX_BUILD_BASH=1
# - set this to 1 to build bash from source during the build process; this will replace the standard OrangeFox bash binary
# - this might require cloning the bash sources from upstream (or updating them if the current version generates build errors)
# - use this with caution; in particular, your shell scripts should use "/system/bin/sh", instead of "/sbin/sh", in the shebang


export OF_NO_SPLASH_CHANGE=1
# export OF_NO_REFLASH_CURRENT_ORANGEFOX=0
export OF_RECOVERY_AB_FULL_REFLASH_RAMDISK=1