# inherit from the proprietary version
-include vendor/bn/zoom2/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := omap3
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp 
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp 
TARGET_BOOTLOADER_BOARD_NAME := zoom2
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_USERIMAGES_USE_EXT4 := true
#OMAP_ENHANCEMENT := true

TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/bn/zoom2/releasetools/encore_img_from_target_files
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/bn/zoom2/releasetools/encore_ota_from_target_files

#Nook Color command line
#BOARD_KERNEL_CMDLINE := no_console_suspend=1 msmsdcc_sdioirq=1 wire.search_count=5

#Nook Simple Touch orginal one
#BOARD_KERNEL_CMDLINE := console=ttyS0,115200n8 initrd rw init=/init vram=16M video=omap3epfb:mode=800x600x16x14x270x0,pmic=tps65180-1p2-i2c,vcom=-2030 androidboot.console=ttyS0
BOARD_KERNEL_CMDLINE := console=ttyUSB0,115200n8 init=/init vram=16M video=omap3epfb:mode=800x600x16x14x270x0,pmic=tps65180-1p2-i2c,vcom=-2030 androidboot.console=ttyS0
BOARD_KERNEL_BASE := 0x20000000
BOARD_PAGE_SIZE := 0x00000800

# 26.8.2012 Do not allow CM build to create boot.img, we'll create it
#BOARD_BOOTIMAGE_PARTITION_SIZE := 78433280
BOARD_CUSTOM_BOOTIMG_MK := device/bn/zoom2/custombootimg.mk

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 292438016 #292438016 # made multiple of 4096 - old 292436992
BOARD_USERDATAIMAGE_PARTITION_SIZE := 827691008
BOARD_CACHEIMAGE_PARTITION_SIZE := 243698688
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext3
BOARD_FLASH_BLOCK_SIZE := 4096

# 27.8.2012 Do'nt use yaffs for system and data, use ext4 instead
INTERNAL_USERIMAGES_USE_EXT := true
 
TARGET_PREBUILT_KERNEL := device/bn/zoom2/prebuilt/boot/kernel_sdcard
#TARGET_PREBUILT_RECOVERY_KERNEL := device/bn/zoom2/prebuilt/boot/kernel-recovery
TARGET_RECOVERY_INITRC := device/bn/zoom2/recovery.rc

BOARD_HAS_LARGE_FILESYSTEM := false
BOARD_RECOVERY_IGNORE_BOOTABLES := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/bn/zoom2/recovery/recovery_ui.c
TARGET_RECOVERY_PRE_COMMAND := "dd if=/dev/zero of=/rom/bcb bs=64 count=1 > /dev/null 2>&1 ; echo 'recovery' >> /rom/bcb ; sync"

# === 28.7.2012 - Use dummy audio device? NST has no sound card!!!
#BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_GENERIC_AUDIO := false

# Modem
TARGET_NO_RADIOIMAGE := true

# HW Graphics
OMAP3_GL := true

# Workaround for eglconfig error
BOARD_NO_RGBX_8888 := true

# use pre-kernel.35 vold usb mounting
BOARD_USE_USB_MASS_STORAGE_SWITCH := true

# Storage
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p6
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/mmcblk0p6
BOARD_VOLD_MAX_PARTITIONS := 8
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

## Wifi
#USES_TI_WL1271 := true
#BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
#ifdef USES_TI_WL1271
#BOARD_WLAN_DEVICE           := wl1271
#BOARD_SOFTAP_DEVICE         := wl1271
#endif
#WPA_SUPPLICANT_VERSION      := VER_0_6_X
#WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/tiwlan_drv.ko"
#WIFI_DRIVER_MODULE_NAME     := "tiwlan_drv"
#WIFI_FIRMWARE_LOADER        := "wlan_loader"
#WIFI_DRIVER_MODULE_ARG      := ""
#
## Bluetooth
#BOARD_HAVE_BLUETOOTH := true

BOARD_HAVE_FAKE_GPS := true

USE_CAMERA_STUB := true
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
BOARD_USES_TI_OMAP_MODEM_AUDIO := false
BOARD_HAS_NO_MISC_PARTITION := true
HARDWARE_OMX := true

ifdef HARDWARE_OMX
OMX_JPEG := true
OMX_VENDOR := ti
OMX_VENDOR_INCLUDES := \
  hardware/ti/omx/system/src/openmax_il/omx_core/inc \
  hardware/ti/omx/image/src/openmax_il/jpeg_enc/inc
OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
BOARD_OPENCORE_LIBRARIES := libOMX_Core
BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1
BOARD_CAMERA_LIBRARIES := libcamera
endif
      
ifdef OMAP_ENHANCEMENT
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT
endif

BOARD_USES_UBOOT := true

