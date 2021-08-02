#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from msm8937-common
$(call inherit-product, device/asus/msm8937-common/msm8937.mk)

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 25

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit vendor
$(call inherit-product, vendor/asus/X00I/X00I-vendor.mk)
