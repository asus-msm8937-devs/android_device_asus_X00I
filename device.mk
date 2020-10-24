#
# Copyright (C) 2020 The LineageOS Project
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

# Inherit from msm8937-common
$(call inherit-product, device/asus/msm8937-common/msm8937.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage/lineage-sdk \
    $(LOCAL_PATH)/overlay/packages/apps/Snap

# Properties
-include $(LOCAL_PATH)/vendor_prop.mk

# Camera
PRODUCT_PACKAGES += \
    libgui_vendor

# Fingerprint
PRODUCT_PACKAGES += \
    libunwind.vendor

PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.X00I

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gf5216.kl:system/usr/keylayout/gf5216.kl \
    $(LOCAL_PATH)/keylayout/qwerty.kl:system/usr/keylayout/querty.kl

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Rootdir
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.device.rc

# Soong
PRODUCT_SOONG_NAMESPACES += \
    device/asus/X00I

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.asus_8937

# Inherit vendor
$(call inherit-product, vendor/asus/X00I/X00I-vendor.mk)
