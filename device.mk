#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += build.variant.self=$(BUILD_VATIANT_SELF)

DEVICE_PATH := device/google/shiba

PLATFORM_SECURITY_PATCH := 2099-12-31

VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="shiba-user 15 AP3A.241005.015 12366759 release-keys" \
    BuildFingerprint=google/shiba/shiba:15/AP3A.241005.015/12366759:user/release-keys \
    DeviceProduct=shiba

PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

PRODUCT_SHIPPING_API_LEVEL := 34
PRODUCT_TARGET_VNDK_VERSION := 34
TARGET_VNDK_VERSION := 34
# Назначение:PRODUCT_SHIPPING_API_LEVEL: Указывает уровень API Android (34 = Android 14), с которым устройство было выпущено.
# PRODUCT_TARGET_VNDK_VERSION / TARGET_VNDK_VERSION: Задают версию Vendor Native Development Kit (VNDK), используемую для совместимости vendor модулей.
# Необходимость: Обязательно для согласованности с Android 14 и VINTF.
# Примечание: Для Pixel 8 эти значения корректны, так как устройство работает на Android 14.

PRODUCT_USE_DYNAMIC_PARTITIONS := true
# Назначение: Включает поддержку динамических разделов, которые используются в современных устройствах Android, таких как Pixel 8, для гибкого управления разделами (system, vendor, product).
# Необходимость: Обязательно для устройств с A/B-разделами и динамическими суперпартциями, как у Pixel 8.
# Примечание: Без этого флага рекавери не сможет корректно работать с разделами, такими как system или vendor.

# Требуеться для firstage -------------------------------#
PRODUCT_PACKAGES += linker.vendor_ramdisk                #
PRODUCT_PACKAGES += linker_hwasan64.vendor_ramdisk       #
PRODUCT_PACKAGES += resize2fs.vendor_ramdisk             #
PRODUCT_PACKAGES += resize.f2fs.vendor_ramdisk           #
PRODUCT_PACKAGES += dump.f2fs.vendor_ramdisk             #
PRODUCT_PACKAGES += defrag.f2fs.vendor_ramdisk           #
PRODUCT_PACKAGES += fsck.vendor_ramdisk                  #
PRODUCT_PACKAGES += tune2fs.vendor_ramdisk               #
PRODUCT_PACKAGES += fstab.zuma.vendor_ramdisk            #
PRODUCT_PACKAGES += fstab.zuma-fips.vendor_ramdisk       #
PRODUCT_PACKAGES += e2fsck.vendor_ramdisk                #
# Требуеться для firstage -------------------------------#

PRODUCT_PACKAGES += update_engine
PRODUCT_PACKAGES += update_engine_sideload
PRODUCT_PACKAGES += update_verifier

# Назначение:update_engine_sideload: Бинарник для применения OTA-обновлений через sideload в рекавери (например, через adb sideload).
# update_engine: Основной бинарник для обработки OTA-обновлений, включая A/B-обновления.
# update_verifier: Утилита для проверки целостности и подписи OTA-обновлений.
# Необходимость:Обязательно: update_engine_sideload — критично для рекавери, чтобы поддерживать установку OTA через sideload.
# Опционально: update_engine и update_verifier — могут быть избыточными для рекавери, так как они больше нужны для системных сборок. В рекавери обычно используется только update_engine_sideload.


PRODUCT_PACKAGES += android.hardware.boot@1.2-service-pixel
PRODUCT_PACKAGES += android.hardware.boot@1.2-impl-pixel
# ✅Нужно для корректной работы bootcontrol, переключения слотов библеотека из исходников pixel
# recovery/root/system/bin/hw/android.hardware.boot@1.2-service-pixel / android.hardware.boot@1.2-service-pixel
# recovery/root/system/etc/init/android.hardware.boot@1.2-service-pixel.rc / android.hardware.boot@1.2-service-pixel
# recovery/root/system/lib64/hw/android.hardware.boot@1.0-impl-1.2-impl-pixel.so / android.hardware.boot@1.2-impl-pixel

PRODUCT_PACKAGES += fastbootd
# Назначение: Включает режим fastbootd в рекавери, который позволяет выполнять команды fastboot (например, fastboot flash) непосредственно из рекавери, а не из загрузчика.
# Необходимость: Полезно для рекавери, особенно для динамических разделов. Рекомендуется оставить.
# Примечание: Pixel 8 не поддерживает fastboot boot для рекавери, поэтому fastbootd важен для прошивки и отладки.

PRODUCT_PACKAGES += libsysutils
RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libsysutils.so
# Назначение: Библиотека libsysutils предоставляет утилиты для взаимодействия с системными сервисами, такими как управление свойствами или доступ к оборудованию.
# Необходимость: Полезно для рекавери, особенно для функций, связанных с управлением устройством (например, переключение слотов).
# Примечание: Вы подтвердили, что библиотека присутствует в recovery/root/system/lib64. Рекомендуется оставить.

TARGET_RECOVERY_DEVICE_MODULES += libion
RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libion.so
# Назначение:libion: Библиотека для работы с ION (Android Ion Memory Allocator), используется для управления памятью графических буферов.
# Необходимость: Опционально. Может быть нужен для корректной работы дисплея или графического интерфейса рекавери. Требует тестирования.
# Примечание: Вы указали, что это нужно протестировать. Проверьте, работает ли интерфейс рекавери без этой библиотеки.

BOARD_USES_METADATA_PARTITION := true
# Назначение: Включает поддержку раздела metadata для хранения данных о шифровании и других метаданных, необходимых для динамических разделов.
# Необходимость: Обязательно для Pixel 8, так как он использует шифрование и динамические разделы.
# Примечание: Оставьте этот флаг, чтобы обеспечить корректную работу с шифрованием (или его отключением через DFE-NEO).

PRODUCT_PACKAGES += libtrusty
# Назначение: Библиотека для работы с Trusty TEE (Trusted Execution Environment), используется для безопасных операций, таких как доступ к ключам шифрования.
# Необходимость: Полезно для рекавери, если вы поддерживаете дешифрование данных. Вы подтвердили, что она присутствует в recovery/root/system/lib64.

PRODUCT_PACKAGES += vndservicemanager
# Назначение: Сервис для управления VINTF (Vendor Interface) сервисами в vendor_ramdisk.
# Необходимость: Обязательно для устройств с VINTF, таких как Pixel 8.

PRODUCT_PACKAGES += vndservice
# Назначение: Бинарник для взаимодействия с vendor сервисами, необходим для работы HAL.
# Необходимость: Обязательно для корректной работы vendor компонентов.


PRODUCT_PACKAGES += libhidltransport.vendor
# Назначение: Библиотека для транспортировки HIDL сообщений между процессами в vendor_ramdisk.
# Необходимость: Обязательно для устройств с HIDL-интерфейсами.

DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/system/etc/vinit/manifest.xml
PRODUCT_ENFORCE_VINTF_MANIFEST := true
# Назначение:DEVICE_MANIFEST_FILE: Указывает путь к файлу манифеста VINTF, который описывает HAL-интерфейсы устройства.
# PRODUCT_ENFORCE_VINTF_MANIFEST: Включает проверку манифеста VINTF для обеспечения совместимости vendor компонентов.
# Необходимость: Обязательно для устройств с VINTF, таких как Pixel 8.
# Примечание: Убедитесь, что manifest.xml существует в указанном пути и содержит корректные HAL-описания.

PRODUCT_PACKAGES += bootctl
# Назначение: Утилита для управления A/B слотами, позволяет переключать активный слот и проверять их состояние.
# Необходимость: Обязательно для A/B-устройств, таких как Pixel 8.

PRODUCT_PACKAGES += logcat
# Назначение: Утилита для чтения системных логов, полезна для отладки в рекавери.
# Необходимость: Полезно, но опционально. Можно удалить, если не требуется отладка.

PRODUCT_PACKAGES += logd 
# Назначение: Демон для управления логами в Android.
# Необходимость: Опционально для рекавери, так как логирование обычно минимально.

PRODUCT_PACKAGES += auditctl
# Назначение: Утилита для управления аудитом SELinux.
# Необходимость: Опционально. Может быть полезна для отладки SELinux, но редко нужна в рекавери.

PRODUCT_PACKAGES += libcap
# Назначение: Библиотека для работы с POSIX capabilities, используется для управления привилегиями процессов.
# Необходимость: Полезно для рекавери, особенно для SELinux или управления доступом.

ENABLE_VIRTUAL_AB := true
# Назначение: Включает поддержку Virtual A/B, которая позволяет применять OTA-обновления без выделения отдельного пространства для второго набора разделов.
# Необходимость: Обязательно для Pixel 8, так как он использует Virtual A/B для OTA.
# Примечание: Оставьте этот флаг, так как он важен для работы с A/B-разделами.
# Протетсировать ❓



# PRODUCT_COPY_FILES += \
#     $(DEVICE_PATH)/fox_mod_ui/advanced.xml:recovery/root/twres/pages/advanced.xml \
#     $(DEVICE_PATH)/fox_mod_ui/install.xml:recovery/root/twres/pages/install.xml








# TARGET_RECOVERY_DEVICE_MODULES += vendor.display.config@1.0 
# TARGET_RECOVERY_DEVICE_MODULES += vendor.display.config@2.0

# PRODUCT_PACKAGES += libdisplaycolor # ❓НЕТ в пакете и в pb файлах, протестировать
# # Скорее всего графический драйвер, но не точно ❓
# # recovery/root/system/lib64/vendor.display.config@1.0.so
# # recovery/root/system/lib64/vendor.display.config@2.0.so
# RECOVERY_LIBRARY_SOURCE_FILES += \
#     $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
#     $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so 

# # Верятно не нужно ❓
# PRODUCT_PACKAGES += android.hardware.health-service.zuma_recovery

# # Нет в pb файлах, и нет в сборке ❓
# PRODUCT_PACKAGES += checkpoint_gc
# # Нет в pb файлах, и нет в сборке ❓ тоже не понятно зачем
# PRODUCT_PACKAGES += cppreopts.sh

# RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libcap
# RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/auditctl
# RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/bootctl
# RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/logcat
# RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/logd




















