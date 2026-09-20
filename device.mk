#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from the common QTI configuration
$(call inherit-product, hardware/qcom-caf/common/common.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/vabc_features.mk)

PRODUCT_VIRTUAL_AB_COMPRESSION_METHOD := lz4

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# API levels
PRODUCT_SHIPPING_API_LEVEL := 36

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Kernel
PRODUCT_ENABLE_UFFD_GC := true

# Lineage Health
PRODUCT_PACKAGES += \
    vendor.lineage.health-service.default

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Recovery
PRODUCT_BUILD_RECOVERY_IMAGE := true

# Rootdir
PRODUCT_PACKAGES += \
    apanic_annotate.sh \
    apanic_copy.sh \
    apanic_save.sh \
    copy_qc_cert.sh \
    coresight_reset_source_sink.sh \
    dcc_extension.sh \
    hardware_revisions.sh \
    init.class_main.sh \
    init.crda.sh \
    init.gbmods.sh \
    init.kernel.init_boot-memory.sh \
    init.kernel.post_boot-kera.sh \
    init.kernel.post_boot-kera_2_3_1.sh \
    init.kernel.post_boot-kera_2_4_0.sh \
    init.kernel.post_boot-kera_3_2_1.sh \
    init.kernel.post_boot-kera_default_3_4_1.sh \
    init.kernel.post_boot-memory.sh \
    init.kernel.post_boot-sun.sh \
    init.kernel.post_boot-sun_5_2.sh \
    init.kernel.post_boot-sun_6_0.sh \
    init.kernel.post_boot-sun_default_6_2.sh \
    init.kernel.post_boot-tuna.sh \
    init.kernel.post_boot-tuna_1_3_2_1.sh \
    init.kernel.post_boot-tuna_2_2_2_1.sh \
    init.kernel.post_boot-tuna_2_3_1_1.sh \
    init.kernel.post_boot-tuna_2_3_2_0.sh \
    init.kernel.post_boot-tuna_default_2_3_2_1.sh \
    init.kernel.post_boot.sh \
    init.mdm.sh \
    init.mmi.block_perm.sh \
    init.mmi.boot.sh \
    init.mmi.cap.sh \
    init.mmi.display.sh \
    init.mmi.mdlog-getlogs.sh \
    init.mmi.shutdown.sh \
    init.mmi.touch.sh \
    init.mmi.usb.sh \
    init.mmi.wlan-getlogs.sh \
    init.mmi.wls.sh \
    init.oem.fingerprint2.sh \
    init.oem.hw.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.early_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qcrild.sh \
    init.qti.display_boot.sh \
    init.qti.kernel.debug-kera.sh \
    init.qti.kernel.debug-sun.sh \
    init.qti.kernel.debug-tuna.sh \
    init.qti.kernel.debug.sh \
    init.qti.kernel.early_debug-kera.sh \
    init.qti.kernel.early_debug-sun.sh \
    init.qti.kernel.early_debug-tuna.sh \
    init.qti.kernel.early_debug.sh \
    init.qti.kernel.sh \
    init.qti.keymaster.sh \
    init.qti.media.sh \
    init.qti.qcv.sh \
    init.qti.write.sh \
    mot_rkp_csr_extraction.sh \
    pstore_annotate.sh \
    qca6234-service.sh \
    system_dlkm_modprobe.sh \
    vendor_modprobe.sh \

PRODUCT_PACKAGES += \
    fstab.qcom \
    fstab.qcom.zramwb \
    init.mmi.charge_only.rc \
    init.mmi.chipset.rc \
    init.mmi.debug.rc \
    init.mmi.diag.rc \
    init.mmi.diag_mdlog.rc \
    init.mmi.overlay.rc \
    init.mmi.rc \
    init.mmi.services.override.rc \
    init.mmi.tcmd.rc \
    init.mmi.usb.rc \
    init.mmi.wlan.rc \
    init.qcom.factory.rc \
    init.qcom.rc \
    init.qti.kernel.rc \
    init.qti.kernel.target.rc \
    init.qti.ufs.rc \
    init.target.rc \
    init.vendor.st21nfc.rc \
    init.recovery.qcom.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom.zramwb:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.qcom.zramwb

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/audio/bluetooth_qti_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/Vendor_22b8_Product_093d.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_22b8_Product_093d.kl \
    $(LOCAL_PATH)/configs/keylayout/fts_ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/fts_ts.kl \
    $(LOCAL_PATH)/configs/keylayout/goodix_ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/goodix_ts.kl \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/idroid_con.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/idroid_con.kl

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance_sun.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_sun.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance_sun_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_sun_vendor.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_sun.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_sun.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_sun_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_sun_vendor.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_sun.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_sun.xml

# Power
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/power/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml

# QCRIL database
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/qcril-database/qcrilNr.db:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/qcrilNr.db \
    $(LOCAL_PATH)/qcril-database/upgrade/config/0006.0_config.sql:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/upgrade/config/0006.0_config.sql \
    $(LOCAL_PATH)/qcril-database/upgrade/config/0007.0_config.sql:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/upgrade/config/0007.0_config.sql \
    $(LOCAL_PATH)/qcril-database/upgrade/config/0008.0_config.sql:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/upgrade/config/0008.0_config.sql \
    $(LOCAL_PATH)/qcril-database/upgrade/config/0009.0_config.sql:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/upgrade/config/0009.0_config.sql \
    $(LOCAL_PATH)/qcril-database/upgrade/config/0010.0_config.sql:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/upgrade/config/0010.0_config.sql \
    $(LOCAL_PATH)/qcril-database/upgrade/config/0011.0_config.sql:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/upgrade/config/0011.0_config.sql \
    $(LOCAL_PATH)/qcril-database/upgrade/config/0012.0_config.sql:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/upgrade/config/0012.0_config.sql \
    $(LOCAL_PATH)/qcril-database/upgrade/config/0013.0_config.sql:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/upgrade/config/0013.0_config.sql \
    $(LOCAL_PATH)/qcril-database/upgrade/config/0014.0_config.sql:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/upgrade/config/0014.0_config.sql \
    $(LOCAL_PATH)/qcril-database/upgrade/config/0015.0_config.sql:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/upgrade/config/0015.0_config.sql \
    $(LOCAL_PATH)/qcril-database/upgrade/ecc/mot_generated_ecc_qcrildb.sql:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/upgrade/ecc/mot_generated_ecc_qcrildb.sql \
    $(LOCAL_PATH)/qcril-database/upgrade/other/0002_version_add_wps_config_qcrilnr.sql:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/upgrade/other/0002_version_add_wps_config_qcrilnr.sql \
    $(LOCAL_PATH)/qcril-database/upgrade/other/0003_version_update_wps_config_qcrilnr.sql:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/upgrade/other/0003_version_update_wps_config_qcrilnr.sql \
    $(LOCAL_PATH)/qcril-database/upgrade/other/0006_version_change_property_table_qcrilnr.sql:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/upgrade/other/0006_version_change_property_table_qcrilnr.sql \
    $(LOCAL_PATH)/qcril-database/upgrade/other/0014_version_update_modules.sql:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/upgrade/other/0014_version_update_modules.sql \
    $(LOCAL_PATH)/qcril-database/upgrade/other/0015_version_add_iccid_clir_pref_table.sql:$(TARGET_COPY_OUT_VENDOR)/etc/qcril_database/upgrade/other/0015_version_add_iccid_clir_pref_table.sql

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/qca6750/WCNSS_prc_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/qca6750/WCNSS_prc_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/qca6750/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/qca6750/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/vendor_cmd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/vendor_cmd.xml \
    $(LOCAL_PATH)/configs/wifi/wfdr2_regex.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wfdr2_regex.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Telephony
PRODUCT_PACKAGES += \
    extphonelib \
    extphonelib-product \
    extphonelib.xml \
    extphonelib_product.xml \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti-telephony-hidl-wrapper-prd \
    qti_telephony_hidl_wrapper.xml \
    qti_telephony_hidl_wrapper_prd.xml \
    qti-telephony-utils \
    qti-telephony-utils-prd \
    qti_telephony_utils.xml \
    qti_telephony_utils_prd.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/roadstr/roadstr-vendor.mk)
