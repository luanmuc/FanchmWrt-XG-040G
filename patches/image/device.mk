define Device/nokia_xg-040g-md-common
  $(call Device/FitImageLzma)
  DEVICE_VENDOR := Nokia
  DEVICE_MODEL := XG-040G-MD
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  UBINIZE_OPTS := -E 5
  KERNEL_LOADADDR := 0x80088000
  DEVICE_PACKAGES := kmod-gpio-button-hotplug kmod-leds-gpio \
    kmod-phy-airoha-en8811h kmod-regulator-userspace-consumer \
    kmod-usb-ledtrig-usbport kmod-usb3 kmod-usb-storage-uas \
    uboot-envtools ubi-utils
endef

define Device/nokia_xg-040g-md
  $(call Device/nokia_xg-040g-md-common)
  DEVICE_DTS := an7581-nokia_xg-040g-md
  DEVICE_DTS_CONFIG := config@1
  IMAGE_SIZE := 131968k
  KERNEL_SIZE := 8192k
  IMAGES += factory-kernel.bin factory-rootfs.bin
  IMAGE/factory-kernel.bin := append-kernel
  IMAGE/factory-rootfs.bin := append-ubi | check-size
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += nokia_xg-040g-md
