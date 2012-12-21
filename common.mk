# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PRODUCT_BRAND ?= jellaxy

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Backup Tool
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    device/samsung/msm7x27-common/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    device/samsung/msm7x27-common/prebuilt/common/bin/50-cm.sh:system/addon.d/50-cm.sh

# init.d support
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    device/samsung/msm7x27-common/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/common/bin/compcache:system/bin/compcache \
    device/samsung/msm7x27-common/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

# Nam configuration script
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/common/bin/modelid_cfg.sh:system/bin/modelid_cfg.sh

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/common/etc/mkshrc:system/etc/mkshrc

# Required CM packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    LatinIME \
    SpareParts \
    Superuser \
    su

# GSM APN list
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# GSM SPN overrides list
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/common/etc/spn-conf.xml:system/etc/spn-conf.xml

# SIM Toolkit
PRODUCT_PACKAGES += \
    Stk


## GPS configuration
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

## Media
PRODUCT_PACKAGES += \
    libOmxCore \
    libmm-omxcore \
    libstagefrighthw 

## Display
PRODUCT_PACKAGES += \
    gralloc.msm7x27 \
    hwcomposer.msm7x27 \
    copybit.msm7x27 \
    libgenlock \
    liboverlay \
    libtilerenderer 

## Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaudioutils

## Camera
PRODUCT_PACKAGES += \
    camera.gio \
 
## GPS
#PRODUCT_PACKAGES += \
#    librpc
## Somehow it does not compile. Use prebuilt for now

## Other
PRODUCT_PACKAGES += \
    make_ext4fs \
    brcm_patchram_plus \
    bdaddr_read \
    setup_fs \
    FileManager  

## Vold config
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/etc/vold.fstab:system/etc/vold.fstab

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/platform.xml:system/etc/permissions/platform.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

## Ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/ramdisk/lib/modules/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/msm7x27-common/ramdisk/lib/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/msm7x27-common/ramdisk/lib/modules/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/msm7x27-common/ramdisk/lib/modules/rfs_fat.ko:root/lib/modules/rfs_fat.ko \
    device/samsung/msm7x27-common/ramdisk/lib/modules/rfs_glue.ko:root/lib/modules/rfs_glue.ko 

## Wi-Fi & networking
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/msm7x27-common/prebuilt/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/msm7x27-common/prebuilt/bin/get_macaddrs:system/bin/get_macaddrs

## Media
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/msm7x27-common/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/msm7x27-common/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/msm7x27-common/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/samsung/msm7x27-common/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml

## Keymap
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/msm7x27-common/prebuilt/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/msm7x27-common/prebuilt/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/samsung/msm7x27-common/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/msm7x27-common/prebuilt/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl 

## Keychar
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/usr/keylayout/qwerty.kcm:system/usr/keylayout/qwerty.kcm \
    device/samsung/msm7x27-common/prebuilt/usr/keylayout/qwerty2.kcm:system/usr/keylayout/qwerty2.kcm \
    device/samsung/msm7x27-common/prebuilt/usr/keylayout/Virtual.kcm:system/usr/keylayout/Virtual.kcm \
    device/samsung/msm7x27-common/prebuilt/usr/keylayout/Generic.kcm:system/usr/keylayout/Generic.kcm

## Touchscreen
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

## ICS GPS blob
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/lib/hw/gps.msm7x27.so:system/lib/hw/gps.msm7x27.so \
    device/samsung/msm7x27-common/prebuilt/lib/librpc.so:system/lib/librpc.so

## Touchwiz
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/touchwiz/lib/libdrawglfunction.so:system/lib/libdrawglfunction.so \
    device/samsung/msm7x27-common/prebuilt/touchwiz/app/BadgeProvider.apk:system/app/BadgeProvider.apk \
    device/samsung/msm7x27-common/prebuilt/touchwiz/app/SecLauncher2.apk:system/app/SecLauncher2.apk

## gapps
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/gapps/app/ChromeBookmarksSyncAdapter.apk:system/app/ChromeBookmarksSyncAdapter.apk \
    device/samsung/msm7x27-common/prebuilt/gapps/app/GoogleBackupTransport.apk:system/app/GoogleBackupTransport.apk \
    device/samsung/msm7x27-common/prebuilt/gapps/app/GoogleCalendarSyncAdapter.apk:system/app/GoogleCalendarSyncAdapter.apk \
    device/samsung/msm7x27-common/prebuilt/gapps/app/GoogleContactsSyncAdapter.apk:system/app/GoogleContactsSyncAdapter.apk \
    device/samsung/msm7x27-common/prebuilt/gapps/app/GoogleFeedback.apk:system/app/GoogleFeedback.apk \
    device/samsung/msm7x27-common/prebuilt/gapps/app/GoogleLoginService.apk:system/app/GoogleLoginService.apk \
    device/samsung/msm7x27-common/prebuilt/gapps/app/GoogleNowVoiceSearch.apk:system/app/GoogleNowVoiceSearch.apk \
    device/samsung/msm7x27-common/prebuilt/gapps/app/GooglePartnerSetup.apk:system/app/GooglePartnerSetup.apk \
    device/samsung/msm7x27-common/prebuilt/gapps/app/GoogleServicesFramework.apk:system/app/GoogleServicesFramework.apk \
    device/samsung/msm7x27-common/prebuilt/gapps/app/MediaUploader.apk:system/app/MediaUploader.apk \
    device/samsung/msm7x27-common/prebuilt/gapps/app/NetworkLocation.apk:system/app/NetworkLocation.apk \
    device/samsung/msm7x27-common/prebuilt/gapps/app/OneTimeInitializer.apk:system/app/OneTimeInitializer.apk \
    device/samsung/msm7x27-common/prebuilt/gapps/app/Phonesky.apk:system/app/Phonesky.apk \
    device/samsung/msm7x27-common/prebuilt/gapps/app/SetupWizard.apk:system/app/SetupWizard.apk \
    device/samsung/msm7x27-common/prebuilt/gapps/app/Talk.apk:system/app/Talk.apk \
    device/samsung/msm7x27-common/prebuilt/gapps/app/VoiceSearch.apk:system/app/VoiceSearch.apk \
    device/samsung/msm7x27-common/prebuilt/gapps/etc/g.prop:system/etc/g.prop \
    device/samsung/msm7x27-common/prebuilt/gapps/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
    device/samsung/msm7x27-common/prebuilt/gapps/etc/permissions/com.google.android.media.effects.xml:system/etc/permissions/com.google.android.media.effects.xml \
    device/samsung/msm7x27-common/prebuilt/gapps/etc/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml \
    device/samsung/msm7x27-common/prebuilt/gapps/etc/permissions/features.xml:system/etc/permissions/features.xml \
    device/samsung/msm7x27-common/prebuilt/gapps/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
    device/samsung/msm7x27-common/prebuilt/gapps/framework/com.google.android.media.effects.jar:system/framework/com.google.android.media.effects.jar \
    device/samsung/msm7x27-common/prebuilt/gapps/framework/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar \
    device/samsung/msm7x27-common/prebuilt/gapps/lib/libvoicesearch.so:system/lib/libvoicesearch.so

## Other
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := ldpi mdpi normal

# Set JELLAXY_BUILDTYPE
ifdef JELLAXY_NIGHTLY
    JELLAXY_BUILDTYPE := NIGHTLY
else
    JELLAXY_BUILDTYPE := EXPERIMENTAL
endif


ifdef JELLAXY_RELEASE
    JELLAXY_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(JELLAXY_BUILD)
else
    JELLAXY_VERSION := $(PRODUCT_VERSION_MAJOR)-$(shell date -u +%Y%m%d)-$(JELLAXY_BUILDTYPE)-$(JELLAXY_BUILD)$(JELLAXY_EXTRAVERSION)
endif

PRODUCT_PROPERTY_OVERRIDES += \
  ro.jellaxy.version=$(JELLAXY_VERSION) \
  ro.modversion=$(JELLAXY_VERSION)
