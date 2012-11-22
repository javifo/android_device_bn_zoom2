LOCAL_PATH := $(call my-dir)

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
$(INSTALLED_BOOTIMAGE_TARGET): $(TARGET_PREBUILT_KERNEL) $(MKBOOTIMG)
	$(call pretty,"Boot image: $@")
ifeq ($(HOST_OS),darwin)
	$(hide) mkdir -p $(PRODUCT_OUT)/bootfolder/
	$(hide) cp $(LOCAL_PATH)/prebuilt/boot/*.pgm $(LOCAL_PATH)/prebuilt/boot/*.bin $(LOCAL_PATH)/prebuilt/boot/MLO $(LOCAL_PATH)/prebuilt/boot/uRamdisk $(PRODUCT_OUT)/bootfolder/
	$(hide) cp $(TARGET_PREBUILT_KERNEL) $(PRODUCT_OUT)/bootfolder/uImage
	$(hide) hdiutil create -ov -megabytes 76 -fs MS-DOS -volname boot -srcfolder $(PRODUCT_OUT)/bootfolder $(PRODUCT_OUT)/boot
	$(hide) mv $(PRODUCT_OUT)/boot.dmg $(PRODUCT_OUT)/boot.img
else
# TODO - complete image creation for other architectures
endif