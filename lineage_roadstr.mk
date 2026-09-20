#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from roadstr device
$(call inherit-product, device/motorola/roadstr/device.mk)

PRODUCT_NAME := lineage_roadstr
PRODUCT_DEVICE := roadstr
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 70

PRODUCT_SYSTEM_NAME := roadstr_g
PRODUCT_SYSTEM_DEVICE := roadstr

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="roadstr_g-user 17 A171WRM-A171-ST3 3d8c7 release-keys" \
    BuildFingerprint=motorola/roadstr_g/msi:17/A171WRM-A171-ST3/3d8c7:user/release-keys \
    DeviceName=$(PRODUCT_SYSTEM_DEVICE) \
    DeviceProduct=$(PRODUCT_SYSTEM_NAME)

PRODUCT_GMS_CLIENTID_BASE := android-motorola
