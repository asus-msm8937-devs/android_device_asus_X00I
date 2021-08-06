#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib/libarcsoft_hdr.so \
        |vendor/lib/libarcsoft_nighthawk.so \
        |vendor/lib/libarcsoft_night_shot.so \
        |vendor/lib/libarcsoft_panorama_burstcapture.so \
        |vendor/lib/libarcsoft_videostab.so \
        |vendor/lib/libmpbase.so)
            "${PATCHELF}" --remove-needed "libandroid.so" "${2}"
            ;;
        vendor/bin/gx_fpd \
        |vendor/lib64/hw/fingerprint.default.so \
        |vendor/lib64/libfp_client.so \
        |vendor/lib64/libfpservice.so)
            "${PATCHELF_0_8}" --remove-needed "libbacktrace.so" "${2}"
            "${PATCHELF_0_8}" --remove-needed "libunwind.so" "${2}"
            sed -i "s|libbinder.so|gxfp_shim.so|g" "${2}"
            ;;
        vendor/lib64/hw/fingerprintfocal.default.so \
        |vendor/lib64/hw/gxfingerprint.default.so)
            sed -i "s|/firmware/image|/vendor/f/image|g" "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=X00I
export DEVICE_COMMON=msm8937-common
export VENDOR=asus

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
