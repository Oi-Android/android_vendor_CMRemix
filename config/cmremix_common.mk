# Zion959 Debugs Files
PRODUCT_COPY_FILES += \
    vendor/cmremix/prebuilt/common/etc/00_DEBUG:system/etc/init.d/00_DEBUG

# AdBlocker Files
PRODUCT_COPY_FILES += \
    vendor/cmremix/prebuilt/common/etc/hosts.alt:system/etc/hosts.alt \
    vendor/cmremix/prebuilt/common/etc/hosts.og:system/etc/hosts.og

# CM-Remix Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/cmremix/overlay/common

# Bootanimation
PRODUCT_COPY_FILES += vendor/cmremix/prebuilt/common/bootanimation/$(CMREMIX_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/cmremix/prebuilt/common/etc/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/cmremix/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# Init script file with CM-Remix extras
PRODUCT_COPY_FILES += \
vendor/cmremix/prebuilt/common/etc/init.local.rc:root/init.cmremix.rc

# easy way to extend to add more packages
-include vendor/cmremix/extra/product.mk

# Debugs Script
-include vendor/cmremix/products/debug.mk

# CM-Remix version
CMREMIXVERSION := $(shell echo $(CMREMIX_VERSION) | sed -e 's/^[ \t]*//;s/[ \t]*$$//;s/ /./g')
BOARD := $(subst cmremix_,,$(TARGET_PRODUCT))
CMREMIX_BUILD_VERSION := CMRemix-$(BOARD)-$(CMREMIXVERSION)-$(shell date +%Y%m%d-%H%M%S)

# Set the board version
CM_BUILD := $(BOARD)

# Lower RAM devices
ifeq ($(CMREMIX_LOW_RAM_DEVICE),true)
MALLOC_IMPL := dlmalloc
TARGET_BOOTANIMATION_TEXTURE_CACHE := false

PRODUCT_PROPERTY_OVERRIDES += \
    config.disable_atlas=true \
    dalvik.vm.jit.codecachesize=0 \
    persist.sys.force_highendgfx=true \
    ro.config.low_ram=true \
    ro.config.max_starting_bg=8 \
    ro.sys.fw.bg_apps_limit=16
endif

# ROMStats Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cmremixstats.name=cmRemix Rom \
    ro.cmremixstats.version=$(CMREMIXVERSION) \
    ro.cmremixstats.tframe=1

# statistics identity
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cmremix.version=$(CMREMIXVERSION) \
    ro.modversion=$(CMREMIX_BUILD_VERSION) \
    cmremix.ota.version=$(CMREMIX_BUILD_VERSION)

# Disable ADB authentication and set root access to Apps and ADB
ifeq ($(DISABLE_ADB_AUTH),true)
    ADDITIONAL_DEFAULT_PROPERTIES += \
        ro.adb.secure=3 \
        persist.sys.root_access=3
endif

EXTENDED_POST_PROCESS_PROPS := vendor/cmremix/tools/cmremix_process_props.py

# Inherite sabermod vendor
SM_VENDOR := vendor/sm
include $(SM_VENDOR)/Main.mk
