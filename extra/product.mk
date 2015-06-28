#################################
## cmRemiX Required Packages Apps
PRODUCT_PACKAGES += \
    OmniSwitch

# CMRemixOTA
PRODUCT_PACKAGES += \
    CMRemixOTA \
    CMRemixUpdater

# slim Apps
PRODUCT_PACKAGES += \
    SlimFileManager \
    DashClock \
    SlimLauncher

# Kernel Adiuter
PRODUCT_PACKAGES += \
    KernelAdiutor \
    FloatingActionButton

# Viper4Android
PRODUCT_COPY_FILES += \
vendor/cmremix/prebuilt/common/apk/ViPER4Android/ViPER4Android.apk:system/app/ViPER4Android/ViPER4Android.apk

# KCAL - Advanced color control for Qualcomm MDSS 8x26/8974/8084
PRODUCT_COPY_FILES += \
vendor/cmremix/prebuilt/common/apk/savoca-kcal/savoca-kcal.apk:system/app/savoca-kcal.apk

# MDNIE-tuner
PRODUCT_COPY_FILES += \
vendor/cmremix/prebuilt/common/apk/MDNIE-tuner/MDNIE-tuner.apk:system/app/MDNIE-tuner/MDNIE-tuner.apk

# OpenCamra
PRODUCT_COPY_FILES += \
vendor/cmremix/prebuilt/common/apk/OpenCamera/OpenCamera.apk:system/app/OpenCamera/OpenCamera.apk


