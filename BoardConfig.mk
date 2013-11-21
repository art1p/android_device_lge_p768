USE_CAMERA_STUB := false
BOARD_USES_TI_CAMERA_HAL := true

# inherit from the proprietary version
-include vendor/lge/p768/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := omap4
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_BOOTLOADER_BOARD_NAME := p768
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := $(TARGET_CPU_VARIANT)
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_TLS_REGISTER := true
NEEDS_ARM_ERRATA_754319_754320 := true
BOARD_GLOBAL_CFLAGS += -DNEEDS_ARM_ERRATA_754319_754320

BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048


# Try to build the kernel
TARGET_KERNEL_CONFIG := cyanogenmod_p768_defconfig
TARGET_KERNEL_SOURCE := kernel/lge/omap4-custom

BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_HAS_NO_MISC_PARTITION := true

TARGET_RECOVERY_FSTAB = device/lge/p768/fstab.u2
RECOVERY_FSTAB_VERSION = 2

TARGET_BOOTLOADER_BOARD_NAME := p768

BOARD_EGL_CFG := device/lge/p768/egl.cfg

TARGET_USES_GL_VENDOR_EXTENSIONS := false

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/data/misc/wifi/fw_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/etc/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/fw_bcmdhd_apsta.bin"
BOARD_LEGACY_NL80211_STA_EVENTS := true

OMAP_ENHANCEMENT := true
OMAP_ENHANCEMENT_CPCAM := true

ifdef OMAP_ENHANCEMENT
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP4 -DOMAP_ENHANCEMENT_CPCAM -DOMAP_ENHANCEMENT_VTC
endif

BOARD_USES_TI_CAMERA_HAL := true
TI_OMAP4_CAMERAHAL_VARIANT := DONOTBUILDIT
HARDWARE_OMX := true

#TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun%d/file"

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1033686220
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2469606195
BOARD_FLASH_BLOCK_SIZE := 131072
USE_OPENGL_RENDERER := true
#BOARD_TOUCH_RECOVERY := true
#ENHANCED_DOMX := true

TARGET_SPECIFIC_HEADER_PATH := device/lge/p768/include

BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/lge/p768/vibrator.c

COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DHAVE_FM_RADIO


KERNEL_SGX_MODULES:
	make -C device/lge/p768/sgx-module/eurasia_km/eurasiacon/build/linux2/omap4430_android/ O=$(KERNEL_OUT) KERNELDIR=$(ANDROID_BUILD_TOP)/$(KERNEL_SRC) ARCH="arm" $(ARM_CROSS_COMPILE) KERNEL_CROSS_COMPILE=$(ARM_CROSS_COMPILE) TARGET_PRODUCT="blaze_tablet" BUILD=release TARGET_SGX=540 PLATFORM_VERSION=4.0
	mkdir -p $(TARGET_OUT)/modules/
	mv $(OUT)/target/*sgx540_120.ko $(TARGET_OUT)/modules/

TARGET_KERNEL_MODULES := KERNEL_SGX_MODULES

## Radio fixes
BOARD_RIL_CLASS := ../../../device/lge/p768/ril/

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/p768/bluetooth

BOARD_CUSTOM_GRAPHICS := ../../../device/lge/p768/recovery-gfx.c
BOARD_CHARGER_ENABLE_SUSPEND := true

BOARD_SEPOLICY_DIRS := \
    device/lge/p768/selinux

BOARD_SEPOLICY_UNION := \
    file_contexts \
    pvrsrvinit.te \
    device.te \
    domain.te

BOARD_HARDWARE_CLASS := device/lge/p768/cmhw/
BOARD_BLUEDROID_VENDOR_CONF := device/lge/p768/bluetooth/vnd_lge_p768.txt

#twrp
HAVE_SELINUX := true
TARGET_RECOVERY_INITRC := device/lge/p768/recovery/init.rc
DEVICE_RESOLUTION := 540x960
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TARGET_PREBUILT_RECOVERY_KERNEL := device/lge/p768/kernel
