#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#




DEVICE_PATH := device/google/shiba


# Флаги сборочной системы (BUILD_BROKEN_, ALLOW_)

BUILD_BROKEN_DUP_RULES := true
# этот флаг отключает ошибку «overriding commands for target», которая возникает при наличии дублирующихся правил сборки (например, в PRODUCT_COPY_FILES). 
# По сути позволяет системе сборки игнорировать повторяющиеся правила
# . Как показывают примеры, его устанавливают, чтобы обойти ошибку «overriding commands for target»

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
# разрешает использовать заранее скомпилированные ELF-библиотеки/модули в переменной PRODUCT_COPY_FILES. 
# По умолчанию сборка запрещает помещать ELF-файлы в system/lib и т.п., и требует объявлять их как модули. 
# Установка этого флага снимает запрет (временно «ослабляет проверку»), как описано в документации AOSP.

BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
# ослабляет проверку обязательных модулей. 
# Обычно модули, перечисленные в LOCAL_REQUIRED_MODULES и аналогичных переменных, должны существовать, иначе сборка выдаёт ошибку. 
# При установке этого флага сборка просто выдаёт предупреждение и продолжает («временно ослабляет проверку отсутствующих модулей»

ALLOW_MISSING_DEPENDENCIES := true
# разрешает отсутствие зависимостей. 
# Снимает требование наличия модулей, упомянутых в LOCAL_REQUIRED_MODULES и др., 
# аналогично BUILD_BROKEN_MISSING_REQUIRED_MODULES. 
# Обычно нужно, если какие-то зависимости («библиотеки») отсутствуют, но вы хотите продолжить сборку

BUILD_BROKEN_USES_NETWORK := true
# (в CORE/board_config.mk) разрешает использование сетевых функций в модулях «broken» (подсчёт времени может подсказкой). 
# Установлен для пропуска ошибок компоновки сетевых функций в ранних этапах сборки.


# Параметры архитектуры и платформы

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
# задают основную целевую архитектуру и её подвариант. Здесь ARM64 (AArch64) с дополнительной поддержкой v8.2-A.

TARGET_CPU_VARIANT := cortex-a55
TARGET_CPU_VARIANT_RUNTIME := cortex-a55
# указывают конкретную модель CPU для сборки ядра и рантайма. 
# Применяется для оптимизаций, например -mcpu=cortex-a55 при компиляции

TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
# основной ABI (application binary interface) – 64-разрядный ARMv8 (arm64-v8a).
# TARGET_CPU_ABI2 := (пусто) – второй ABI, если нужен (на 32-битных устройствах).

TARGET_2ND_CPU_ABI := armv8-2a
TARGET_2ND_ARCH := arm
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a75
# задают «второстепенную» (2nd) архитектуру. У Pixel 8 есть CPU разных ядер (например, Cortex-A75 и A55), и этот блок указывает 
# 32-битную ARM-архитектуру для 32-битных (arm32) бинарей под Cortex-A75.

TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75
TARGET_BOARD_PLATFORM_GPU := mali-g71

TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_IS_64_BIT := true
# говорят системе, что устройство 64-битное и поддерживает 64-битные приложения.

TARGET_USES_LOGD := true
# включает использование демона logd (заменяет утилиту logcat). Это стандартно для современных сборок.

PRODUCT_PLATFORM := zuma
TARGET_BOARD_PLATFORM := $(GOOGLE_BOARD_PLATFORMS)
# задают код платформы/SoC. Например, PRODUCT_PLATFORM := zuma (кодовое имя Pixel 8). 
# TARGET_BOARD_PLATFORM := $(GOOGLE_BOARD_PLATFORMS) – в вашем конфиге использует список платформ Google, куда добавлено “zuma”. 
# TARGET_BOARD_PLATFORM_GPU := mali-g71 – устаревший параметр, указывающий имя GPU-платформы (здесь Mali-G71). 
# В новых версиях AOSP он не используется (упоминался для графики старых устройств).

TARGET_BOOTLOADER_BOARD_NAME := $(PRODUCT_PLATFORM)
# имя платы загрузчика, добавляется в android-info.txt. 
# Если нет собственного board-info.txt, сборщик вставляет строку board=<TARGET_BOOTLOADER_BOARD_NAME>

TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt
# Файл board-info.txt, используемый при проверке совместимости OTA.

TARGET_NO_BOOTLOADER := true
# говорит не собирать и не устанавливать загрузчик (bootloader) в финальный образ. 
# Если не требуется включать файлы загрузчика, устанавливают этот флаг

TARGET_USES_UEFI := true
# указывает, что устройство загружается по UEFI (нет традиционного ARM boot.img). 
# Pixel 8 действительно использует загрузку по UEFI, поэтому этот флаг ставится в конфиге.


# Флаги обновлений (A/B OTA)

AB_OTA_UPDATER := true
# включает поддержку A/B (seamless) обновлений в рескрипте. 
# Обозначает, что устройство хранит две копии ОС (slot A/B) и обновляет их без длительного reflashing.

AB_OTA_PARTITIONS += boot
AB_OTA_PARTITIONS += init_boot
AB_OTA_PARTITIONS += vendor_boot
AB_OTA_PARTITIONS += dtbo
AB_OTA_PARTITIONS += vbmeta
AB_OTA_PARTITIONS += vbmeta_system
AB_OTA_PARTITIONS += vbmeta_vendor
AB_OTA_PARTITIONS += product
AB_OTA_PARTITIONS += system
AB_OTA_PARTITIONS += system_ext
AB_OTA_PARTITIONS += system_dlkm
AB_OTA_PARTITIONS += vendor
AB_OTA_PARTITIONS += vendor_dlkm
AB_OTA_PARTITIONS += modem
AB_OTA_PARTITIONS += vendor_kernel_boot
AB_OTA_PARTITIONS += tzsw
AB_OTA_PARTITIONS += idfw
AB_OTA_PARTITIONS += abl
AB_OTA_PARTITIONS += pvmfw
AB_OTA_PARTITIONS += bl2
AB_OTA_PARTITIONS += gsa
AB_OTA_PARTITIONS += bl31
AB_OTA_PARTITIONS += pbl
AB_OTA_PARTITIONS += gsa_bl1
AB_OTA_PARTITIONS += bl1
AB_OTA_PARTITIONS += gcf
# В вашем конфиге перечислены все разделы Pixel 8 (boot, init_boot, vendor_boot, dtbo, vbmeta и т.д.). 
# Это аналогично примеру Google для Pixel 3 (Crosshatch). 
# Каждая строка AB_OTA_PARTITIONS += X добавляет раздел X в список «A/B OTA», то есть он будет обрабатываться при создании OTA-пакета. 
# Подобный синтаксис указан и в блогах/документации по A/B обновлениям, 
# где AB_OTA_UPDATER := true означает «использовать A/B обновления», а AB_OTA_PARTITIONS перечисляет задействованные разделы 
# (в примере – boot, system, vendor и т.п.).


BOARD_USE_DYNAMIC_PARTITIONS  := true
BOARD_RECOVERY_SNAPSHOT := false
# (OrangeFox) отключает режим «Snapshot», при котором снимается снимок раздела для функции восстановить (в вашем случае отключён).

BOARD_SUPER_PARTITION_SIZE := 8531214336
BOARD_SUPER_PARTITION_GROUPS := google_dynamic_partitions
BOARD_GOOGLE_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor vendor_dlkm product
BOARD_GOOGLE_DYNAMIC_PARTITIONS_SIZE := 8527020032
# эти флаги связаны с динамическими разделами (super img) и Android’s Generic System Image (GSI). 
# Pixel 8 имеет динамический раздел super, разделённый на system, vendor и др. 
# Параметры BOARD_SUPER_PARTITION_SIZE, BOARD_GOOGLE_DYNAMIC_PARTITIONS_SIZE/partition_list задают размеры и состав этого «super.img» 
# (примерно 8.53 ГБ). Если DEVICE не использует динамику, эти флаги не нужны.

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
# указывают архитектуру для сборки ядра и установки заголовков ядра. 
# По умолчанию TARGET_KERNEL_HEADER_ARCH копирует значение из TARGET_KERNEL_ARCH. Ваш Pixel 8 – 64-битный (arm64).

# TARGET_KERNEL_CLANG_COMPILE   := true
# включает сборку ядра с помощью Clang (Android требует Clang). 
# Без этого флага ядро по умолчанию может собираться GCC. 
# Установка true гарантирует использование Clang. Пример использования: в руководствах по сборке ядра советуют добавить

BOARD_KERNEL_PAGESIZE    := 2048
BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE        := 0x1000000
BOARD_KERNEL_OFFSET      := 0x00008000
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(VENDOR_CMDLINE)
# Параметры для утилиты mkbootimg, задающие страницы, смещения и прочее. Здесь 2048-байтовый размер страницы ядра, 
# версия заголовка 4 и конкретные адреса (0x1000000 и т. д.), которые соответствуют требованиям загрузчика Pixel. 
# Эти настройки передаются команде mkbootimg через BOARD_MKBOOTIMG_ARGS. 
# Их корректность критична для загрузки, но в общем случае их оставляют из оригинальной BoardConfig для устройства.

# BOARD_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.lz4
# TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.lz4
BOARD_KERNEL_IMAGE_NAME := Image.lz4
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt/dtbs
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbs/dtbo.img
# TARGET_NO_KERNEL_OVERRIDE := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
# BOARD_DTB_OFFSET         := 0x01f00000
# (закомментированы) – альтернативные параметры, указывающие имя файла ядра и смещение DTB, но у вас не используются.





# Файловые системы и образы

TARGET_USERIMAGES_USE_EXT4 := true
# заставляет сборку генерировать образ(ы) разделов (system.img, vendor.img и т.д.) в формате ext4, а не в устаревших YAFFS2/F2FS по умолчанию. 
# Как отмечают разработчики AOSP, выбор файловой системы для образов задаётся этими флагами (EXT2/3/4)

TARGET_USERIMAGES_USE_F2FS := true
# добавляет поддержку создания образов в формате F2FS. При этом обычно указывают, какие именно разделы должны быть F2FS. 
# В вашем конфиге после этого есть BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs, что говорит о том, что раздел userdata должен быть F2FS, 
# а остальные (по умолчанию) – ext4. Изменения в сборке (коммит 2014 года) показали, что при установке обоих флагов ext4 и f2fs в 
# зависимости от настроек сборка выберет F2FS для userdata (и ext4 для остальных)

TARGET_COPY_OUT_VENDOR := vendor
# говорит, что содержимое vendor/ (образы, модули и т.п.) должно копироваться в отдельный файл vendor.img (отдельный раздел). 
# По умолчанию AOSP использует system/vendor (встраивает vendor внутрь system.img). 
# Наличие TARGET_COPY_OUT_VENDOR := vendor заставляет сборку делать отдельный vendor.img. 
# Официальный файл envsetup.mk указывает: если после чтения BoardConfig переменная осталась плейсхолдером, то ставится system/vendor; 
# если явно указано «vendor», то создаётся отдельный образ. Иначе возникнет ошибка.

BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
# задают файловые системы создаваемых образов: system – ext4, vendor – ext4, userdata – f2fs.
# В случае динамических разделов (super) эти флаги влияют на внутренние образы при создании system.img и т.д. Например,
# Pixel 8 стандартно использует ext4 для system/vendor и f2fs для data.

BOARD_FLASH_BLOCK_SIZE := 131072
# размер блока флэш-памяти (UFS) в байтах. Используется при форматировании/выравнивании образов.



# Разделы и восстановление (recovery)
TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888
# адаёт формат пикселей для интерфейса рекавери (восстановления). 
# Значение ABGR_8888 означает 32-битный цвет (Alpha-Blue-Green-Red). 
# Старые сборки рекавери читали этот флаг на этапе компиляции и включали соответствующий -DRECOVERY_ABGR. 
# В новых AOSP этот флаг игнорируется (формат устанавливается через свойство ro.recovery.ui.pixel_format). 
# Но OrangeFox/TWRP может по-прежнему использовать его, чтобы собрать нужный видео-драйвер
# TARGET_RECOVERY_PIXEL_FORMAT := RGB_565 Nont booted
# TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888 Uses, But orange its Blues, cute
# TARGET_RECOVERY_PIXEL_FORMAT := ARGB_8888 Not useles, black screen
# TARGET_RECOVERY_PIXEL_FORMAT := RGBA_8888 Not useles black screen
# TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888 Not useles EXTRAAA GREEEN
# TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888" Not useles EXTRAAA ORANGE

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
# путь к файлу fstab, описывающему таблицу разделов для рекавери. 
# Этот файл содержит список точек монтирования (/cache, /data, /system и т.д.) и устройств.
# В AOSP документации говорится, что имя файла карты разделов указывается через TARGET_RECOVERY_FSTAB, 
# и он используется как самим бинарником рекавери, так и инструментами сборки OTA.

TARGET_RECOVERY_WIPE := $(DEVICE_PATH)/recovery.wipe
# путь к файлу с перечнем разделов для очистки. Это специфично для TWRP/OrangeFox: 
# файл recovery.wipe содержит список разделов, которые нужно обнулять при штатной очистке (wipe data/factory reset). 
# Пример использования такого флага можно видеть в конфиге OrangeFox для Pixel 7a

TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 3827
TW_DEFAULT_BRIGHTNESS := 219
# путь в sysfs к яркости дисплея и максимальное/дефолтное значения яркости. Эти переменные нужны TWRP для управления экраном. 
# У Pixel 8 устанавливаются актуальные значения (максимум 3827) для правильной работы ползунка яркости.

TW_THEME := portrait_hdpi
TW_DEFAULT_LANGUAGE := en
TW_EXTRA_LANGUAGES := true
# параметры пользовательского интерфейса OrangeFox/TWRP: тема оформления, язык по умолчанию, разрешить дополнительные языки.

TW_EXCLUDE_DEFAULT_USB_INIT := True
# отключает стандартные USB init скрипты TWRP, чтобы использовать свои или системы устройства

TWRP_INCLUDE_LOGCAT := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_FASTBOOTD := true
# включают поддержку дополнительных утилит в сборке OrangeFox: просмотр logcat в рекавери, 
# инструменты репаковки прошивки, утилиту resetprop, поддержку FastbootD и т.п. 
# Это добавляет функциональность при отладке и обновлении.

TW_INPUT_BLACKLIST := "hbtp_vm"
# запрещает использовать драйверы некоторых сенсорных экранов (скорее всего, «heatbeam touch panel»). 
# Иногда требуется исключить нестандартные устройства ввода, вызывающие проблемы.

# TW_LOAD_VENDOR_MODULES := "heatmap.ko touch_offload.ko ftm5.ko sec_touch.ko goodix_brl_touch.ko goog_touch_interface.ko"
# TW_LOAD_VENDOR_DLKM_MODULES := "heatmap.ko touch_offload.ko ftm5.ko sec_touch.ko goodix_brl_touch.ko goog_touch_interface.ko"
# перечисление файлов модулей ядра, которые должны быть загружены рекавери. Здесь указаны .ko файлы сенсорных драйверов (heatmap, goodix и т.д.). 
# Без них сенсор может не работать в OrangeFox, поэтому их явно загружают.


TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_FUSE_EXFAT := true
# включают поддержку файловых систем NTFS (через ntfs-3g) и exFAT (через FUSE) в рекавери, 
# чтобы можно было работать с картами памяти этих форматов

TW_USE_TOOLBOX := true
TW_INCLUDE_LPTOOLS := true
TW_INCLUDE_PYTHON := true
# ключают различные утилиты (toolbox вместо ashutils, Python-скрипты, лёгкие инструменты для dumpstate и т.п.) в сборку рекавери.
BOARD_VINTF_CHECK := false
TW_NO_SCREEN_BLANK := true
# отключает автоматическое гашение экрана в рекавери (чтобы экран не темнел при бездействии).

# TWRP_EVENT_LOGGING := true
# включает логгирование событий (сенсора, кнопок, тач-джеста) для отладки.

TW_FRAMERATE := 120
# указывает частоту обновления экрана (120 Гц) для корректного рендеринга интерфейса.

# TW_USE_SAMSUNG_HAPTICS := true
# использовать алгоритмы Samsung для виброотдачи (обычно не сильно влияет на Pixel, но некоторые сборки так делают).


# Прочие параметры

VENDOR_CMDLINE := "dyndbg=\"func alloc_contig_dump_pages +p\" \
        earlycon=exynos4210,0x10A00000 \
        console=ttySAC0,115200 \
        androidboot.console=ttySAC0 \
        printk.devkmsg=on \
        swiotlb=noforce \
        cma_sysfs.experimental=Y \
        cgroup_disable=memory \
        rcupdate.rcu_expedited=1 \
        androidboot.usbcontroller=11210000.dwc3 \
        rcu_nocbs=all \
        stack_depot_disable=off \
        page_pinner=on \
        swiotlb=1024 \
        disable_dma32=on \
        at24.write_timeout=100 \
        log_buf_len=1024K \
        bootconfig"
BOARD_BOOTCONFIG += androidboot.usbcontroller=11210000.dwc3
BOARD_BOOTCONFIG += androidboot.boot_devices=13200000.ufs
BOARD_BOOTCONFIG += androidboot.load_modules_parallel=true
# задают дополнительные параметры командной строки ядра (bootconfig). 
# Здесь прописаны различные отладочные и аппаратные параметры (например, androidboot.boot_devices=13200000.ufs, swiotlb, и др.), 
# специфичные для платформы Exynos, но добавленные в OrangeFox.

# BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
# говорит не включать ядро в образ recovery.img (только в boot.img). 
# Устройства A/B обычно не имеют recovery.img как отдельной, поэтому ядро не нужно копировать в recovery.

BOARD_HAS_LARGE_FILESYSTEM := true
# разрешает большие файловые системы (e2fsck/dosfsck) при работе с exFAT и NTFS.

SELINUX_IGNORE_NEVERALLOWS := true
# при сборке рекавери игнорировать правила neverallow SELinux (неприменимо к работе на рантайме, только для сборки). 
# Часто ставят, чтобы сборка не падала из-за конфликтов политик SELinux.

BOARD_RAMDISK_USE_LZ4 := true
# сжимает initramfs (ramdisk) LZ4-алгоритмом (уменьшает размер, требует поддержки LZ4 в загрузчике). 
# Pixel 8 загружает initramfs LZ4.

TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
# настраивает путь LUN-нод для USB массового хранилища (используется в FastbootD mode). 
# Например, /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file – путь к файлу-устройству, 
# если нужно монтировать раздел как USB-диск при подключении.

TARGET_SCREEN_WIDTH := 1344
TARGET_SCREEN_HEIGHT := 2992
# ширина и высота экрана устройства (в пикселях). Используются в рекавери для расчёта диалогов и интерфейса.

BOARD_VENDOR := google
# название вендора (здесь Google).

GOOGLE_BOARD_PLATFORMS += zuma
# добавляет «zuma» в список поддерживаемых платформ Google (Pixel 8 и 8 Pro).

TARGET_NO_RECOVERY := true
# говорит, что у устройства нет отдельного образа recovery 
# (т. е. recovery работает внутри vendor_boot или init_boot). Для A/B устройств обычно true.

LC_ALL := C
# устанавливает локаль C (англ. по умолчанию) при сборке, чтобы избежать неожиданных влияний локали на скрипты.

BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist
# дополнительные каталоги в корневом разделе, которые надо сохранять при патчах системы/очистке.

BOARD_SUPPRESS_SECURE_ERASE := true
# (TWRP) отключает «Secure Erase» раздела, если он считался неподдерживаемым.

TW_VERSION := LeeGarChat
# задаёт метку версии OrangeFox (которую вы придали сборке).

TW_INCLUDE_LIBRESETPROP := true
# Включает libresetprop, библиотеку Magisk-подобного способа подмены системных пропертей (getprop).
# TWRP может использовать resetprop для изменения значений build.prop без прямого редактирования.

TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true
# Когда используется GKI (Generic Kernel Image), некоторые модули ядра поставляются отдельно.
# Этот флаг указывает исключить GKI-модули при автозагрузке vendor/modules.
# Используется, чтобы TWRP не пытался загрузить GKI-модули, если они уже интегрированы.

TW_BATTERY_SYSFS_WAIT_SECONDS := 6
# TWRP подождёт 6 секунд, прежде чем начать считывать информацию о батарее из sysfs, чтобы дождаться инициализации.
# Актуально для новых устройств, где батарея появляется не сразу.

TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
# Подключает файл system.prop к сборке recovery.
# Используется для добавления или переопределения пропертей, которые должны применяться в рекавери.

BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
# Указывает собрать ресурсы recovery (темы, изображения, шрифты и т.п.) в раздел vendor_boot вместо boot.
# Это особенно важно для устройств с разделением boot/vendor_boot, начиная с Android 10+.

# BOARD_USES_GENERIC_KERNEL_IMAGE := true
# Указывает, что используется универсальное ядро (GKI), а не кастомное.
# Сборщик не будет искать Image.gz-dtb, а будет использовать GKI подход с отдельным DTBO/Vendor_boot.

BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true
# Если используется AVB (Android Verified Boot), то этот флаг говорит системе переместить GSI-ключи в vendor_boot, 
# чтобы AVB работал корректно на GSI-прошивках.

BOARD_AVB_ENABLE := true
# Включает сборку с поддержкой AVB (Android Verified Boot v2).
# TWRP будет собран так, чтобы корректно взаимодействовать с AVB (например, при подписи, проверке ключей и т.д.).

TW_EXCLUDE_APEX := true
# Отключает поддержку APEX-модулей (новый формат системных компонентов, начиная с Android 10).
# В recovery APEX не нужны, и их отключение уменьшает размер и упрощает окружение.

ENABLE_SCHEDBOOST := true
# Включает scheduler boost — приоритетное исполнение задач.
# Позволяет TWRP работать более отзывчиво, особенно во время тяжелых операций.

TARGET_USES_MKE2FS := true
# Указывает использовать mke2fs (вместо make_ext4fs) для создания файловых систем ext4.
# mke2fs — более современный и гибкий инструмент. Часто используется в новых прошивках.

RECOVERY_SDCARD_ON_DATA := true

# BOARD_INCLUDE_DTB_IN_BOOTIMG := true
# Добавляет .dtb (device tree blob) в boot.img, а не отдельно.
# Актуально для многих устройств, где загрузчик требует .dtb прямо в boot.

BOARD_DTBOIMG_PARTITION_SIZE := 4194304
# Размер раздела dtbo (в байтах).
# Значение 4194304 = 4MB. Нужно для правильной сборки dtbo.img.

# ENABLE_CPUSETS := true
# Включает cpusets — механизм управления CPU ядрами (распределение процессов по кластерам).
# Для оптимизации производительности recovery на многоядерных чипах.












