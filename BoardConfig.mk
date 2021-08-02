#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from msm8937-common
include device/asus/msm8937-common/BoardConfigCommon.mk

DEVICE_PATH := device/asus/X00I

# Display
TARGET_SCREEN_DENSITY := 320

# Kernel
TARGET_KERNEL_CONFIG := X00I_defconfig

# Inherit from the proprietary version
include vendor/asus/X00I/BoardConfigVendor.mk
