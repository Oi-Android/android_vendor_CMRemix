# Check for target product
ifeq (cmremix_n7000,$(TARGET_PRODUCT))

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 800

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_n7000.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/n7000/cm.mk)

PRODUCT_NAME := cmremix_n7000

endif
